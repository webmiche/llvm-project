outfile=$1.ll
bash c_to_ll.sh $1 -o $outfile
bash ll_opt.sh $outfile -S -o "$1.opt.ll" --stats 2>&1 | tee "$1.opt.out"
