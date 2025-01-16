#include "llvm/Transforms/Utils/CFFunctionInstrumentation.h"

using namespace llvm;

#define DEBUG_TYPE "cffunction-instrumentation"

using CFFunctionAnalysisInfo = SetVector<StringRef>;

// This is the constructor to be inserted into the module:
//   Tracker(char *arg_name) {
//     count = 0;
//     values = (int *)malloc(100 * sizeof(int));
//     name = arg_name;
//   }
void insert_instrumentation_constructor(Module &M, Function &F) {
  // Create the constructor

  IRBuilder<> Builder(&F.getEntryBlock());
  StructType *TrackerType =
      StructType::getTypeByName(M.getContext(), "Tracker");
  Function *Constructor = Function::Create(
      FunctionType::get(
          Type::getVoidTy(M.getContext()),
          {PointerType::get(IntegerType::get(M.getContext(), 8), 0),
           PointerType::get(IntegerType::get(M.getContext(), 8), 0)},
          false),
      Function::LinkOnceODRLinkage, "Constructor", M);

  LLVM_DEBUG(dbgs() << "created constructor\n");

  BasicBlock *BB = BasicBlock::Create(M.getContext(), "entry", Constructor);

  LLVM_DEBUG(dbgs() << "created entry block\n");

  Builder.SetInsertPoint(BB);

  Argument *base_pointer = Constructor->arg_begin();
  Argument *name = Constructor->arg_begin() + 1;

  // allocate count
  Value *CountPtr = Builder.CreateStructGEP(TrackerType, base_pointer, 1);
  Builder.CreateStore(ConstantInt::get(M.getContext(), APInt(64, 0, false)),
                      CountPtr);

  LLVM_DEBUG(dbgs() << "created count store\n");

  FunctionCallee MallocFunc = M.getOrInsertFunction(
      "malloc", FunctionType::get(
                    PointerType::get(IntegerType::get(M.getContext(), 8), 0),
                    {IntegerType::get(M.getContext(), 64)}, false));
  // Allocate the values array

  Value *Malloc = Builder.CreateCall(
      MallocFunc, {ConstantInt::get(M.getContext(), APInt(64, 800, false))});

  LLVM_DEBUG(dbgs() << "created malloc\n");

  // Store the values array
  Value *Values = Builder.CreateBitCast(
      Malloc, PointerType::get(IntegerType::get(M.getContext(), 64), 0));
  Value *ValuesPtr = Builder.CreateStructGEP(TrackerType, base_pointer, 0);
  Builder.CreateStore(Values, ValuesPtr);

  LLVM_DEBUG(dbgs() << "created values store\n");

  // Store the name
  Value *NamePtr = Builder.CreateStructGEP(TrackerType, base_pointer, 2);
  Builder.CreateStore(name, NamePtr);

  LLVM_DEBUG(dbgs() << "created name store\n");

  Builder.CreateRetVoid();
}

