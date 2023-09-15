clang -g -S -emit-llvm -Oz -Xclang -disable-llvm-optzns implicit_preprocessed.c -o implicit_preprocessed.ll

# Generate the groundtruth
/home/michel/ETH/AST/llvm-project/build_instr/bin/opt implicit_preprocessed.ll -o implicit_preprocessed_unchanged.ll -Oz -S
/home/michel/ETH/AST/llvm-project/build_instr/bin/llc -O2 -filetype=obj implicit_preprocessed_unchanged.ll
/home/michel/ETH/AST/llvm-project/build_instr/bin/llvm-size implicit_preprocessed_unchanged.o

# Generate the first change
/home/michel/ETH/AST/llvm-project/build_instr/bin/opt implicit_preprocessed.ll -o implicit_preprocessed_changed.ll -Oz --aafunc=foo --aasequence=1-0 -S
/home/michel/ETH/AST/llvm-project/build_instr/bin/llc -O2 -filetype=obj implicit_preprocessed_changed.ll
/home/michel/ETH/AST/llvm-project/build_instr/bin/llvm-size implicit_preprocessed_changed.o

# Generate the first change
/home/michel/ETH/AST/llvm-project/build_instr/bin/opt implicit_preprocessed.ll -o implicit_preprocessed_changed.ll -Oz --aafunc=foo --aasequence=1-1 -S
/home/michel/ETH/AST/llvm-project/build_instr/bin/llc -O2 -filetype=obj implicit_preprocessed_changed.ll
/home/michel/ETH/AST/llvm-project/build_instr/bin/llvm-size implicit_preprocessed_changed.o

# Generate the second change
/home/michel/ETH/AST/llvm-project/build_instr/bin/opt implicit_preprocessed.ll -o implicit_preprocessed_changed_2.ll -Oz --aafunc=foo --aasequence=2-0-1 -S
/home/michel/ETH/AST/llvm-project/build_instr/bin/llc -O2 -filetype=obj implicit_preprocessed_changed_2.ll
/home/michel/ETH/AST/llvm-project/build_instr/bin/llvm-size implicit_preprocessed_changed_2.o
