#!/bin/bash

#for benchmark in 600 605 619 631 638 641 644 657; do
#    echo "Running benchmark $benchmark with passes"
#    cd /local/home/webmiche/specbuilder/run/${benchmark}_run
#    for i in {1..5}; do
#        echo "Iteration $i"
#        time ./run.sh ../../build_with_passes/${benchmark} > /dev/null
#    done
#
#    echo "Running benchmark $benchmark without passes"
#    for i in {1..5}; do
#        echo "Iteration $i"
#        time ./run.sh ../../build_no_passes/${benchmark} > /dev/null
#    done
#    echo "Benchmark $benchmark completed"
#done

#for benchmark in 600 605 619 631 638 641 644 657; do
for benchmark in 605 600 641 631 619 644 657 638; do
    echo "Running benchmark $benchmark with O1"
    cd /local/home/webmiche/specbuilder/run/${benchmark}_run
    for i in {1..100}; do
        echo "Iteration $i"
        time ./run.sh ../../build_O1/${benchmark} > /dev/null
    done

    echo "Running benchmark $benchmark with O2"
    for i in {1..100}; do
        echo "Iteration $i"
        time ./run.sh ../../build_O2/${benchmark} > /dev/null
    done

    echo "Running benchmark $benchmark with O3"
    for i in {1..100}; do
        echo "Iteration $i"
        time ./run.sh ../../build_O3/${benchmark} > /dev/null
    done
done
