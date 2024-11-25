#include "llvm/Transforms/Utils/CFFunctionInstrumentation.h"

using namespace llvm;

#define DEBUG_TYPE "cffunction-instrumentation"

using CFFunctionAnalysisInfo = SetVector<StringRef>;

PreservedAnalyses
CFFunctionInstrumentationPass::run(Module &M, ModuleAnalysisManager &AM) {

  CFFunctionAnalysisInfo CalledFunctions = AM.getResult<CFFunctionAnalysis>(M);

  errs() << " ================\n";
  errs() << "Called functions: ";
  for (auto &CalledFunction : CalledFunctions) {
    errs() << CalledFunction << " ";
  }
  errs() << "\n";

  for (auto &F : M) {
    if (F.isDeclaration()) {
      continue;
    }

    StringRef FunctionName = F.getName();
    errs() << " ================\n";
    errs() << "Function: " << FunctionName << "\n";
    if (std::find(CalledFunctions.begin(), CalledFunctions.end(),
                  FunctionName) != CalledFunctions.end()) {
      errs() << "Instrumenting function " << FunctionName << "\n";
    }
  }

  return PreservedAnalyses::all();
}
