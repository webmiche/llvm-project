#include "llvm/Transforms/Utils/FunctionInstrumentation.h"

using namespace llvm;

#define DEBUG_TYPE "function-instrumentation"

PreservedAnalyses
FunctionInstrumentationPass::run(Function &F, FunctionAnalysisManager &AM) {
  LLVM_DEBUG(dbgs() << "=========================\n");
  LLVM_DEBUG(dbgs() << "Function: ");
  LLVM_DEBUG(dbgs() << F.getName() << " " << *(F.getReturnType()) << "\n");
  for (auto &BB : F) {
    LLVM_DEBUG(dbgs() << "BasicBlock: ");
    LLVM_DEBUG(dbgs() << BB.getName() << "\n");
    if (auto *BI = dyn_cast<ReturnInst>(BB.getTerminator())) {
      LLVM_DEBUG(dbgs() << *BI << "\n");
      continue;
    }
    BranchInst *BI = dyn_cast<BranchInst>(BB.getTerminator());
    LLVM_DEBUG(dbgs() << *BI << "\n");
    // get defs of BI
    SmallVector<Instruction *, 10> users;
    users.push_back(BI);
    while (!users.empty()) {
      Instruction *I = users.back();
      users.pop_back();
      LLVM_DEBUG(dbgs() << *I << "\n");
      // if I is a call instruction, add it to CIs
      if (auto *CI = dyn_cast<CallInst>(I)) {
        CalledFunctions.insert(CI->getCalledFunction()->getName());
        continue;
      }
      // else add all users of I to users
      for (Use &U : I->operands()) {
        if (PHINode *PN = dyn_cast<PHINode>(U)) {
          LLVM_DEBUG(dbgs() << "skipping phi: ");
          LLVM_DEBUG(dbgs() << *PN << "\n");
        } else if (Instruction *UI = dyn_cast<Instruction>(U)) {
          LLVM_DEBUG(dbgs() << "user: ");
          LLVM_DEBUG(dbgs() << *UI << "\n");
          users.push_back(UI);
        } else if (auto *label = dyn_cast<BasicBlock>(U)) {
          LLVM_DEBUG(dbgs() << "label: ");
          LLVM_DEBUG(dbgs() << label->getName() << "\n");
        } else {
          LLVM_DEBUG(dbgs() << "not a covered instruction: ");
          LLVM_DEBUG(dbgs() << *U << "\n");
        }
      }
    }
  }

  errs() << "Called functions for " << F.getName() << ":\n";
  for (auto &F : CalledFunctions) {
    errs() << F << "\n";
  }
  errs() << "\n";
  CalledFunctions.clear();

  return PreservedAnalyses::all();
}
