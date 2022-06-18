//===-- tools/extra/clang-reorder-fields/ReorderFieldsAction.h -*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the declarations of the ReorderFieldsAction class and
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
class ASTConsumer;

namespace reorder_fields {

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

class ReorderFieldsAction {
  llvm::StringRef RecordName;
  llvm::ArrayRef<std::string> DesiredFieldsOrder;
  std::map<std::string, tooling::Replacements> &Replacements;
      std::vector<RuleActionCallback> Rules;

public:
  ReorderFieldsAction(
      llvm::StringRef RecordName,
      llvm::ArrayRef<std::string> DesiredFieldsOrder,
      std::map<std::string, tooling::Replacements> &Replacements)
      : RecordName(RecordName), DesiredFieldsOrder(DesiredFieldsOrder),
        Replacements(Replacements) {}

  ReorderFieldsAction(const ReorderFieldsAction &) = delete;
  ReorderFieldsAction &operator=(const ReorderFieldsAction &) = delete;

  std::unique_ptr<ASTConsumer> newASTConsumer();
  void registerMatchers(clang::ast_matchers::MatchFinder &Finder);
};
} // namespace reorder_fields
} // namespace clang

#endif // LLVM_CLANG_TOOLS_EXTRA_CLANG_REORDER_FIELDS_ACTION_H
