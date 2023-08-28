#!/bin/bash
python3 /home/michel/ETH/AST/llvm-project/instrument_alias.py --file_to_check $1 --size_diff 64 --sequence 45 --func_name price_out_impl
