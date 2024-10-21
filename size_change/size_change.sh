./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -Oz --aasequence=9-0-1-2-3-4-7-8-11-12 -o res9.bc
./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -Oz --aasequence=9-0-1-2-3-4-7-8-11-12 -o res9.ll -S
./build_new_instr/bin/llc -O2 res9.bc
./build_new_instr/bin/llc --filetype=obj -O2 res9.bc

./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -Oz --aasequence=8-0-1-2-3-4-7-8-11 -o res8.bc
./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -Oz --aasequence=8-0-1-2-3-4-7-8-11 -o res8.ll -S
./build_new_instr/bin/llc -O2 res8.bc
./build_new_instr/bin/llc --filetype=obj -O2 res8.bc

./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -Oz --aasequence=7-0-1-2-3-4-7-8 -o res7.bc
./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -Oz --aasequence=7-0-1-2-3-4-7-8 -o res7.ll -S
./build_new_instr/bin/llc -O2 res7.bc
./build_new_instr/bin/llc --filetype=obj -O2 res7.bc

./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -Oz --aasequence=6-0-1-2-3-4-7 -o res6.bc
./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -Oz --aasequence=6-0-1-2-3-4-7 -o res6.ll -S
./build_new_instr/bin/llc -O2 res6.bc
./build_new_instr/bin/llc --filetype=obj -O2 res6.bc

./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -Oz --aasequence=5-0-1-2-3-4 -o res5.bc
./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -Oz --aasequence=5-0-1-2-3-4 -o res5.ll -S
./build_new_instr/bin/llc -O2 res5.bc
./build_new_instr/bin/llc --filetype=obj -O2 res5.bc

./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -Oz --aasequence=4-0-1-2-3 -o res4.bc
./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -Oz --aasequence=4-0-1-2-3 -o res4.ll -S
./build_new_instr/bin/llc -O2 res4.bc
./build_new_instr/bin/llc --filetype=obj -O2 res4.bc

./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -Oz --aasequence=3-0-1-2 -o res3.bc
./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -Oz --aasequence=3-0-1-2 -o res3.ll -S
./build_new_instr/bin/llc -O2 res3.bc
./build_new_instr/bin/llc --filetype=obj -O2 res3.bc

./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -Oz --aasequence=2-0-1 -o res2.bc
./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -Oz --aasequence=2-0-1 -o res2.ll -S
./build_new_instr/bin/llc -O2 res2.bc
./build_new_instr/bin/llc --filetype=obj -O2 res2.bc

./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -Oz --aasequence=1-0 -o res1.bc
./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -Oz --aasequence=1-0 -o res1.ll -S
./build_new_instr/bin/llc -O2 res1.bc
./build_new_instr/bin/llc --filetype=obj -O2 res1.bc

./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -Oz --aasequence=0- -o res0.bc
./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -Oz --aasequence=0- -o res0.ll -S
./build_new_instr/bin/llc -O2 res0.bc
./build_new_instr/bin/llc --filetype=obj -O2 res0.bc

./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -Oz -o res_prec.bc
./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -Oz -o res_prec.ll -S
./build_new_instr/bin/llc -O2 res_prec.bc
./build_new_instr/bin/llc --filetype=obj -O2 res_prec.bc

./build_new_instr/bin/llvm-size *.o
