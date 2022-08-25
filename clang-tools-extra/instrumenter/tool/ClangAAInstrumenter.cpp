//===-- tools/extra/clang-reorder-fields/tool/ClangReorderFields.cpp -*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the implementation of clang-reorder-fields tool
///
//===----------------------------------------------------------------------===//

#include "../AAInstrumenter.h"
#include "clang/Basic/Diagnostic.h"
#include "clang/Basic/DiagnosticOptions.h"
#include "clang/Basic/FileManager.h"
#include "clang/Basic/LangOptions.h"
#include "clang/Basic/SourceManager.h"
#include "clang/Frontend/TextDiagnosticPrinter.h"
#include "clang/Rewrite/Core/Rewriter.h"
#include "clang/Tooling/CommonOptionsParser.h"
#include "clang/Tooling/Refactoring.h"
#include "clang/ASTMatchers/ASTMatchFinder.h"
#include "clang/Tooling/Tooling.h"
#include "llvm/ADT/IntrusiveRefCntPtr.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/FileSystem.h"
#include <cstdlib>
#include <string>
#include <system_error>


using namespace llvm;
using namespace clang;
using namespace clang::tooling;


cl::OptionCategory ClangAAInstrumenterCategory("clang-aa-instrumenter options");

static cl::list<std::string> FuncsAndVars("funcs-and-vars", cl::CommaSeparated,
                                         cl::OneOrMore,
                                         cl::desc("The desired variables. Provide as `func1-name:var1-name,func2-name:var2-name`"),
                                         cl::cat(ClangAAInstrumenterCategory));


static cl::list<std::string> DisabledPasses("disable-passes", cl::CommaSeparated,
                                            cl::desc("The passes to disable. Provide as `pass1-name,pass2-name`, e.g. `if,else,for`"),
                                            cl::cat(ClangAAInstrumenterCategory));

static cl::opt<bool> Inplace("i", cl::desc("Overwrite edited files."),
                             cl::cat(ClangAAInstrumenterCategory));

const char Usage[] = "A tool to instrument variable accesses in C/C++.\n";

int main(int argc, const char **argv) {
  auto ExpectedParser = tooling::CommonOptionsParser::create(
      argc, argv, ClangAAInstrumenterCategory, cl::OneOrMore, Usage);
  if (!ExpectedParser) {
    llvm::errs() << ExpectedParser.takeError();
    return 1;
  }

  tooling::CommonOptionsParser &OP = ExpectedParser.get();

  auto Files = OP.getSourcePathList();
  auto F = Files[0];
  llvm::outs() << F << "\n";
  tooling::RefactoringTool Tool(OP.getCompilations(), Files);

  aa_instrumenter::AAInstrumenter Action(FuncsAndVars,
                                             Tool.getReplacements());

  // check suffix of F for ".c"
  int filenamesize = F.size();
  Action.is_c = F[filenamesize-2] == '.' && F[filenamesize-1] == 'c';
  Action.DisabledPasses = DisabledPasses;
  llvm::outs() << "is_c: " << Action.is_c << "\n";

  clang::ast_matchers::MatchFinder Finder;
  Action.registerMatchers(Finder);
  auto Factory = tooling::newFrontendActionFactory(&Finder);

  if (Inplace)
    return Tool.runAndSave(Factory.get());

  int ExitCode = Tool.run(Factory.get());
  LangOptions DefaultLangOptions;
  IntrusiveRefCntPtr<DiagnosticOptions> DiagOpts(new DiagnosticOptions());
  TextDiagnosticPrinter DiagnosticPrinter(errs(), &*DiagOpts);
  DiagnosticsEngine Diagnostics(
      IntrusiveRefCntPtr<DiagnosticIDs>(new DiagnosticIDs()), &*DiagOpts,
      &DiagnosticPrinter, false);

  auto &FileMgr = Tool.getFiles();
  SourceManager Sources(Diagnostics, FileMgr);
  Rewriter Rewrite(Sources, DefaultLangOptions);
  Tool.applyAllReplacements(Rewrite);

  for (const auto &File : Files) {
    auto Entry = FileMgr.getFile(File);
    const auto ID = Sources.getOrCreateFileID(*Entry, SrcMgr::C_User);
    Rewrite.getEditBuffer(ID).write(outs());
  }

  return ExitCode;
}
