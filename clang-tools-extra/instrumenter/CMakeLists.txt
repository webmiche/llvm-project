set(LLVM_LINK_COMPONENTS
  FrontendOpenMP
  support
)

add_clang_library(clangAAInstrumenter
  AAInstrumenter.cpp
  AAInstrumenter.h

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
  clangARCMigrate
  )

add_subdirectory(tool)

include_directories(../../clang/lib/ARCMigrate)
