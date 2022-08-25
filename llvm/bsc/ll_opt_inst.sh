/home/nius/thesis/llvm-project/llvm/build/bin/opt -O3 -S -o "$1.opt.ll" --stats $1 $2 2>&1 | tee "$1.opt.out"
