#!/bin/bash

/home/michel/ETH/AST/llvm-project/build_new_instr/bin/clang -S -emit-llvm -Xclang -disable-llvm-optzns readmin_preprocessed.c -o readmin_preprocessed.bc -Oz

python3 /home/michel/ETH/AST/llvm-project/AAInstrumentation/aa_reduction.py --file_name readmin_preprocessed.bc --size_diff 6 --sequence 2 --exec_root $(pwd)
