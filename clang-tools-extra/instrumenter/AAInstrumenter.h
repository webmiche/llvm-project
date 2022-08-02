//===-- tools/extra/clang-reorder-fields/AAInstrumenter.h -*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the declarations of the AAInstrumenter class and
/// the FieldPosition struct.
///
//===----------------------------------------------------------------------===//

#ifndef LLVM_CLANG_TOOLS_EXTRA_CLANG_REORDER_FIELDS_ACTION_H
#define LLVM_CLANG_TOOLS_EXTRA_CLANG_REORDER_FIELDS_ACTION_H

#include "clang/Tooling/Refactoring.h"
#include "clang/ASTMatchers/ASTMatchFinder.h"
#include <clang/Basic/SourceLocation.h>
#include <clang/Tooling/Core/Replacement.h>
#include <clang/Tooling/Transformer/RewriteRule.h>
#include <clang/Tooling/Transformer/Stencil.h>
#include <vector>


namespace clang {
namespace aa_instrumenter {

  class RuleActionCallback
    : public clang::ast_matchers::MatchFinder::MatchCallback {
  public:
    RuleActionCallback(
        clang::transformer::RewriteRule Rule,
        std::map<std::string, clang::tooling::Replacements> &FileToReplacements)
        : Rule{Rule}, FileToReplacements{FileToReplacements} {}
    void
    run(const clang::ast_matchers::MatchFinder::MatchResult &Result) override;
    void registerMatchers(clang::ast_matchers::MatchFinder &Finder);

  private:
    clang::transformer::RewriteRule Rule;
    std::map<std::string, clang::tooling::Replacements> &FileToReplacements;
};

class AAInstrumenter {
  llvm::ArrayRef<std::string> FuncsAndVars;
  std::map<std::string, tooling::Replacements> &Replacements;
      std::vector<RuleActionCallback> Rules;

public:
  bool is_c = false;

  std::vector<std::string> DisabledPasses;

  AAInstrumenter(
      llvm::ArrayRef<std::string> FuncsAndVars,
      std::map<std::string, tooling::Replacements> &Replacements)
      : FuncsAndVars(FuncsAndVars),
        Replacements(Replacements) {}

  AAInstrumenter(const AAInstrumenter &) = delete;
  AAInstrumenter &operator=(const AAInstrumenter &) = delete;

  void registerMatchers(clang::ast_matchers::MatchFinder &Finder);
};
} // namespace aa_instrumenter
} // namespace clang

#endif // LLVM_CLANG_TOOLS_EXTRA_CLANG_REORDER_FIELDS_ACTION_H
