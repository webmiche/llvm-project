set(LLVM_LINK_COMPONENTS
  FrontendOpenMP
  support
)

add_clang_library(clangAAInstrumenter
  ReorderFieldsAction.cpp

  DEPENDS
  omp_gen
)

clang_target_link_libraries(clangAAInstrumenter
  PRIVATE
  clangAST
  clangASTMatchers
  clangRewrite
  clangBasic
  clangIndex
  clangTransformer
  clangLex
  clangSerialization
  clangToolingCore
  clangAnalysis
  clangFormat
  clangFrontend
  clangSema
  clangTooling
  )

add_subdirectory(tool)
