#!/bin/bash
python3 /home/michel/ETH/AST/llvm-project/instrument_alias.py --file_to_check $1 --size_diff 80 --sequence 0 --func_name _Z4makeP7state_ti
