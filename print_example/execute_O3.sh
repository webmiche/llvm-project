#!/bin/bash

../build_instrumented/bin/opt -O3 test.ll -S -o instrumented.ll
../build_instrumented/bin/clang runner.c instrumented.ll -o instrumented -Wno-override-module
./instrumented
