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
    std::string fileName = "function_trace.txt";
    StringRef funcFileName = StringRef(fileName);
    // for all return instructions, print the return value to a file with the
    // name of the function
    for (auto &BB : F) {
      // Do NOT reinstrument the inserted blocks
      if (BB.getName() == "return" || BB.getName() == "print" ||
          BB.getName() == "open") {
        continue;
      }
      if (auto *RI = dyn_cast<ReturnInst>(BB.getTerminator())) {
        auto *retVal = RI->getReturnValue();
        if (retVal) {
          if (!retVal->getType()->isIntegerTy()) {
            continue;
          }
          LLVM_DEBUG(dbgs() << "Return value: ");
          LLVM_DEBUG(dbgs() << *RI->getReturnValue() << "\n");

          // insert call to print function
          IRBuilder<> OrigBuilder(RI);
          FunctionCallee OpenFunc = M.getOrInsertFunction(
              "fopen", FunctionType::get(PointerType::get(M.getContext(), 0),
                                         {PointerType::get(M.getContext(), 0),
                                          PointerType::get(M.getContext(), 0)},
                                         false));
          Value *FileName = OrigBuilder.CreateGlobalStringPtr(funcFileName);
          Value *WritePermission = OrigBuilder.CreateGlobalStringPtr("a");
          Value *ReadPermission = OrigBuilder.CreateGlobalStringPtr("r");

          // split at return
          BasicBlock *ReturnBB = BB.splitBasicBlock(RI, "return", false);

          BasicBlock *OpenBB = BasicBlock::Create(M.getContext(), "open", &F);
          BasicBlock *PrintBB = BasicBlock::Create(M.getContext(), "print", &F);

          IRBuilder<> OpenBuilder(OpenBB);
          Value *read_fptr =
              OpenBuilder.CreateCall(OpenFunc, {FileName, ReadPermission});

          Value *Cmp = OpenBuilder.CreateICmpNE(
              read_fptr,
              ConstantPointerNull::get(PointerType::get(M.getContext(), 0)));
          OpenBuilder.CreateCondBr(Cmp, PrintBB, ReturnBB);

          IRBuilder<> PrintBuilder(PrintBB);
          FunctionCallee PrintFunc = M.getOrInsertFunction(
              "fprintf",
              FunctionType::get(Type::getVoidTy(M.getContext()),
                                PointerType::get(M.getContext(), 0), true));
          Value *formatStrPtr =
              PrintBuilder.CreateGlobalStringPtr(funcFormatStr);
          // if the file pointer is null, return
          FunctionCallee CloseFunc = M.getOrInsertFunction(
              "fclose",
              FunctionType::get(Type::getInt32Ty(M.getContext()),
                                {PointerType::get(M.getContext(), 0)}, false));
          PrintBuilder.CreateCall(CloseFunc, read_fptr);

          Value *write_fptr =
              PrintBuilder.CreateCall(OpenFunc, {FileName, WritePermission});
          PrintBuilder.CreateCall(PrintFunc,
                                  {write_fptr, formatStrPtr, retVal});

          // insert call to fclose

          PrintBuilder.CreateCall(CloseFunc, write_fptr);
          PrintBuilder.CreateBr(ReturnBB);

          BB.getTerminator()->setSuccessor(0, OpenBB);

          // place new BBs in the correct order
          ReturnBB->moveAfter(PrintBB);
        }
      }
    }
  }

  return PreservedAnalyses::all();
}
