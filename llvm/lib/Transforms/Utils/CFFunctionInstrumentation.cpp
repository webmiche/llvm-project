#include "llvm/Transforms/Utils/CFFunctionInstrumentation.h"

using namespace llvm;

#define DEBUG_TYPE "cffunction-instrumentation"

using CFFunctionAnalysisInfo = SetVector<StringRef>;

PreservedAnalyses
CFFunctionInstrumentationPass::run(Module &M, ModuleAnalysisManager &AM) {

  CFFunctionAnalysisInfo CalledFunctions = AM.getResult<CFFunctionAnalysis>(M);
  LLVM_DEBUG(
      for (auto &F
           : CalledFunctions) { dbgs() << "Called function: " << F << "\n"; });
  int permissions_created = 0;
  Value *WritePermission = nullptr;
  Value *FileName = nullptr;
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

    std::string outputString = F.getName().str() + " %lld\n";
    StringRef funcFormatStr = StringRef(outputString);
    std::string fileName = "function_trace.txt";
    StringRef funcFileName = StringRef(fileName);
    // for all return instructions, print the return value to a file with the
    // name of the function

    // store already handled blocks
    std::set<BasicBlock *> HandledBlocks;
    for (auto &BB : F) {
      // Do NOT reinstrument the inserted blocks
      if (BB.getName() == "return" || BB.getName() == "print" ||
          BB.getName() == "open") {
            HandledBlocks.insert(&BB);
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
          FunctionCallee AccessFunc = M.getOrInsertFunction(
              "access",
              FunctionType::get(IntegerType::getInt32Ty(M.getContext()),
                                {PointerType::get(M.getContext(), 0),
                                 IntegerType::getInt32Ty(M.getContext())},
                                false));

          if (!permissions_created) {
            permissions_created = 1;
            FileName = OrigBuilder.CreateGlobalStringPtr(funcFileName);
            WritePermission = OrigBuilder.CreateGlobalStringPtr("a");
          }

          // split at return
          BasicBlock *ReturnBB = BB.splitBasicBlock(RI, "return", false);

          BasicBlock *AccessBB =
              BasicBlock::Create(M.getContext(), "access", &F);
          BasicBlock *PrintBB = BasicBlock::Create(M.getContext(), "print", &F);

          IRBuilder<> AccessBuilder(AccessBB);
          // insert call to access function with filename and 0
          Value *status = AccessBuilder.CreateCall(
              AccessFunc, {FileName, AccessBuilder.getInt32(0)});

          Value *Cmp = AccessBuilder.CreateICmpEQ(
              status,
              ConstantInt::get(IntegerType::getInt32Ty(M.getContext()), 0));
          AccessBuilder.CreateCondBr(Cmp, PrintBB, ReturnBB);

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

          FunctionCallee OpenFunc = M.getOrInsertFunction(
              "fopen", FunctionType::get(PointerType::get(M.getContext(), 0),
                                         {PointerType::get(M.getContext(), 0),
                                          PointerType::get(M.getContext(), 0)},
                                         false));

          Value *write_fptr =
              PrintBuilder.CreateCall(OpenFunc, {FileName, WritePermission});
          PrintBuilder.CreateCall(PrintFunc,
                                  {write_fptr, formatStrPtr, retVal});

          // insert call to fclose

          PrintBuilder.CreateCall(CloseFunc, write_fptr);
          PrintBuilder.CreateBr(ReturnBB);

          BB.getTerminator()->setSuccessor(0, AccessBB);

          // place new BBs in the correct order
          ReturnBB->moveAfter(PrintBB);
        }
      }
      HandledBlocks.insert(&BB);
    }
  }

  return PreservedAnalyses::all();
}
