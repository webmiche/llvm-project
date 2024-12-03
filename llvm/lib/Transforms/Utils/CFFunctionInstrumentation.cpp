#include "llvm/Transforms/Utils/CFFunctionInstrumentation.h"

using namespace llvm;

#define DEBUG_TYPE "cffunction-instrumentation"

using CFFunctionAnalysisInfo = SetVector<StringRef>;

PreservedAnalyses
CFFunctionInstrumentationPass::run(Module &M, ModuleAnalysisManager &AM) {

  CFFunctionAnalysisInfo CalledFunctions = AM.getResult<CFFunctionAnalysis>(M);
  for (auto &F : M) {
    if (F.isDeclaration()) {
      continue;
    }

    // print the return value of the function
    LLVM_DEBUG(dbgs() << "=========================\n");
    LLVM_DEBUG(dbgs() << "Function: ");
    LLVM_DEBUG(dbgs() << F.getName() << " " << *(F.getReturnType()) << "\n");

    if (!CalledFunctions.count(F.getName())) {
      continue;
    }

    std::string outputString = F.getName().str() + " return value: %lld\n";
    StringRef funcFormatStr = StringRef(outputString);
    std::string fileName = F.getName().str() + ".txt";
    StringRef funcFileName = StringRef(fileName);
    // for all return instructions, print the return value to a file with the
    // name of the function
    for (auto &BB : F) {
      if (auto *RI = dyn_cast<ReturnInst>(BB.getTerminator())) {
        auto *retVal = RI->getReturnValue();
        if (retVal) {
          if (!retVal->getType()->isIntegerTy()) {
            continue;
          }
          LLVM_DEBUG(dbgs() << "Return value: ");
          LLVM_DEBUG(dbgs() << *RI->getReturnValue() << "\n");

          // insert call to print function
          IRBuilder<> Builder(RI);
          FunctionCallee OpenFunc = M.getOrInsertFunction(
              "fopen", FunctionType::get(PointerType::get(M.getContext(), 0),
                                         {PointerType::get(M.getContext(), 0),
                                          PointerType::get(M.getContext(), 0)},
                                         false));
          FunctionCallee PrintFunc = M.getOrInsertFunction(
              "fprintf",
              FunctionType::get(Type::getVoidTy(M.getContext()),
                                PointerType::get(M.getContext(), 0), true));
          Value *FileName = Builder.CreateGlobalStringPtr(funcFileName);
          Value *WritePermission = Builder.CreateGlobalStringPtr("w");
          Value *formatStrPtr = Builder.CreateGlobalStringPtr(funcFormatStr);
          Value *fptr =
              Builder.CreateCall(OpenFunc, {FileName, WritePermission});
          Builder.CreateCall(PrintFunc, {fptr, formatStrPtr, retVal});
        }
      }
    }
  }

  return PreservedAnalyses::all();
}
