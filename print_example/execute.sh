#!/bin/bash

../build_instrumented/bin/opt -passes="cffunction-instrumentation" test.ll -o instrumented.ll
../build_instrumented/bin/clang runner.c instrumented.ll -o instrumented -Wno-override-module
./instrumented
