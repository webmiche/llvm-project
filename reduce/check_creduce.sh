#!/bin/bash
clang -g -S -emit-llvm -Oz -Xclang -disable-llvm-optzns implicit_preprocessed_try_all.c -o implicit_preprocessed.ll
python3 /home/michel/ETH/AST/llvm-project/instrument_alias.py --file_to_check implicit_preprocessed.ll --size_diff 40 --sequence 45 --try_all True --func_name price_out_impl
t1=$?
rm implicit_preprocessed.ll
exit $t1
