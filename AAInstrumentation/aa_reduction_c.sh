#!/bin/bash

/home/michel/ETH/AST/llvm-project/build_new_instr/bin/clang -S -emit-llvm -Xclang -disable-llvm-optzns pstart_preprocessed.c -o pstart_preprocessed.bc -Oz

python3 /home/michel/ETH/AST/llvm-project/AAInstrumentation/aa_reduction.py --file_name pstart_preprocessed.bc --size_diff 11 --sequence 0