// This is the function to be inserted into the module:
//   void add(int value) {
//     values[count] = value;
//     count++;
//     if (count == 100) {
//       print();
//       count = 0;
//     }
//   }
void insert_instrumentation_add(Module &M) {
  // Create the add method

  IRBuilder<> Builder(M.getContext());
  StructType *TrackerType =
      StructType::getTypeByName(M.getContext(), "Tracker");

  Function *AddFunc =
      Function::Create(FunctionType::get(Type::getVoidTy(M.getContext()),
                                         {PointerType::get(TrackerType, 0),
                                          Type::getInt64Ty(M.getContext())},
                                         false),
                       Function::LinkOnceODRLinkage, "add", M);

  BasicBlock *BB = BasicBlock::Create(M.getContext(), "entry", AddFunc);

  LLVM_DEBUG(dbgs() << "created add function\n");

  Builder.SetInsertPoint(BB);

  Argument *Tracker = AddFunc->arg_begin();
  Argument *StoreValue = AddFunc->arg_begin() + 1;

  // check if the value of the tracker is 0

  Value *TrackerValue =
      Builder.CreateLoad(Type::getInt64Ty(M.getContext()), Tracker);

  LLVM_DEBUG(dbgs() << "created tracker load\n");

  Value *IsNull = Builder.CreateICmpEQ(
      TrackerValue, ConstantInt::get(M.getContext(), APInt(64, 0, false)));

  BasicBlock *NullBB = BasicBlock::Create(M.getContext(), "null", AddFunc);
  BasicBlock *ElseBB = BasicBlock::Create(M.getContext(), "else", AddFunc);

  Builder.CreateCondBr(IsNull, NullBB, ElseBB);

  Builder.SetInsertPoint(NullBB);

  Builder.CreateRetVoid();

  Builder.SetInsertPoint(ElseBB);

  Value *CountPtr = Builder.CreateStructGEP(TrackerType, Tracker, 1);
  Value *Count =
      Builder.CreateLoad(IntegerType::get(M.getContext(), 64), CountPtr);

  LLVM_DEBUG(dbgs() << "created count load\n");

  Value *ValuesPtr = Builder.CreateStructGEP(TrackerType, Tracker, 0);
  Value *Values = Builder.CreateLoad(
      PointerType::get(IntegerType::get(M.getContext(), 64), 0), ValuesPtr);

  LLVM_DEBUG(dbgs() << "created values load\n");

  Value *ValuesIndex =
      Builder.CreateGEP(PointerType::get(TrackerType, 0), Values, {Count});

  LLVM_DEBUG(dbgs() << "created values index\n");

  Builder.CreateStore(StoreValue, ValuesIndex);

  LLVM_DEBUG(dbgs() << "created store\n");

  Value *NewCount = Builder.CreateAdd(
      Count, ConstantInt::get(M.getContext(), APInt(64, 1, false)));
  Builder.CreateStore(NewCount, CountPtr);

  Value *Compare = Builder.CreateICmpEQ(
      NewCount, ConstantInt::get(M.getContext(), APInt(64, 100, false)));

  LLVM_DEBUG(dbgs() << "created compare\n");

  BasicBlock *ThenBB = BasicBlock::Create(M.getContext(), "then", AddFunc);
  BasicBlock *EndBB = BasicBlock::Create(M.getContext(), "end", AddFunc);

  Builder.CreateCondBr(Compare, ThenBB, EndBB);

  LLVM_DEBUG(dbgs() << "created branches\n");

  Builder.SetInsertPoint(ThenBB);

  Function *PrintFunc = M.getFunction("print");
  Builder.CreateCall(PrintFunc, Tracker);

  Builder.CreateStore(ConstantInt::get(M.getContext(), APInt(64, 0, false)),
                      CountPtr);

  LLVM_DEBUG(dbgs() << "created print\n");

  Builder.CreateBr(EndBB);

  Builder.SetInsertPoint(EndBB);

  Builder.CreateRetVoid();
}

