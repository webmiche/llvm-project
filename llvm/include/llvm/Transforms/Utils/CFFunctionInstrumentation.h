#ifndef LLVM_TRANSFORMS_FUNCTION_INSTRUMENTATION_H
#define LLVM_TRANSFORMS_FUNCTION_INSTRUMENTATION_H

#include "llvm/ADT/SetVector.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/Analysis/CFFunctionAnalysis.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Support/Debug.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include <fstream>

namespace llvm {

class CFFunctionInstrumentationPass
    : public PassInfoMixin<CFFunctionInstrumentationPass> {
public:
  PreservedAnalyses run(Module &F, ModuleAnalysisManager &AM);
};

} // namespace llvm

#endif // LLVM_TRANSFORMS_FUNCTION_INSTRUMENTATION_H
