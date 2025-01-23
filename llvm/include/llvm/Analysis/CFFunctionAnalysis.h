#ifndef LLVM_ANALYSIS_CF_FUNCTION_ANALYSIS_H
#define LLVM_ANALYSIS_CF_FUNCTION_ANALYSIS_H

#include "llvm/ADT/SetVector.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Pass.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/Debug.h"
#include <fstream>

namespace llvm {

using CFFunctionAnalysisInfo = SetVector<StringRef>;

class CFFunctionAnalysis : public AnalysisInfoMixin<CFFunctionAnalysis> {

public:
  using Result = CFFunctionAnalysisInfo;
  CFFunctionAnalysisInfo run(Module &M, ModuleAnalysisManager &AM);

  static AnalysisKey Key;
};

struct CFFunctionAnalysisPrinterPass
    : PassInfoMixin<CFFunctionAnalysisPrinterPass> {

  raw_ostream &OS;

public:
  explicit CFFunctionAnalysisPrinterPass(raw_ostream &OS) : OS(OS) {}

  PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM);
};

struct CFFunctionAnalysisStorePass
    : PassInfoMixin<CFFunctionAnalysisStorePass> {

  std::string Filename;

public:
  explicit CFFunctionAnalysisStorePass(std::string Filename)
      : Filename(std::move(Filename)) {}

  explicit CFFunctionAnalysisStorePass() : Filename("called_functions.txt") {}

  PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM);
};

} // namespace llvm

#endif // LLVM_ANALYSIS_CF_FUNCTION_ANALYSIS_H
