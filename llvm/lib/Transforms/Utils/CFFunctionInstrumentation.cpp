#include "llvm/Transforms/Utils/CFFunctionInstrumentation.h"

using namespace llvm;

#define DEBUG_TYPE "cffunction-instrumentation"

using CFFunctionAnalysisInfo = SetVector<StringRef>;

PreservedAnalyses
CFFunctionInstrumentationPass::run(Module &M, ModuleAnalysisManager &AM) {

  CFFunctionAnalysisInfo CalledFunctions = AM.getResult<CFFunctionAnalysis>(M);
  LLVM_DEBUG(for (auto &F : CalledFunctions) {
    dbgs() << "Called function: " << F << "\n";
  });
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

    // print the function name and the module name to traced_functions.txt
    std::ofstream out;
    out.open("traced_functions.txt", std::ios::app);

    if (!out) {
      errs() << "Error: cannot open file traced_functions.txt \n";
      return PreservedAnalyses::none();
    }
    out << F.getName().str() << " instrumented in " << M.getName().str()
        << "\n";
    out.close();

    std::string functionName = F.getName().str();
    std::string function_map_file = "function_map.txt";
    // check if the file exists
    std::ifstream f(function_map_file);
    if (f.good()) {
      // file exists
      out << "Mapping function " << functionName;
      std::string line;
      while (std::getline(f, line)) {
        // if the line starts with the function name
        if (line.find(functionName) == 0) {
          // split the line by spaces
          functionName = line.substr(line.find(" ") + 1);
        }
      }
      f.close();
      out << "to" << functionName << "\n";
    }

    std::string outputString = functionName + " %lld\n";
    StringRef funcFormatStr = StringRef(outputString);
    std::string fileName = "function_trace.txt";
    StringRef funcFileName = StringRef(fileName);
    // for all return instructions, print the return value to a file with the
    // name of the function

    auto GV = new GlobalVariable(
        M, Type::getInt32Ty(M.getContext()), true,
        GlobalValue::LinkageTypes::PrivateLinkage,
        ConstantInt::get(IntegerType::getInt32Ty(M.getContext()), 0),
        "init" + F.getName());
    // store already handled blocks
    std::set<BasicBlock *> HandledBlocks;
    for (auto &BB : F) {
      if (HandledBlocks.count(&BB)) {
        continue;
      }
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

          BasicBlock *CheckBB =
              BasicBlock::Create(M.getContext(), "access_check", &F);
          BasicBlock *Check2BB =
              BasicBlock::Create(M.getContext(), "no_init_check", &F);
          BasicBlock *AccessBB =
              BasicBlock::Create(M.getContext(), "access", &F);
          BasicBlock *UpdateGVBB =
              BasicBlock::Create(M.getContext(), "update", &F);
          BasicBlock *NoAccessBB =
              BasicBlock::Create(M.getContext(), "no_access", &F);

          BasicBlock *PrintBB = BasicBlock::Create(M.getContext(), "print", &F);

          LLVM_DEBUG(dbgs() << "Created BBs\n");

          IRBuilder<> CheckBuilder(CheckBB);

          Value *GV_value = CheckBuilder.CreateLoad(
              IntegerType::getInt32Ty(M.getContext()), GV);

          // check if GV is 0 (not yet accessed) or -1 (no access) or 1 (access)
          Value *CmpGV = CheckBuilder.CreateICmpEQ(
              GV_value,
              ConstantInt::get(IntegerType::getInt32Ty(M.getContext()), 1));

          CheckBuilder.CreateCondBr(CmpGV, PrintBB, Check2BB);

          LLVM_DEBUG(dbgs() << "Created check BB\n");

          IRBuilder<> Check2Builder(Check2BB);
          Value *CmpGV2 = Check2Builder.CreateICmpEQ(
              GV_value,
              ConstantInt::get(IntegerType::getInt32Ty(M.getContext()), -1));

          Check2Builder.CreateCondBr(CmpGV2, ReturnBB, AccessBB);

          LLVM_DEBUG(dbgs() << "Created check2 BB\n");

          IRBuilder<> AccessBuilder(AccessBB);
          // insert call to access function with filename and 0
          Value *status = AccessBuilder.CreateCall(
              AccessFunc, {FileName, AccessBuilder.getInt32(0)});

          Value *Cmp = AccessBuilder.CreateICmpEQ(
              status,
              ConstantInt::get(IntegerType::getInt32Ty(M.getContext()), 0));
          AccessBuilder.CreateCondBr(Cmp, UpdateGVBB, NoAccessBB);

          LLVM_DEBUG(dbgs() << "Created access BB\n");

          IRBuilder<> NoAccessBuilder(NoAccessBB);
          NoAccessBuilder.CreateStore(
              ConstantInt::get(IntegerType::getInt32Ty(M.getContext()), -1),
              GV);
          NoAccessBuilder.CreateBr(ReturnBB);

          LLVM_DEBUG(dbgs() << "Created no access BB\n");

          IRBuilder<> UpdateGVBuilder(UpdateGVBB);
          UpdateGVBuilder.CreateStore(
              ConstantInt::get(IntegerType::getInt32Ty(M.getContext()), 1), GV);

          UpdateGVBuilder.CreateBr(PrintBB);

          LLVM_DEBUG(dbgs() << "Created update BB\n");

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

          BB.getTerminator()->setSuccessor(0, CheckBB);

          // place new BBs in the correct order
          ReturnBB->moveAfter(PrintBB);

          HandledBlocks.insert(AccessBB);
          HandledBlocks.insert(PrintBB);
          HandledBlocks.insert(ReturnBB);
          HandledBlocks.insert(CheckBB);
          HandledBlocks.insert(Check2BB);
          HandledBlocks.insert(UpdateGVBB);
          HandledBlocks.insert(NoAccessBB);
        }
      }
      HandledBlocks.insert(&BB);
    }
  }

  return PreservedAnalyses::all();
}