// This is the function to be inserted into the module:
//   void print() {
//     printf("Tracker %s: ", name);
//     for (int i = 0; i < count; i++) {
//       printf("%d ", values[i]);
//     }
//     printf("\n");
//   }
void insert_instrumentation_print(Module &M) {
  // Create the print method

  IRBuilder<> Builder(M.getContext());
  StructType *TrackerType =
      StructType::getTypeByName(M.getContext(), "Tracker");

  Function *PrintFunc = Function::Create(
      FunctionType::get(Type::getVoidTy(M.getContext()),
                        {PointerType::get(TrackerType, 0)}, false),
      Function::LinkOnceODRLinkage, "print", M);

  BasicBlock *BB = BasicBlock::Create(M.getContext(), "entry", PrintFunc);

  Builder.SetInsertPoint(BB);

  Argument *Tracker = PrintFunc->arg_begin();

  // check if the tracker is null

  Value *IsNull = Builder.CreateICmpEQ(
      Tracker, ConstantPointerNull::get(PointerType::get(TrackerType, 0)));

  BasicBlock *ThenBB = BasicBlock::Create(M.getContext(), "then", PrintFunc);
  BasicBlock *ElseBB = BasicBlock::Create(M.getContext(), "else", PrintFunc);

  Builder.CreateCondBr(IsNull, ThenBB, ElseBB);

  Builder.SetInsertPoint(ThenBB);

  Builder.CreateRetVoid();

  Builder.SetInsertPoint(ElseBB);

  Value *NamePtr = Builder.CreateStructGEP(TrackerType, Tracker, 2);
  Value *Name = Builder.CreateLoad(
      PointerType::get(IntegerType::get(M.getContext(), 8), 0), NamePtr);

  LLVM_DEBUG(dbgs() << "created name load\n");

  Value *FormatStr = Builder.CreateGlobalStringPtr("Tracker %s: ");

  LLVM_DEBUG(dbgs() << "created format string\n");

  FunctionCallee CloseFunc = M.getOrInsertFunction(
      "fclose",
      FunctionType::get(Type::getInt32Ty(M.getContext()),
                        {PointerType::get(M.getContext(), 0)}, false));

  FunctionCallee OpenFunc = M.getOrInsertFunction(
      "fopen", FunctionType::get(PointerType::get(M.getContext(), 0),
                                 {PointerType::get(M.getContext(), 0),
                                  PointerType::get(M.getContext(), 0)},
                                 false));

  Value *PermissionStr = Builder.CreateGlobalStringPtr("a", "file_permission");
  Value *NameStr =
      Builder.CreateGlobalStringPtr("function_trace.txt", "instr_file");

  LLVM_DEBUG(dbgs() << "created permission string\n");

  Value *File = Builder.CreateCall(OpenFunc, {NameStr, PermissionStr});

  LLVM_DEBUG(dbgs() << "created open\n");

  FunctionCallee PrintfFunc = M.getOrInsertFunction(
      "fprintf", FunctionType::get(Type::getVoidTy(M.getContext()),
                                   PointerType::get(M.getContext(), 0), true));

  Builder.CreateCall(PrintfFunc, {File, FormatStr, Name});

  LLVM_DEBUG(dbgs() << "created printf\n");

  Value *CountPtr = Builder.CreateStructGEP(TrackerType, Tracker, 1);
  Value *Count =
      Builder.CreateLoad(IntegerType::get(M.getContext(), 64), CountPtr);

  LLVM_DEBUG(dbgs() << "created count load\n");

  Value *ValuesPtr = Builder.CreateStructGEP(TrackerType, Tracker, 0);
  Value *Values = Builder.CreateLoad(
      PointerType::get(IntegerType::get(M.getContext(), 64), 0), ValuesPtr);

  LLVM_DEBUG(dbgs() << "created values load\n");

  BasicBlock *LoopBB = BasicBlock::Create(M.getContext(), "loop", PrintFunc);
  BasicBlock *EndBB = BasicBlock::Create(M.getContext(), "end", PrintFunc);

  Builder.CreateBr(LoopBB);

  Builder.SetInsertPoint(LoopBB);

  PHINode *Index = Builder.CreatePHI(IntegerType::get(M.getContext(), 64), 2);

  Index->addIncoming(ConstantInt::get(M.getContext(), APInt(64, 0, false)),
                     ElseBB);

  Value *ValuesIndex =
      Builder.CreateGEP(PointerType::get(TrackerType, 0), Values, {Index});

  Value *CurrValue =
      Builder.CreateLoad(IntegerType::get(M.getContext(), 64), ValuesIndex);

  LLVM_DEBUG(dbgs() << "created value load\n");

  Value *ValueStr = Builder.CreateGlobalStringPtr("%ld ");

  LLVM_DEBUG(dbgs() << "created value string\n");

  Builder.CreateCall(PrintfFunc, {File, ValueStr, CurrValue});

  LLVM_DEBUG(dbgs() << "created printf\n");

  Value *NewIndex = Builder.CreateAdd(
      Index, ConstantInt::get(M.getContext(), APInt(64, 1, false)));

  Index->addIncoming(NewIndex, LoopBB);

  Value *Compare = Builder.CreateICmpEQ(NewIndex, Count);

  LLVM_DEBUG(dbgs() << "created compare\n");

  Builder.CreateCondBr(Compare, EndBB, LoopBB);

  Builder.SetInsertPoint(EndBB);

  Value *NewLineStr = Builder.CreateGlobalStringPtr("\n");

  LLVM_DEBUG(dbgs() << "created newline string\n");

  Builder.CreateCall(PrintfFunc, {File, NewLineStr});

  LLVM_DEBUG(dbgs() << "created printf\n");

  Builder.CreateCall(CloseFunc, {File});

  Builder.CreateRetVoid();
}

