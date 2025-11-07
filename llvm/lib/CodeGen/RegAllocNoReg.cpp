//===-- RegAllocNoReg.cpp - No Register Allocator ----------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines the RANoReg allocator, a register allocator that spills all
// virtual registers and never allocates any physical registers.
//
//===----------------------------------------------------------------------===//

#include "AllocationOrder.h"
#include "RegAllocBase.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Analysis/ProfileSummaryInfo.h"
#include "llvm/CodeGen/CalcSpillWeights.h"
#include "llvm/CodeGen/LiveDebugVariables.h"
#include "llvm/CodeGen/LiveIntervals.h"
#include "llvm/CodeGen/LiveRangeEdit.h"
#include "llvm/CodeGen/LiveRegMatrix.h"
#include "llvm/CodeGen/LiveStacks.h"
#include "llvm/CodeGen/MachineBlockFrequencyInfo.h"
#include "llvm/CodeGen/MachineDominators.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineLoopInfo.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/CodeGen/RegAllocRegistry.h"
#include "llvm/CodeGen/Spiller.h"
#include "llvm/CodeGen/TargetRegisterInfo.h"
#include "llvm/CodeGen/VirtRegMap.h"
#include "llvm/Pass.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"
#include <queue>

using namespace llvm;

#define DEBUG_TYPE "regalloc"

static RegisterRegAlloc NoRegAlloc("noreg", "no register allocator",
                                      createNoRegRegisterAllocator);

namespace {
  struct CompSpillWeight {
    bool operator()(const LiveInterval *A, const LiveInterval *B) const {
      return A->weight() < B->weight();
    }
  };
}

namespace {
/// RANoReg provides a minimal implementation of a register allocator that spills
/// all virtual registers and never allocates any physical registers.
class RANoReg : public MachineFunctionPass,
                public RegAllocBase,
                private LiveRangeEdit::Delegate {
  // context
  MachineFunction *MF = nullptr;

  // state
  std::unique_ptr<Spiller> SpillerInstance;
  std::priority_queue<const LiveInterval *, std::vector<const LiveInterval *>,
                      CompSpillWeight>
      Queue;

  // Scratch space.  Allocated here to avoid repeated malloc calls in
  // selectOrSplit().
  BitVector UsableRegs;

  bool LRE_CanEraseVirtReg(Register) override;
  void LRE_WillShrinkVirtReg(Register) override;

public:
  RANoReg(const RegAllocFilterFunc F = nullptr);

  /// Return the pass name.
  StringRef getPassName() const override { return "No Register Allocator"; }

  /// RANoReg analysis usage.
  void getAnalysisUsage(AnalysisUsage &AU) const override;

  void releaseMemory() override;

  Spiller &spiller() override { return *SpillerInstance; }

  void enqueueImpl(const LiveInterval *LI) override { Queue.push(LI); }

  const LiveInterval *dequeue() override {
    if (Queue.empty())
      return nullptr;
    const LiveInterval *LI = Queue.top();
    Queue.pop();
    return LI;
  }

  MCRegister selectOrSplit(const LiveInterval &VirtReg,
                           SmallVectorImpl<Register> &SplitVRegs) override;

  /// Perform register allocation.
  bool runOnMachineFunction(MachineFunction &mf) override;

  MachineFunctionProperties getRequiredProperties() const override {
    return MachineFunctionProperties().set(
        MachineFunctionProperties::Property::NoPHIs);
  }

  MachineFunctionProperties getClearedProperties() const override {
    return MachineFunctionProperties().set(
      MachineFunctionProperties::Property::IsSSA);
  }

  static char ID;
};

char RANoReg::ID = 0;

} // end anonymous namespace

char &llvm::RANoRegID = RANoReg::ID;

INITIALIZE_PASS_BEGIN(RANoReg, "regallocnoreg", "No Register Allocator",
                      false, false)
//INITIALIZE_PASS_DEPENDENCY(LiveDebugVariablesWrapperLegacy)
//INITIALIZE_PASS_DEPENDENCY(SlotIndexesWrapperPass)
//INITIALIZE_PASS_DEPENDENCY(LiveIntervalsWrapperPass)
//INITIALIZE_PASS_DEPENDENCY(RegisterCoalescer)
//INITIALIZE_PASS_DEPENDENCY(MachineScheduler)
//INITIALIZE_PASS_DEPENDENCY(LiveStacksWrapperLegacy)
//INITIALIZE_PASS_DEPENDENCY(AAResultsWrapperPass)
//INITIALIZE_PASS_DEPENDENCY(MachineDominatorTreeWrapperPass)
//INITIALIZE_PASS_DEPENDENCY(MachineLoopInfoWrapperPass)
//INITIALIZE_PASS_DEPENDENCY(VirtRegMapWrapperLegacy)
//INITIALIZE_PASS_DEPENDENCY(LiveRegMatrixWrapperLegacy)
//INITIALIZE_PASS_DEPENDENCY(ProfileSummaryInfoWrapperPass)
INITIALIZE_PASS_END(RANoReg, "regallocnoreg", "No Register Allocator", false,
                    false)

bool RANoReg::LRE_CanEraseVirtReg(Register VirtReg) {
  LiveInterval &LI = LIS->getInterval(VirtReg);
  if (VRM->hasPhys(VirtReg)) {
    Matrix->unassign(LI);
    aboutToRemoveInterval(LI);
    return true;
  }
  // Unassigned virtreg is probably in the priority queue.
  // RegAllocBase will erase it after dequeueing.
  // Nonetheless, clear the live-range so that the debug
  // dump will show the right state for that VirtReg.
  LI.clear();
  return false;
}

