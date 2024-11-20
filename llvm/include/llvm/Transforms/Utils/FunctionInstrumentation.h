#ifndef LLVM_TRANSFORMS_FUNCTION_INSTRUMENTATION_H
#define LLVM_TRANSFORMS_FUNCTION_INSTRUMENTATION_H

#include "llvm/ADT/SetVector.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Support/Debug.h"

namespace llvm {

class FunctionInstrumentationPass
    : public PassInfoMixin<FunctionInstrumentationPass> {
public:
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);

  FunctionInstrumentationPass() = default;
  FunctionInstrumentationPass(const FunctionInstrumentationPass &) = default;

private:
  SetVector<StringRef> CalledFunctions;
};

} // namespace llvm

#endif // LLVM_TRANSFORMS_FUNCTION_INSTRUMENTATION_H
