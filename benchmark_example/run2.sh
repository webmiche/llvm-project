#!/bin/bash

echo "Clang"

#../build_instr/bin/clang main2.c foo_precise2.c foo_relaxed2.c -O3 -march=native -o out.o
clang main2.c foo_precise2.c foo_relaxed2.c -O3 -march=native -o out.o
./out.o