void RANoReg::LRE_WillShrinkVirtReg(Register VirtReg) {
  if (!VRM->hasPhys(VirtReg))
    return;

  // Register is assigned, put it back on the queue for reassignment.
  LiveInterval &LI = LIS->getInterval(VirtReg);
  Matrix->unassign(LI);
  enqueue(&LI);
}

RANoReg::RANoReg(RegAllocFilterFunc F)
    : MachineFunctionPass(ID), RegAllocBase(F) {}

void RANoReg::getAnalysisUsage(AnalysisUsage &AU) const {
  AU.setPreservesCFG();
  AU.addRequired<AAResultsWrapperPass>();
  AU.addPreserved<AAResultsWrapperPass>();
  AU.addRequired<LiveIntervalsWrapperPass>();
  AU.addPreserved<LiveIntervalsWrapperPass>();
  AU.addPreserved<SlotIndexesWrapperPass>();
  AU.addRequired<LiveDebugVariablesWrapperLegacy>();
  AU.addPreserved<LiveDebugVariablesWrapperLegacy>();
  AU.addRequired<LiveStacksWrapperLegacy>();
  AU.addPreserved<LiveStacksWrapperLegacy>();
  AU.addRequired<ProfileSummaryInfoWrapperPass>();
  AU.addRequired<MachineBlockFrequencyInfoWrapperPass>();
  AU.addPreserved<MachineBlockFrequencyInfoWrapperPass>();
  AU.addRequired<MachineDominatorTreeWrapperPass>();
  AU.addRequiredID(MachineDominatorsID);
  AU.addPreservedID(MachineDominatorsID);
  AU.addRequired<MachineLoopInfoWrapperPass>();
  AU.addPreserved<MachineLoopInfoWrapperPass>();
  AU.addRequired<VirtRegMapWrapperLegacy>();
  AU.addPreserved<VirtRegMapWrapperLegacy>();
  AU.addRequired<LiveRegMatrixWrapperLegacy>();
  AU.addPreserved<LiveRegMatrixWrapperLegacy>();
  MachineFunctionPass::getAnalysisUsage(AU);
}

void RANoReg::releaseMemory() {
  SpillerInstance.reset();
}

// Driver for the register assignment and splitting heuristics.
// Manages iteration over the LiveIntervalUnions.
//
// This implementation always spills the virtual register.
MCRegister RANoReg::selectOrSplit(const LiveInterval &VirtReg,
                                  SmallVectorImpl<Register> &SplitVRegs) {

  if (VirtReg.isSpillable()) {
    LLVM_DEBUG(dbgs() << "spilling: " << VirtReg << '\n');
    LiveRangeEdit LRE(&VirtReg, SplitVRegs, *MF, *LIS, VRM, this, &DeadRemats);
    spiller().spill(LRE);
    // The live virtual register requesting allocation was spilled, so tell
    // the caller not to allocate anything during this round.
    return 0;
  }

  LLVM_DEBUG(dbgs() << "cannot spill: " << VirtReg << '\n');
  // we allocate this register

  auto Order = AllocationOrder::create(VirtReg.reg(), *VRM, RegClassInfo, Matrix);
  for (MCRegister PhysReg : Order) {
    assert(PhysReg.isValid());
    // Check for interference in PhysReg
    switch (Matrix->checkInterference(VirtReg, PhysReg)) {
    case LiveRegMatrix::IK_Free:

      // PhysReg is available, allocate it.
      return PhysReg;
    case LiveRegMatrix::IK_VirtReg:
      continue;

    default:
      continue;
    }
  }

  return 0;
}

bool RANoReg::runOnMachineFunction(MachineFunction &mf) {
  LLVM_DEBUG(dbgs() << "********** NoReg REGISTER ALLOCATION **********\n"
                    << "********** Function: " << mf.getName() << '\n');

  MF = &mf;
  auto &MBFI = getAnalysis<MachineBlockFrequencyInfoWrapperPass>().getMBFI();
  auto &LiveStks = getAnalysis<LiveStacksWrapperLegacy>().getLS();
  auto &MDT = getAnalysis<MachineDominatorTreeWrapperPass>().getDomTree();

  RegAllocBase::init(getAnalysis<VirtRegMapWrapperLegacy>().getVRM(),
                     getAnalysis<LiveIntervalsWrapperPass>().getLIS(),
                     getAnalysis<LiveRegMatrixWrapperLegacy>().getLRM());
  VirtRegAuxInfo VRAI(*MF, *LIS, *VRM,
                      getAnalysis<MachineLoopInfoWrapperPass>().getLI(), MBFI,
                      &getAnalysis<ProfileSummaryInfoWrapperPass>().getPSI());
  VRAI.calculateSpillWeightsAndHints();

  SpillerInstance.reset(
      createInlineSpiller({*LIS, LiveStks, MDT, MBFI}, *MF, *VRM, VRAI));

  allocatePhysRegs();
  postOptimization();

  // Diagnostic output before rewriting
  LLVM_DEBUG(dbgs() << "Post alloc VirtRegMap:\n" << *VRM << "\n");

  releaseMemory();
  return true;
}

FunctionPass* llvm::createNoRegRegisterAllocator() {
  return new RANoReg();
}

FunctionPass *llvm::createNoRegRegisterAllocator(RegAllocFilterFunc F) {
  return new RANoReg(F);
}
