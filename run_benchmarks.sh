#!/bin/bash

for benchmark in 600 605 619 631 638 641 644 657; do
    echo "Running benchmark $benchmark with passes"
    cd /local/home/webmiche/specbuilder/run/${benchmark}_run
    for i in {1..5}; do
        echo "Iteration $i"
        time ./run.sh ../../build_with_passes/${benchmark} > /dev/null
    done

    echo "Running benchmark $benchmark without passes"
    for i in {1..5}; do
        echo "Iteration $i"
        time ./run.sh ../../build_no_passes/${benchmark} > /dev/null
    done
    echo "Benchmark $benchmark completed"
done
