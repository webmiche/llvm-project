//===- RegAllocBase.cpp - Register Allocator Base Class -------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines the RegAllocBase class which provides common functionality
// for LiveIntervalUnion-based register allocators.
//
//===----------------------------------------------------------------------===//

#include "RegAllocBase.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/CodeGen/LiveInterval.h"
#include "llvm/CodeGen/LiveIntervals.h"
#include "llvm/CodeGen/LiveRegMatrix.h"
#include "llvm/CodeGen/MachineInstr.h"
#include "llvm/CodeGen/MachineModuleInfo.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/Spiller.h"
#include "llvm/CodeGen/TargetRegisterInfo.h"
#include "llvm/CodeGen/VirtRegMap.h"
#include "llvm/IR/DiagnosticInfo.h"
#include "llvm/IR/Module.h"
#include "llvm/Pass.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/Timer.h"
#include "llvm/Support/raw_ostream.h"
#include <cassert>

#include <chrono>
#include <thread>
#include <iostream>

using namespace llvm;

#define DEBUG_TYPE "regalloc"

STATISTIC(NumNewQueued, "Number of new live ranges queued");

// Temporary verification option until we can put verification inside
// MachineVerifier.
static cl::opt<bool, true>
    VerifyRegAlloc("verify-regalloc", cl::location(RegAllocBase::VerifyEnabled),
                   cl::Hidden, cl::desc("Verify during register allocation"));

enum IntfGraphFormat {
  none, dot, simple
};
static cl::opt<IntfGraphFormat> EmitIntfGraph("emit-intf-graph", cl::values(
  clEnumVal(none, "no intf graph"), clEnumVal(dot, ".dot file"), clEnumVal(simple, ".txt file with edge pairs")
));
static cl::opt<bool, true> PrintVirtualRegisters("print-vregs", cl::location(RegAllocBase::PrintVRegs));

const char RegAllocBase::TimerGroupName[] = "regalloc";
const char RegAllocBase::TimerGroupDescription[] = "Register Allocation";
bool RegAllocBase::VerifyEnabled = false;
bool RegAllocBase::PrintVRegs = false;
cl::list<unsigned> RegAllocBase::IgnoreRegs("ignore-regs", cl::CommaSeparated);

//===----------------------------------------------------------------------===//
//                         RegAllocBase Implementation
//===----------------------------------------------------------------------===//

// Pin the vtable to this file.
void RegAllocBase::anchor() {}

void RegAllocBase::init(VirtRegMap &vrm, LiveIntervals &lis,
                        LiveRegMatrix &mat) {
  TRI = &vrm.getTargetRegInfo();
  MRI = &vrm.getRegInfo();
  VRM = &vrm;
  LIS = &lis;
  Matrix = &mat;
  MRI->freezeReservedRegs();
  RegClassInfo.runOnMachineFunction(vrm.getMachineFunction());
}

// Visit all the live registers. If they are already assigned to a physical
// register, unify them with the corresponding LiveIntervalUnion, otherwise push
// them on the priority queue for later assignment.
void RegAllocBase::seedLiveRegs() {
  NamedRegionTimer T("seed", "Seed Live Regs", TimerGroupName,
                     TimerGroupDescription, TimePassesIsEnabled);
  for (unsigned i = 0, e = MRI->getNumVirtRegs(); i != e; ++i) {
    Register Reg = Register::index2VirtReg(i);
    if (MRI->reg_nodbg_empty(Reg))
      continue;
    if (std::find(IgnoreRegs.begin(), IgnoreRegs.end(), Register::virtReg2Index(Reg)) == IgnoreRegs.end()) {
      if (PrintVRegs) outs() << Register::virtReg2Index(Reg) << ",";
      enqueue(&LIS->getInterval(Reg));
    }
  }
}

