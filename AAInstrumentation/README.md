1. Change the numbers in `aa_reduction.sh` to the proper values.

2. Run reduction:

```bash
./build_new_instr/bin/llvm-reduce naive_start/605/implicit.bc --test=AAInstrumentation/aa_reduction.sh -j 12
```
