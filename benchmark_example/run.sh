#!/bin/bash

echo "GCC"

gcc main.c foo_precise.s foo_relaxed.s -O3 -o out.o
./out.o

echo "Clang"

clang main.c foo_precise.s foo_relaxed.s -O3 -o out.o
./out.o