void RegAllocBase::emitIntfGraph() {
  std::string Filename = ((MRI->getMF()).getName() + (EmitIntfGraph == dot ? ".dot" : ".txt")).str();

  outs() << (MRI->getMF()).getName() << "\n";
  std::string output;

  if (EmitIntfGraph == dot) {
    output += "graph {\n\toutputorder=edgesfirst;\n\toverlap_scaling=10;\n\n";
  } else {
    output += "Number of virtual registers: " + std::to_string(MRI->getNumVirtRegs()) + "\n";
  }

  for (unsigned i = 0, e = MRI->getNumVirtRegs(); i != e; ++i) {
    Register Reg = Register::index2VirtReg(i);
    if (MRI->reg_nodbg_empty(Reg) || std::find(IgnoreRegs.begin(), IgnoreRegs.end(), Register::virtReg2Index(Reg)) != IgnoreRegs.end())
      continue;

    if (EmitIntfGraph == dot) output += "\tNode" + std::to_string(Register::virtReg2Index(Reg)) + " [label=\"" + std::to_string(Register::virtReg2Index(Reg)) + "\", shape=box, style=filled, color=blue];\n";
    for (unsigned j = 0; j != i; ++j) {
      Register Reg1 = Register::index2VirtReg(j);
      if (MRI->reg_nodbg_empty(Reg1) || std::find(IgnoreRegs.begin(), IgnoreRegs.end(), Register::virtReg2Index(Reg1)) != IgnoreRegs.end())
        continue;
      if ((LIS->getInterval(Reg)).overlaps(LIS->getInterval(Reg1))) {
        if (EmitIntfGraph == dot) output += "\tNode" + std::to_string(Register::virtReg2Index(Reg)) + " -- Node" + std::to_string(Register::virtReg2Index(Reg1)) + ";\n";
        else output += std::to_string(Register::virtReg2Index(Reg)) + " " + std::to_string(Register::virtReg2Index(Reg1)) + "\n";
      }
    }
  }
  if (EmitIntfGraph == dot) {
    output += "}\n";
    std::error_code EC;
    raw_fd_ostream file(Filename, EC);
    assert(EC.value() == 0 && "Couldn't create file");
    file << output;
    file.close();
  }
  else {
    output += "-1\n";
    outs() << output;
  }
}

// Top-level driver to manage the queue of unassigned VirtRegs and call the
// selectOrSplit implementation.
void RegAllocBase::allocatePhysRegs() {
  if (EmitIntfGraph != none)
    emitIntfGraph();

  seedLiveRegs();

  // Continue assigning vregs one at a time to available physical registers.
  while (const LiveInterval *VirtReg = dequeue()) {
    assert(!VRM->hasPhys(VirtReg->reg()) && "Register already assigned");

    // Unused registers can appear when the spiller coalesces snippets.
    if (MRI->reg_nodbg_empty(VirtReg->reg())) {
      LLVM_DEBUG(dbgs() << "Dropping unused " << *VirtReg << '\n');
      aboutToRemoveInterval(*VirtReg);
      LIS->removeInterval(VirtReg->reg());
      continue;
    }

    // Invalidate all interference queries, live ranges could have changed.
    Matrix->invalidateVirtRegs();

    // selectOrSplit requests the allocator to return an available physical
    // register if possible and populate a list of new live intervals that
    // result from splitting.
    LLVM_DEBUG(dbgs() << "\nselectOrSplit "
                      << TRI->getRegClassName(MRI->getRegClass(VirtReg->reg()))
                      << ':' << *VirtReg << '\n');

    using VirtRegVec = SmallVector<Register, 4>;

    VirtRegVec SplitVRegs;
    MCRegister AvailablePhysReg = selectOrSplit(*VirtReg, SplitVRegs);

    if (AvailablePhysReg == ~0u) {
      // selectOrSplit failed to find a register!
      // Probably caused by an inline asm.
      MachineInstr *MI = nullptr;
      for (MachineInstr &MIR : MRI->reg_instructions(VirtReg->reg())) {
        MI = &MIR;
        if (MI->isInlineAsm())
          break;
      }

      const TargetRegisterClass *RC = MRI->getRegClass(VirtReg->reg());
      AvailablePhysReg = getErrorAssignment(*RC, MI);

      // Keep going after reporting the error.
      VRM->assignVirt2Phys(VirtReg->reg(), AvailablePhysReg);
    } else if (AvailablePhysReg)
      Matrix->assign(*VirtReg, AvailablePhysReg);

    for (Register Reg : SplitVRegs) {
      assert(LIS->hasInterval(Reg));

      LiveInterval *SplitVirtReg = &LIS->getInterval(Reg);
      assert(!VRM->hasPhys(SplitVirtReg->reg()) && "Register already assigned");
      if (MRI->reg_nodbg_empty(SplitVirtReg->reg())) {
        assert(SplitVirtReg->empty() && "Non-empty but used interval");
        LLVM_DEBUG(dbgs() << "not queueing unused  " << *SplitVirtReg << '\n');
        aboutToRemoveInterval(*SplitVirtReg);
        LIS->removeInterval(SplitVirtReg->reg());
        continue;
      }
      LLVM_DEBUG(dbgs() << "queuing new interval: " << *SplitVirtReg << "\n");
      assert(SplitVirtReg->reg().isVirtual() &&
             "expect split value in virtual register");
      enqueue(SplitVirtReg);
      ++NumNewQueued;
    }
  }
}

