#include "llvm/Analysis/CFFunctionAnalysis.h"

using namespace llvm;

#define DEBUG_TYPE "cffunction-analysis"

// Provide a definition for the static object used to identify passes.
AnalysisKey CFFunctionAnalysis::Key;

CFFunctionAnalysisInfo analyse(Module &M) {
  CFFunctionAnalysisInfo CalledFunctions;
  for (auto &F : M) {
    if (F.isDeclaration()) {
      continue;
    }
    LLVM_DEBUG(dbgs() << "=========================\n");
    LLVM_DEBUG(dbgs() << "Function: ");
    LLVM_DEBUG(dbgs() << F.getName() << " " << *(F.getReturnType()) << "\n");
    SmallVector<Instruction *, 10> visited_users;
    for (auto &BB : F) {
      LLVM_DEBUG(dbgs() << "BasicBlock: ");
      LLVM_DEBUG(dbgs() << BB.getName() << "\n");
      LLVM_DEBUG(dbgs() << BB << "\n");
      auto terminator = BB.getTerminator();
      if (!isa<BranchInst>(terminator) && !isa<SwitchInst>(terminator)) {
        LLVM_DEBUG(dbgs() << "terminator: ");
        LLVM_DEBUG(dbgs() << *terminator << "\n");
      }
      LLVM_DEBUG(dbgs() << *BB.getTerminator() << "\n");
      // get defs of BI
      SmallVector<Instruction *, 10> users;
      users.push_back(BB.getTerminator());
      visited_users.push_back(BB.getTerminator());
      while (!users.empty()) {
        Instruction *I = users.back();
        users.pop_back();
        visited_users.push_back(I);
        LLVM_DEBUG(dbgs() << "Currently handling: " << *I << "\n");
        // if I is a call instruction, add it to CIs
        if (auto *CI = dyn_cast<CallInst>(I)) {
          if (!CI->getCalledFunction()) {
            LLVM_DEBUG(dbgs() << "indirect call: ");
            LLVM_DEBUG(dbgs() << *CI << "\n");
            continue;
          }
          CalledFunctions.insert(CI->getCalledFunction()->getName());
          continue;
        }
        // else add all users of I to users
        for (Use &U : I->operands()) {
          if (Instruction *UI = dyn_cast<Instruction>(U)) {
            LLVM_DEBUG(dbgs() << "user: ");
            LLVM_DEBUG(dbgs() << *UI << "\n");
            if (std::find(visited_users.begin(), visited_users.end(), UI) !=
                visited_users.end()) {
              LLVM_DEBUG(dbgs() << "already visited: ");
              LLVM_DEBUG(dbgs() << *UI << "\n");
              continue;
            }
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
  }

  return CalledFunctions;
}

CFFunctionAnalysisInfo CFFunctionAnalysis::run(Module &M,
                                               ModuleAnalysisManager &AM) {

  CFFunctionAnalysisInfo CalledFunctions;

  // check if called functions file exists
  std::ifstream file("called_functions.txt");
  if (file.good()) {
    std::string line;
    while (std::getline(file, line)) {
      char *cstr = new char[line.length() + 1];
      strcpy(cstr, line.c_str());
      CalledFunctions.insert(cstr);
    }
  } else {
    CalledFunctions = analyse(M);
  }
  file.close();
  return CalledFunctions;
}

PreservedAnalyses
CFFunctionAnalysisPrinterPass::run(Module &M, ModuleAnalysisManager &AM) {
  OS << "Called functions for " << M.getName() << ":\n";
  for (auto &F : AM.getResult<CFFunctionAnalysis>(M)) {
    OS << F << "\n";
  }
  OS << "\n";
  return PreservedAnalyses::all();
}

PreservedAnalyses CFFunctionAnalysisStorePass::run(Module &M,
                                                   ModuleAnalysisManager &AM) {
  CFFunctionAnalysisInfo CalledFunctions = AM.getResult<CFFunctionAnalysis>(M);

  // store called functions to called_functions.txt
  std::ofstream out;
  out.open(Filename, std::ios::app);

  if (!out) {
    errs() << "Error: cannot open file " << Filename << "\n";
    return PreservedAnalyses::none();
  }

  for (auto &F : CalledFunctions) {
    out << F.str() << " called from " << M.getName().str() << "\n";
  }

  out.close();

  return PreservedAnalyses::all();
}
