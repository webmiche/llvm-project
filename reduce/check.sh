#!/bin/bash
python3 /home/michel/ETH/AST/llvm-project/instrument_alias.py --file_to_check $1 --size_diff 54 --sequence 5 --func_name price_out_impl --try_all True
