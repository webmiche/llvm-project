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
  clangBasic
  clangIndex
  clangLex
  clangSerialization
  clangToolingCore
  )

add_subdirectory(tool)
