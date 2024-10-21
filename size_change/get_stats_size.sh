./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -disable-output -Oz --aasequence=9-0-1-2-3-4-7-8-11-12 -stats 2> stats_234_size.txt
./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -disable-output -Oz --aasequence=8-0-1-2-3-4-7-8-11 -stats 2> stats_240_first_size.txt
./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -disable-output -Oz --aasequence=5-0-1-2-3-4 -stats 2> stats_240_last_size.txt
./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -disable-output -Oz --aasequence=4-0-1-2-3 -stats 2> stats_278_size.txt
./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -disable-output -Oz --aasequence=3-0-1-2 -stats 2> stats_384_size.txt
./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -disable-output -Oz --aasequence=2-0-1 -stats 2> stats_389_size.txt
./build_new_instr/bin/opt naive_start/657/liblzma/common/vli_decoder.bc -disable-output -Oz -stats 2> stats_precise_size.txt