// This is the destructor to be inserted into the module:
//   ~Tracker() {
//     print();
//     delete[] values;
//   }
//
void insert_instrumentation_destructor(Module &M) {
  // Create the destructor

  IRBuilder<> Builder(M.getContext());
  StructType *TrackerType =
      StructType::getTypeByName(M.getContext(), "Tracker");

  Function *Destructor = Function::Create(
      FunctionType::get(Type::getVoidTy(M.getContext()),
                        {PointerType::get(TrackerType, 0)}, false),
      Function::LinkOnceODRLinkage, "Destructor", M);

  FunctionCallee DeleteFunc = M.getOrInsertFunction(
      "_ZdaPv",
      FunctionType::get(
          Type::getVoidTy(M.getContext()),
          {PointerType::get(IntegerType::get(M.getContext(), 8), 0)}, false));

  BasicBlock *BB = BasicBlock::Create(M.getContext(), "entry", Destructor);

  Builder.SetInsertPoint(BB);

  Argument *Tracker = Destructor->arg_begin();

  Function *PrintFunc = M.getFunction("print");
  Builder.CreateCall(PrintFunc, Tracker);

  LLVM_DEBUG(dbgs() << "created print\n");
  Value *ValuesPtr = Builder.CreateStructGEP(TrackerType, Tracker, 0);

  Value *Values = Builder.CreateLoad(
      PointerType::get(IntegerType::get(M.getContext(), 64), 0), ValuesPtr);

  // Check if values is null

  Value *ValuesIsNull = Builder.CreateICmpEQ(
      Values, ConstantPointerNull::get(
                  PointerType::get(IntegerType::get(M.getContext(), 64), 0)));

  BasicBlock *ThenBB = BasicBlock::Create(M.getContext(), "then", Destructor);
  BasicBlock *EndBB = BasicBlock::Create(M.getContext(), "end", Destructor);

  Builder.CreateCondBr(ValuesIsNull, EndBB, ThenBB);

  Builder.SetInsertPoint(ThenBB);

  Builder.CreateCall(DeleteFunc, Values);

  Builder.CreateBr(EndBB);

  LLVM_DEBUG(dbgs() << "created delete\n");

  Builder.SetInsertPoint(EndBB);

  Builder.CreateRetVoid();
}

// This is the function to be inserted into the module:
// @__dso_handle = external hidden global i8
// declare i32 @__cxa_atexit(ptr, ptr, ptr)
// @llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr,
// ptr } { i32 65535, ptr @_GLOBAL__sub_I_class_idea.cpp, ptr null }]
// define void @__cxx_global_var_init() #0 section ".text.startup" {
//   tail call void @_ZN7TrackerC2EPc(ptr @foo_tracker, ptr  @foo_name)
//   %1 = tail call i32 @__cxa_atexit(ptr  @_ZN7TrackerD2Ev, ptr  @foo_tracker,
//   ptr @__dso_handle) #9 ret void
// }
// define internal void @_GLOBAL__sub_I_class_idea.cpp() #0 section
// ".text.startup" {
//   tail call fastcc void @__cxx_global_var_init()
//   ret void
// }
void insert_instrumentation_global_var_init(Module &M) {

  IRBuilder<> Builder(M.getContext());

  Function *GlobalVarInit = Function::Create(
      FunctionType::get(Type::getVoidTy(M.getContext()), false),
      Function::PrivateLinkage, "__cxx_global_var_init", M);

  LLVM_DEBUG(dbgs() << "created global var init\n");

  BasicBlock *BB = BasicBlock::Create(M.getContext(), "entry", GlobalVarInit);

  Builder.SetInsertPoint(BB);

  // only create the tracker if function_trace.txt exists

  Value *FileName =
      Builder.CreateGlobalStringPtr("function_trace.txt", "instr_file");

  FunctionCallee OpenFunc = M.getOrInsertFunction(
      "access", FunctionType::get(
                    IntegerType::get(M.getContext(), 32),
                    {PointerType::get(IntegerType::get(M.getContext(), 8), 0),
                     IntegerType::get(M.getContext(), 32)},
                    false));

  Value *File = Builder.CreateCall(
      OpenFunc,
      {FileName, ConstantInt::get(M.getContext(), APInt(32, 0, false))});

  Value *FileIsNull = Builder.CreateICmpEQ(
      File, ConstantInt::get(M.getContext(), APInt(32, 0, true)));

  BasicBlock *ThenBB =
      BasicBlock::Create(M.getContext(), "then", GlobalVarInit);
  BasicBlock *EndBB = BasicBlock::Create(M.getContext(), "end", GlobalVarInit);

  Builder.CreateCondBr(FileIsNull, ThenBB, EndBB);

  Builder.SetInsertPoint(EndBB);

  Builder.CreateRetVoid();

  Builder.SetInsertPoint(ThenBB);

  // Create the dso handle
  // @__dso_handle = external hidden global i8
  GlobalVariable *DsoHandle = new GlobalVariable(
      M, IntegerType::get(M.getContext(), 8), false,
      GlobalValue::ExternalLinkage, nullptr, "__dso_handle", nullptr);
  DsoHandle->setVisibility(GlobalValue::HiddenVisibility);

  LLVM_DEBUG(dbgs() << "created dso handle\n");

  LLVM_DEBUG(dbgs() << "created atexit\n");

  Builder.CreateRetVoid();

  Function *GlobalCtor = Function::Create(
      FunctionType::get(Type::getVoidTy(M.getContext()), false),
      Function::PrivateLinkage, "_GLOBAL__sub_" + M.getName(), M);

  LLVM_DEBUG(dbgs() << "created global ctor\n");

  BasicBlock *BB2 = BasicBlock::Create(M.getContext(), "entry", GlobalCtor);

  Builder.SetInsertPoint(BB2);

  FunctionCallee GlobalVarInitFunc = M.getOrInsertFunction(
      "__cxx_global_var_init",
      FunctionType::get(Type::getVoidTy(M.getContext()), false));

  LLVM_DEBUG(dbgs() << "created global var init func\n");

  Builder.CreateCall(GlobalVarInitFunc);

  LLVM_DEBUG(dbgs() << "created global var init call\n");

  Builder.CreateRetVoid();

  GlobalCtor->setSection(".text.startup");

  GlobalVarInit->setSection(".text.startup");

  // @llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr,
  // ptr } { i32 65535, ptr @_GLOBAL__sub_I_class_idea.cpp, ptr null }]
  appendToGlobalCtors(M, GlobalCtor, 65535, nullptr);

  LLVM_DEBUG(dbgs() << "found global ctors\n");
}

