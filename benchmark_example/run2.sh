#!/bin/bash

echo "Clang"

clang main2.c foo_precise2.c foo_relaxed2.c -O3 -march=native -o out.o
./out.o
