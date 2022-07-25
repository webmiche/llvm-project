outfile=$1
bash ll_opt.sh "${@:2}"  $outfile -S -o "$1.opt.ll" 2>&1 | tee "$1.opt.out"