// This is the class that will be inserted into the module
// class Tracker {
// public:
//   int *values;
//   int count = 0;
//   char *name;
//
//   Tracker(char *arg_name) {
//     values = (int *)malloc(100 * sizeof(int));
//     name = arg_name;
//   }
//
//   ~Tracker() {
//     print();
//     delete[] values;
//   }
//
//   void add(int value) {
//     values[count] = value;
//     count++;
//     if (count == 100) {
//       print();
//       count = 0;
//     }
//   }
//
//   void print() {
//     printf("Tracker %s: ", name);
//     for (int i = 0; i < count; i++) {
//       printf("%d ", values[i]);
//     }
//     printf("\n");
//   }
// };
//
void insert_instrumentation_class(Module &M, Function &F) {

  // Create the class
  // %class.Tracker = type { ptr, i64, ptr }
  IRBuilder<> Builder(&F.getEntryBlock());
  StructType *TrackerType = StructType::create(M.getContext(), "Tracker");
  PointerType *IntType =
      PointerType::get(IntegerType::get(M.getContext(), 64), 0);
  PointerType *CharType =
      PointerType::get(IntegerType::get(M.getContext(), 8), 0);

  TrackerType->setBody({IntType, Type::getInt64Ty(M.getContext()), CharType});

  LLVM_DEBUG(dbgs() << "created tracker type\n");

  // Create the constructor
  insert_instrumentation_constructor(M, F);

  LLVM_DEBUG(dbgs() << "created constructor\n");

  // Create the print method

  insert_instrumentation_print(M);

  LLVM_DEBUG(dbgs() << "created print\n");

  // Create the add method

  insert_instrumentation_add(M);

  LLVM_DEBUG(dbgs() << "created add\n");

  // Create the destructor

  insert_instrumentation_destructor(M);

  LLVM_DEBUG(dbgs() << "created destructor\n");

  insert_instrumentation_global_var_init(M);
}

