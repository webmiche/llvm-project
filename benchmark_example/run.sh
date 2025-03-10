#!/bin/bash

clang main.c foo_precise.s foo_relaxed.s -O3 -o out.o
./out.o
