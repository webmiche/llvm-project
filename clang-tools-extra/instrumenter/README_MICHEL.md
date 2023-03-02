in instrumenter/:

../../build_niels/bin/clang-aa-instrumenter ./examples/test_simple.c --funcs-and-vars=is_attacked:sq:0 --> tmp.c
add “#define BSC_INST_OFFSET_READ(expr, amt) *(char**)(((char*)&(expr)) + (amt))” on top of tmp.c


clang tmp.c driver.c -O3
./a.out > tmp.aavars
change tmp.aavars file to foo:y:0|0x7ffde008aef8- style (remove first part)

clang -Xclang -disable-llvm-passes tmp.c -S -emit-llvm
../../build_niels/bin/opt -O3 -S tmp.ll --aainstfile tmp.aavars
