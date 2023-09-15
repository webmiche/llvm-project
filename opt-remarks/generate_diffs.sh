#!/bin/bash

~/opencompl/llvm-project/build_30.08.2023/bin/clang -O2 -o /dev/null $1 -fsave-optimization-record -S -foptimization-record-file=remarks_O2.yaml -Wno-everything #-mllvm -fextend-lifetimes
~/opencompl/llvm-project/build_30.08.2023/bin/clang -O3 -o /dev/null $1 -fsave-optimization-record -S -foptimization-record-file=remarks_O3.yaml -Wno-everything #-mllvm -fextend-lifetimes
../llvm/tools/opt-viewer/opt-diff.py remarks_O2.yaml remarks_O3.yaml --output=diff.yaml
../llvm/tools/opt-viewer/opt-stats.py diff.yaml
../llvm/tools/opt-viewer/opt-viewer.py diff.yaml --output-dir html --source-dir ./
#rm remarks_O2.yaml remarks_O3.yaml diff.yaml