void RegAllocBase::postOptimization() {
  spiller().postOptimization();
  for (auto *DeadInst : DeadRemats) {
    LIS->RemoveMachineInstrFromMaps(*DeadInst);
    DeadInst->eraseFromParent();
  }
  DeadRemats.clear();
}

void RegAllocBase::enqueue(const LiveInterval *LI) {
  const Register Reg = LI->reg();

  assert(Reg.isVirtual() && "Can only enqueue virtual registers");

  if (VRM->hasPhys(Reg))
    return;

  if (shouldAllocateRegister(Reg)) {
    LLVM_DEBUG(dbgs() << "Enqueuing " << printReg(Reg, TRI) << '\n');
    enqueueImpl(LI);
  } else {
    LLVM_DEBUG(dbgs() << "Not enqueueing " << printReg(Reg, TRI)
                      << " in skipped register class\n");
  }
}

MCPhysReg RegAllocBase::getErrorAssignment(const TargetRegisterClass &RC,
                                           const MachineInstr *CtxMI) {
  MachineFunction &MF = VRM->getMachineFunction();

  // Avoid printing the error for every single instance of the register. It
  // would be better if this were per register class.
  bool EmitError = !MF.getProperties().hasProperty(
      MachineFunctionProperties::Property::FailedRegAlloc);
  if (EmitError)
    MF.getProperties().set(MachineFunctionProperties::Property::FailedRegAlloc);

  const Function &Fn = MF.getFunction();
  LLVMContext &Context = Fn.getContext();

  ArrayRef<MCPhysReg> AllocOrder = RegClassInfo.getOrder(&RC);
  if (AllocOrder.empty()) {
    // If the allocation order is empty, it likely means all registers in the
    // class are reserved. We still to need to pick something, so look at the
    // underlying class.
    ArrayRef<MCPhysReg> RawRegs = RC.getRegisters();

    if (EmitError) {
      Context.diagnose(DiagnosticInfoRegAllocFailure(
          "no registers from class available to allocate", Fn,
          CtxMI ? CtxMI->getDebugLoc() : DiagnosticLocation()));
    }

    assert(!RawRegs.empty() && "register classes cannot have no registers");
    return RawRegs.front();
  }

  if (EmitError) {
    if (CtxMI && CtxMI->isInlineAsm()) {
      CtxMI->emitInlineAsmError(
          "inline assembly requires more registers than available");
    } else {
      Context.diagnose(DiagnosticInfoRegAllocFailure(
          "ran out of registers during register allocation", Fn,
          CtxMI ? CtxMI->getDebugLoc() : DiagnosticLocation()));
    }
  }

  return AllocOrder.front();
}
