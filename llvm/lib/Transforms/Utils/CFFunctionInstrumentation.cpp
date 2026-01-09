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
  Value *InstrFlag = nullptr;
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
    std::string fileName = "function_trace_%d.txt";
    StringRef funcFileName = StringRef(fileName);
    std::string instrumentationFlag = "instrument_flag.txt";
    StringRef instrFlag = StringRef(instrumentationFlag);
    // for all return instructions, print the return value to a file with the
    // name of the function

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
            InstrFlag = OrigBuilder.CreateGlobalStringPtr(instrFlag);
          }

          // split at return
          BasicBlock *ReturnBB = BB.splitBasicBlock(RI, "return", false);

          BasicBlock *AccessBB =
              BasicBlock::Create(M.getContext(), "access_check", &F);
          BasicBlock *PrintBB = BasicBlock::Create(M.getContext(), "print", &F);

          LLVM_DEBUG(dbgs() << "Created BBs\n");

          IRBuilder<> AccessBuilder(AccessBB);
          // insert call to access function with filename and 0
          Value *status = AccessBuilder.CreateCall(
              AccessFunc, {InstrFlag, AccessBuilder.getInt32(0)});

          Value *Cmp = AccessBuilder.CreateICmpEQ(
              status,
              ConstantInt::get(IntegerType::getInt32Ty(M.getContext()), 0));
          AccessBuilder.CreateCondBr(Cmp, PrintBB, ReturnBB);

          LLVM_DEBUG(dbgs() << "Created access BB\n");

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

          // get_pid function

          FunctionCallee get_pid_Func = M.getOrInsertFunction(
              "getpid",
              FunctionType::get(IntegerType::getInt32Ty(M.getContext()), {},
                                false));

          // snprintf to create the filename with pid
          FunctionCallee snprintf_Func = M.getOrInsertFunction(
              "snprintf",
              FunctionType::get(IntegerType::getInt32Ty(M.getContext()),
                                {PointerType::get(M.getContext(), 0),
                                 IntegerType::getInt32Ty(M.getContext()),
                                 PointerType::get(M.getContext(), 0),
                                 IntegerType::getInt32Ty(M.getContext())},
                                false));

          // allocate space for the filename
          Value *FileNameBuffer = PrintBuilder.CreateAlloca(
              ArrayType::get(IntegerType::getInt8Ty(M.getContext()), 50), nullptr, "filename_buffer");

          Value *pid = PrintBuilder.CreateCall(get_pid_Func, {});

          PrintBuilder.CreateCall(
              snprintf_Func,
              {FileNameBuffer,
               PrintBuilder.getInt32(50),
               PrintBuilder.CreateGlobalStringPtr(funcFileName),
               pid});

          Value *write_fptr =
              PrintBuilder.CreateCall(OpenFunc, {FileNameBuffer, WritePermission});
          PrintBuilder.CreateCall(PrintFunc,
                                  {write_fptr, formatStrPtr, retVal});

          // insert call to fclose

          PrintBuilder.CreateCall(CloseFunc, write_fptr);
          PrintBuilder.CreateBr(ReturnBB);

          BB.getTerminator()->setSuccessor(0, AccessBB);

          // place new BBs in the correct order
          ReturnBB->moveAfter(PrintBB);

          HandledBlocks.insert(AccessBB);
          HandledBlocks.insert(PrintBB);
          HandledBlocks.insert(ReturnBB);
        }
      }
      HandledBlocks.insert(&BB);
    }
  }

  return PreservedAnalyses::all();
}
