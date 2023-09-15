
/home/michel/ETH/AST/llvm-project/build_instr/bin/opt implicit_preprocessed.ll -o /dev/null -Oz -S --print-changed --print-module-scope > trace_unchanged_diff.txt
/home/michel/ETH/AST/llvm-project/build_instr/bin/opt implicit_preprocessed.ll -o /dev/null -Oz -S --print-after-all --print-module-scope 2> trace_unchanged.txt

/home/michel/ETH/AST/llvm-project/build_instr/bin/opt implicit_preprocessed.ll -o /dev/null -Oz --aafunc=foo --aasequence=1-1 -S --print-changed --print-module-scope > trace_changed_diff.txt
/home/michel/ETH/AST/llvm-project/build_instr/bin/opt implicit_preprocessed.ll -o /dev/null -Oz --aafunc=foo --aasequence=1-1 -S --print-after-all --print-module-scope 2> trace_changed.txt
