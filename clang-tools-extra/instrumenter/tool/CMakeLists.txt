add_clang_tool(clang-aa-instrumenter
  ClangReorderFields.cpp
  )

clang_target_link_libraries(clang-aa-instrumenter
  PRIVATE
  clangBasic
  clangFrontend
  clangRewrite
  clangSerialization
  clangTooling
  clangToolingCore
  )
target_link_libraries(clang-aa-instrumenter
  PRIVATE
  clangAAInstrumenter
  )