PreservedAnalyses
CFFunctionInstrumentationPass::run(Module &M, ModuleAnalysisManager &AM) {

  CFFunctionAnalysisInfo CalledFunctions = AM.getResult<CFFunctionAnalysis>(M);
  int tracker_created = 0;
  for (auto &F : M) {
    if (F.isDeclaration()) {
      continue;
    }

    if (F.getName() == "add" || F.getName() == "print" ||
        F.getName() == "open" || F.getName() == "close" ||
        F.getName() == "malloc" || F.getName() == "free" ||
        F.getName() == "access" || F.getName() == "fopen" ||
        F.getName() == "fclose" || F.getName() == "fprintf" ||
        F.getName() == "_ZdaPv" || F.getName() == "__cxa_atexit" ||
        F.getName() == "__cxx_global_var_init" || F.getName() == "Destructor" ||
        F.getName() == "Constructor" ||
        F.getName() == StringRef("_GLOBAL__sub_" + M.getName().str())) {
      continue;
    }

    // print the return value of the function
    LLVM_DEBUG(dbgs() << "=========================\n");
    LLVM_DEBUG(dbgs() << "Function: ");
    LLVM_DEBUG(dbgs() << F.getName() << " " << *(F.getReturnType()) << "\n");

    if (!CalledFunctions.count(F.getName())) {
      continue;
    }

    LLVM_DEBUG(dbgs() << "Instrumenting function: " << F.getName() << "\n");

    if (!tracker_created) {
      insert_instrumentation_class(M, F);
      tracker_created = 1;
    }

    IRBuilder<> Builder(&F.getEntryBlock());
    // insert name string

    Value *FuncName = Builder.CreateGlobalStringPtr(
        StringRef(F.getName().str() + " "), F.getName() + "_name");
    LLVM_DEBUG(dbgs() << "created func name\n");

    StructType *TrackerType =
        StructType::getTypeByName(M.getContext(), "Tracker");
    LLVM_DEBUG(dbgs() << "found tracker type\n");

    // insert global value that looks like:
    // @foo_tracker = dso_local global %Tracker zeroinitializer, align 8
    auto *GV = new GlobalVariable(
        M, TrackerType, false, GlobalValue::PrivateLinkage,
        Constant::getNullValue(TrackerType), F.getName() + "_tracker", nullptr,
        GlobalVariable::NotThreadLocal, 0, false);

    // register the constructor and destructor to the var init func

    Function *Constructor = M.getFunction("Constructor");

    Function *VarInitFunc = M.getFunction("__cxx_global_var_init");

    BasicBlock *ThenBB = nullptr;

    for (auto &BB : *VarInitFunc) {
      if (BB.getName() == "then") {
        ThenBB = &BB;
        break;
      }
    }

    if (!ThenBB) {
      LLVM_DEBUG(dbgs() << "could not find then block\n");
      continue;
    }

    Builder.SetInsertPoint(ThenBB->getTerminator());
    Builder.CreateCall(Constructor, {GV, FuncName});

    FunctionCallee AtExitFunc = M.getOrInsertFunction(
        "__cxa_atexit",
        FunctionType::get(
            IntegerType::get(M.getContext(), 32),
            {PointerType::get(
                 FunctionType::get(Type::getVoidTy(M.getContext()),
                                   {PointerType::get(TrackerType, 0)}, false),
                 0),
             PointerType::get(TrackerType, 0),
             PointerType::get(IntegerType::get(M.getContext(), 8), 0)},
            false));

    Value *DsoHandle = M.getOrInsertGlobal("__dso_handle",
                                           IntegerType::get(M.getContext(), 8));
    Builder.CreateCall(AtExitFunc,
                       {M.getFunction("Destructor"), GV, DsoHandle});

    LLVM_DEBUG(dbgs() << "created atexit call\n");

    for (auto &BB : *VarInitFunc) {
      if (BB.getName() == "end") {
        ThenBB = &BB;
        break;
      }
    }

    if (!ThenBB) {
      LLVM_DEBUG(dbgs() << "could not find then block\n");
      continue;
    }

    Builder.SetInsertPoint(ThenBB->getTerminator());
    // write nullptr to GV

    Builder.CreateStore(ConstantInt::get(M.getContext(), APInt(64, 0, false)),
                        GV);

    for (auto &BB : F) {
      // Do NOT reinstrument the inserted blocks
      if (BB.getName() == "return" || BB.getName() == "print" ||
          BB.getName() == "open") {
        continue;
      }
      LLVM_DEBUG(dbgs() << "Instrumenting basic block: " << BB.getName()
                        << "\n");
      if (auto *RI = dyn_cast<ReturnInst>(BB.getTerminator())) {
        auto *retVal = RI->getReturnValue();
        if (retVal) {
          if (!retVal->getType()->isIntegerTy()) {
            continue;
          }
          Builder.SetInsertPoint(RI);
          Value *Tracker =
              Builder.CreateBitCast(GV, PointerType::get(TrackerType, 0));
          Value *AddFunc = M.getFunction("add");
          Value *ExtVal =
              Builder.CreateZExt(retVal, Type::getInt64Ty(M.getContext()));
          Builder.CreateCall(
              FunctionType::get(Type::getVoidTy(M.getContext()),
                                {PointerType::get(TrackerType, 0),
                                 Type::getInt64Ty(M.getContext())},
                                false),

              AddFunc, {Tracker, ExtVal});
        }
      }
    }
  }

  return PreservedAnalyses::all();
}
