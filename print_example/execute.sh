#!/bin/bash

../build_instrumented/bin/opt -passes="print<cffunction-analysis>,cffunction-instrumentation" test.ll -S -o instrumented.ll
../build_instrumented/bin/clang runner.c instrumented.ll -o instrumented -Wno-override-module
./instrumented
