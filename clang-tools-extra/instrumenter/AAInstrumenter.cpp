//===-- tools/extra/clang-reorder-fields/AAInstrumenter.cpp -*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the definition of the
/// AAInstrumenter::newASTConsumer method
///
//===----------------------------------------------------------------------===//

#include "AAInstrumenter.h"
#include "clang/AST/AST.h"
#include "clang/AST/ASTConsumer.h"
#include "clang/AST/ASTContext.h"
#include "clang/AST/Decl.h"
#include "clang/AST/Mangle.h"
#include "clang/AST/RecursiveASTVisitor.h"
#include "clang/ASTMatchers/ASTMatchFinder.h"
#include "clang/Lex/Lexer.h"
#include "clang/Tooling/Refactoring.h"
#include "llvm/ADT/SetVector.h"
#include "llvm/IR/Value.h"
#include <algorithm>
#include <clang/AST/Stmt.h>
#include <clang/ASTMatchers/ASTMatchers.h>
#include <clang/ASTMatchers/ASTMatchersMacros.h>
#include <clang/Tooling/Transformer/MatchConsumer.h>
#include <clang/Tooling/Transformer/RewriteRule.h>
#include <string>
#include <vector>

namespace clang {
namespace aa_instrumenter {
using namespace clang::ast_matchers;
using namespace clang::tooling;
using namespace clang::ast_matchers;
using namespace clang::transformer;
using namespace clang::transformer::detail;

/// Finds all declRefExpr with appropriate name inside the given function
static const std::vector<const DeclRefExpr *>
findVariableUses(StringRef FunctionName, StringRef VarName,
                 ASTContext &Context) {
  std::vector<const DeclRefExpr *> res;
  auto Results = match(
      functionDecl(hasName(FunctionName), isDefinition(),
                   forEachDescendant(expr(
                       declRefExpr(hasDeclaration(namedDecl(hasName(VarName))))
                           .bind("declRef")))),
      Context);
  if (Results.empty()) {
    llvm::errs() << "Definition of " << FunctionName << "  not found\n";
    return res;
  }

  llvm::errs() << "Found: " << Results.size() << " uses of " << VarName << "\n";
  for (const BoundNodes &N : Results) {
    if (const DeclRefExpr *Node = N.getNodeAs<DeclRefExpr>("declRef")) {
      Node->dump();
      res.push_back(Node);
    }
  }

  return res;
}

auto matchDeclRefRelevant(std::string VarName) {
  // "simple match helper:"
  // return hasDescendant(declRefExpr(hasDeclaration(namedDecl(hasName(VarName)))));
  
  // auto declRefDescendant = hasDescendant(declRefExpr(hasDeclaration(namedDecl(hasName(VarName)))));
  // cannot have local matchers like above apparently, lead to segfault
  return anyOf(
      allOf(unless(ifStmt()),
            anyOf(hasDescendant(
                      declRefExpr(hasDeclaration(namedDecl(hasName(VarName))))),
                  declRefExpr(hasDeclaration(namedDecl(hasName(VarName)))))),
      ifStmt(hasCondition(anyOf(
          // has descendant is not reflexive
          hasDescendant(
              declRefExpr(hasDeclaration(namedDecl(hasName(VarName))))),
          declRefExpr(hasDeclaration(namedDecl(hasName(VarName))))))));
}

AST_MATCHER(DeclRefExpr, surroundingStmt) {
  (void)Builder;
  auto Parents = Finder->getASTContext().getParentMapContext().getParents(Node);
  llvm::errs() << "Node:\n";
  Node.dump();
  llvm::errs() << "\n";
  llvm::outs() << "Parents: " << Parents.size() << "\n";
  for (auto Parent : Parents) {
    llvm::outs() << "Parent: "
                 << Parent.getSourceRange().getBegin().printToString(
                        Finder->getASTContext().getSourceManager())
                 << "\n";
  }
  return true;
}

/*
Notes:
[[[ <-these classify the matched bit-> ]]]
Checking for "(Node is ValueStmt) AND (Parent is not)" leads to incorrect
matches at e.g. if statements and return statements: if ([[[color == WHITE]]]) {
        if ([[[BlackPawns & PawnAttacksWhite[sq]]]])
            return [[[bpawn]]];
    }
    -- No match is correct in above example
    -- want:
    [[[if (color == WHITE) {
        [[[if (BlackPawns & PawnAttacksWhite[sq])
            [[[return bpawn;]]]
        ]]]
    }]]]


Checking for "(Node is not ValueStmt) AND (First child of Node is ValueStmt)"
fixes the above issues, but introduces others, e.g.: void is_attacked(int a) {
        int sq;
        [[[if (true) [[[{
            a = a + sq;
            is_attacked(sq);
        }]]]]]]
    }
    -- Here only the [[[if.. match is correct, the [[[{ (compoundStmt) is not
(it is introduced because `a = a + sq;` is a ValueStmt), and
    -- the two innermost statements were missed and should have been matched.
    -- want:
    void is_attacked(int a) {
        int sq;
        [[[if (true) {
            [[[a = a + sq;]]]
            [[[is_attacked(sq);]]]
        }]]]
    }

*/
AST_MATCHER(Stmt, fineGrainedStmt) {
  (void)Builder;
  auto Parents = Finder->getASTContext().getParentMapContext().getParents(Node);
  auto Parent = Parents[0];
  auto ParentStmt = Parent.get<Stmt>();

  return (!ParentStmt ||
          isa<CompoundStmt>(ParentStmt)); // && isa<ValueStmt>(Node);

  if (isa<ValueStmt>(Node)) {
    return false;
  }

  // Go over children
  for (auto Child : Node.children()) {
    if (isa<ValueStmt>(Child)) {
      return true;
    }
    // Breaking for multi-child statements like compound or if - we only want
    // e.g. the if statement's expression to be considered
    break;
  }

  llvm::errs() << "Node:\n";
  Node.dump();
  llvm::errs() << "\n";
  // llvm::errs() << "ParentStmt:\n";
  // ParentStmt->dump();
  // llvm::errs() << "\n";

  // return (!ParentStmt || !isa<ValueStmt>(ParentStmt)) &&
  // isa<ValueStmt>(Node);
  return false;
}

// AST_MATCHER_P(FunctionDecl, hasMangledName, std::string, WantMangledName) {
//   (void)Builder;
//   Node.getName();
//   auto ctx = MangleContext(Finder->getASTContext(), nullptr, MangleContext::MK_Itanium);
//   std::string mangledName = ctx.mangleName(&Node);


//   return mangledName == WantMangledName;
// }

std::string genPrintf(std::string VarName) {
  return "printf(\"" + VarName + ":%p\\n\", (void*)&" + VarName + ");";
}

// Takes func-name:var-name string and returns a pair of function name and
// variable name
static std::pair<std::string, std::string>
parseFunctionVariableName(std::string Name) {
  std::pair<std::string, std::string> res;
  std::size_t pos = Name.find(':');
  if (pos == std::string::npos) {
    llvm::errs() << "Invalid function variable name: " << Name << "\n";
    return res;
  }
  res.first = Name.substr(0, pos);
  res.second = Name.substr(pos + 1);
  return res;
}

// Maps a vector of names to a vector of function variable pairs
static std::vector<std::pair<std::string, std::string>>
mapFunctionVariableNames(llvm::ArrayRef<std::string> &Names) {
  std::vector<std::pair<std::string, std::string>> res;
  for (auto Name : Names) {
    res.push_back(parseFunctionVariableName(Name));
  }
  return res;
}

ASTEdit addMarker(ASTEdit Edit) {
  return Edit;
    // return withMetadata(
    //     Edit,
    //     [](const clang::ast_matchers::MatchFinder::MatchResult &)
    //         -> EditMetadataKind { return EditMetadataKind::MarkerCall; });
}

auto InstrumentCStmt(std::string id) {
    return addMarker(insertBefore(statements(id), cat("")));
}

// Unnecessary helper function at the moment
EditGenerator InstrumentNonCStmt(std::string id, std::string VarName) {
    return flattenVector(
        {
          // edit(addMarker(
          //    insertBefore(statement(id), cat("{")))),
          edit(insertBefore(statement(id), cat("{" + genPrintf(VarName)))),
         edit(insertAfter(statement(id), cat("}")))
        //  edit(insertAfter(statement(id), cat("\n}")))
         });
}

auto instrumentIfElseBranch(std::string FuncName, std::string VarName) {
  //   auto customMatcher = functionDecl(
  //                    hasName(FunctionName), isDefinition(),
  //                    forEachDescendant(stmt(fineGrainedStmt()).bind("stmt")));

  auto actions =
        flattenVector({
          // ifBound("cthen", InstrumentCStmt("cthen")),
          // ifBound("celse", InstrumentCStmt("celse")),
          ifBound("then", InstrumentNonCStmt("then", VarName), noEdits()),
          ifBound("else", InstrumentNonCStmt("else", VarName), noEdits())

        });

  llvm::errs() << "Handling <if> " << FuncName << ":" << VarName << "\n";

  // auto matcherWithVar = hasDescendant(declRefExpr(hasDeclaration(
  //                                      namedDecl(hasName(VarName)))));

  /* 
  // Alternative that doesn't work:
    auto ifThen = ifStmt(
      hasThen(anyOf(compoundStmt(matchDeclRefRelevant(VarName)).bind("cthen"),
                    stmt(matchDeclRefRelevant(VarName)).bind("then"))));

  auto ifElse = ifStmt(hasElse(
      anyOf(compoundStmt(matchDeclRefRelevant(VarName)).bind("celse"),
            stmt(matchDeclRefRelevant(VarName))
                .bind("else"))));

  return makeRule(traverse(TK_IgnoreUnlessSpelledInSource,
                           functionDecl(hasName(FuncName), isDefinition(),
                                        anyOf(forEachDescendant(ifThen),
                                              forEachDescendant(ifElse)))),
                  actions);
  
  */

 // I think the problem is that in the ifStmt it only goes down one branch, either then or else, and ignores the other one.
 
  return makeRule(
      traverse(
          TK_IgnoreUnlessSpelledInSource,
          functionDecl(hasName(FuncName), isDefinition(),
                       forEachDescendant(ifStmt(
                           hasElse(
                               anyOf(compoundStmt(matchDeclRefRelevant(VarName)).bind("celse"),
                                     stmt(matchDeclRefRelevant(VarName)/*, hasParent(ifStmt())*/).bind("else"))))
                        ))),
      actions);

}

auto instrumentIf(std::string FuncName, std::string VarName) {
  //   auto customMatcher = functionDecl(
  //                    hasName(FunctionName), isDefinition(),
  //                    forEachDescendant(stmt(fineGrainedStmt()).bind("stmt")));

  auto actions =
        flattenVector({
          // ifBound("cthen", InstrumentCStmt("cthen")),
          // ifBound("celse", InstrumentCStmt("celse")),
          ifBound("then", InstrumentNonCStmt("then", VarName), noEdits()),
          ifBound("else", InstrumentNonCStmt("else", VarName), noEdits())

        });

  llvm::errs() << "Handling <if> " << FuncName << ":" << VarName << "\n";

  // auto matcherWithVar = hasDescendant(declRefExpr(hasDeclaration(
  //                                      namedDecl(hasName(VarName)))));

  /* 
  // Alternative that doesn't work:
    auto ifThen = ifStmt(
      hasThen(anyOf(compoundStmt(matchDeclRefRelevant(VarName)).bind("cthen"),
                    stmt(matchDeclRefRelevant(VarName)).bind("then"))));

  auto ifElse = ifStmt(hasElse(
      anyOf(compoundStmt(matchDeclRefRelevant(VarName)).bind("celse"),
            stmt(matchDeclRefRelevant(VarName))
                .bind("else"))));

  return makeRule(traverse(TK_IgnoreUnlessSpelledInSource,
                           functionDecl(hasName(FuncName), isDefinition(),
                                        anyOf(forEachDescendant(ifThen),
                                              forEachDescendant(ifElse)))),
                  actions);
  
  */

 // I think the problem is that in the ifStmt it only goes down one branch, either then or else, and ignores the other one.

  return makeRule(
      traverse(
          TK_IgnoreUnlessSpelledInSource,
          functionDecl(hasName(FuncName), isDefinition(),
                       forEachDescendant(ifStmt(
                           hasThen(anyOf(compoundStmt(matchDeclRefRelevant(VarName)).bind("cthen"),
                                         stmt(matchDeclRefRelevant(VarName)).bind("then"))))
                        ))),
      actions);


  // return makeRule(
  //     traverse(
  //         TK_IgnoreUnlessSpelledInSource,
  //         functionDecl(hasName(FuncName), isDefinition(),
  //                      forEachDescendant(ifStmt(
  //                          optionally(hasElse(
  //                              anyOf(compoundStmt(matcherWithVar).bind("celse"),
  //                                    stmt(matcherWithVar, hasParent(ifStmt())).bind("else")))),
  //                          hasThen(anyOf(compoundStmt(matcherWithVar).bind("cthen"),
  //                                        stmt(matcherWithVar).bind("then"))))))),
  //     actions);
}



auto instrumentSimpleCompound(std::string FuncName, std::string VarName) {
  auto Edits = SmallVector<ASTEdit, 1>();
  Edits.push_back(insertBefore(node("stmt"), cat(genPrintf(VarName))));
  // Edits.push_back(insertBefore(node("stmt"), cat("[[[")));
  // Edits.push_back(insertAfter(node("stmt"), cat("]]]")));

  //   auto customMatcher = functionDecl(
  //                    hasName(FunctionName), isDefinition(),
  //                    forEachDescendant(stmt(fineGrainedStmt()).bind("stmt")));

  llvm::errs() << "Handling " << FuncName << ":" << VarName << "\n";

  return makeRule(traverse(TK_IgnoreUnlessSpelledInSource,
      functionDecl(hasName(FuncName), isDefinition(),
                   forEachDescendant(stmt(hasParent(compoundStmt()),
                                          matchDeclRefRelevant(VarName)
                                          )
                                         .bind("stmt")))),
      Edits);
}

void AAInstrumenter::registerMatchers(
    clang::ast_matchers::MatchFinder &Finder) {
  // iterate here over all <func, var> pairs of FuncsAndVars and emplace_back to
  // Rules
  for (auto FuncAndVar : mapFunctionVariableNames(FuncsAndVars)) {
    Rules.emplace_back(
        instrumentSimpleCompound(FuncAndVar.first, FuncAndVar.second),
        Replacements);
    Rules.emplace_back(
        instrumentIf(FuncAndVar.first, FuncAndVar.second),
        Replacements);
    Rules.emplace_back(
      instrumentIfElseBranch(FuncAndVar.first, FuncAndVar.second),
      Replacements);
  }

  // This puts the "printf" right before the variable use, i.e. for "a = a +
  // sq;" it produces "a = a + printf()\nsq;", even though I'd want it to be
  // "printf();\n a = a + sq;". Rules.emplace_back(
  //     makeRule(functionDecl(
  //                  hasName(FunctionName), isDefinition(),
  //                  forEachDescendant(expr(
  //                      declRefExpr(hasDeclaration(namedDecl(hasName(VarName))),
  //                      surroundingStmt())
  //                          .bind("declRef"),
  //                      hasParent(stmt().bind("stmt"))))),
  //              insertBefore(node("stmt"), cat("printf();\n"))),
  //     Replacements);

  for (auto &Rule : Rules)
    Rule.registerMatchers(Finder);
}

// github.com/DeadCodeProductions/dead_instrumenter
void RuleActionCallback::run(
    const clang::ast_matchers::MatchFinder::MatchResult &Result) {
  if (Result.Context->getDiagnostics().hasErrorOccurred())
    return;
  Expected<SmallVector<transformer::Edit, 1>> Edits =
      clang::transformer::detail::findSelectedCase(Result, Rule).Edits(Result);
  if (!Edits) {
    llvm::errs() << "Rewrite failed: " << llvm::toString(Edits.takeError())
                 << "\n";
    return;
  }
  auto SM = Result.SourceManager;
  for (const auto &T : *Edits) {
    assert(T.Kind == transformer::EditKind::Range);
    auto R = tooling::Replacement(*SM, T.Range, T.Replacement);
    auto &Replacements = FileToReplacements[std::string(R.getFilePath())];
    auto Err = Replacements.add(R);
    if (Err) {
      auto NewOffset = Replacements.getShiftedCodePosition(R.getOffset());
      auto NewLength =
          Replacements.getShiftedCodePosition(R.getOffset() + R.getLength()) -
          NewOffset;
      if (NewLength == R.getLength()) {
        R = clang::tooling::Replacement(R.getFilePath(), NewOffset, NewLength,
                                        R.getReplacementText());
        Replacements = Replacements.merge(tooling::Replacements(R));
      } else {
        llvm_unreachable(llvm::toString(std::move(Err)).c_str());
      }
    }
  }
}

void RuleActionCallback::registerMatchers(
    clang::ast_matchers::MatchFinder &Finder) {

  for (auto &Matcher : clang::transformer::detail::buildMatchers(Rule))
    Finder.addDynamicMatcher(Matcher, this);
}

} // namespace aa_instrumenter
} // namespace clang
