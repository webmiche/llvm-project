from optimization import (
    Optimizer,
    OptimizerDriver,
    imprecise_factory,
    parallel_random_factory,
    parallel_local_autotuner_factory,
)
from maximal_relaxation import (
    SequentialIndividualRelaxationDriver,
)
from unique_hashes import ParallelUniqueHashesDriver
from core import register_arguments
import sys
from pathlib import Path
from typing import Callable


def run_optimization(
    driver: OptimizerDriver,
    optimizer_factories: list[Callable[[OptimizerDriver], Optimizer]],
):
    driver.register_optimizers(optimizer_factories)
    driver.run()


benchmarks = [
    "619",
    "605",
    "631",
    "641",
    "644",
    "657",
    "625",
    "638",
    "620",
    "600",
    "623",
    "602",
]

def run_optimization_experiment(instr_path, exec_root, specbuild_dir, initial_dir, instr_dir, groundtruth_dir, proc_count, benchmarks: list[str]):
    for benchmark in benchmarks:
        sys.stdout = open(f"AAInstrumentation/output/{benchmark}.txt", "w")
        print(f"Running benchmark {benchmark} with Oz")
        driver = OptimizerDriver(
            instr_path,
            exec_root,
            specbuild_dir,
            benchmark,
            initial_dir,
            instr_dir,
            groundtruth_dir,
            "Oz",
            proc_count,
        )
        run_optimization(
            driver,
            [
                imprecise_factory(),
                parallel_random_factory(1000),
                parallel_local_autotuner_factory(),
            ],
        )

def run_unique_hashes_experiment(instr_path, exec_root, specbuild_dir, initial_dir, instr_dir, groundtruth_dir, proc_count, benchmarks: list[str]):
    for benchmark in benchmarks:
        sys.stdout = open(f"AAInstrumentation/output/{benchmark}.txt", "w")
        print(f"Running benchmark {benchmark} with Oz")
        driver = ParallelUniqueHashesDriver(
            instr_path,
            exec_root,
            specbuild_dir,
            benchmark,
            initial_dir,
            instr_dir,
            groundtruth_dir,
            "Oz",
            proc_count,
        )
        driver.generate_baseline()

        files = driver.get_baseline_files()

        candidates_per_file = driver.get_candidates_per_file(files)
        for file, num_candidates in candidates_per_file.items():
            print(f"{file}: {num_candidates}")
            unique_hashes = driver.get_num_unique_hashes(file, num_candidates, 10000)
            print(f"Unique hashes: {unique_hashes} of 100 runs")


def run_maximal_relaxation_experiment(instr_path, exec_root, specbuild_dir, initial_dir, instr_dir, groundtruth_dir, proc_count, benchmarks: list[str]):
    for benchmark in benchmarks:
        sys.stdout = open(f"AAInstrumentation/output/{benchmark}.txt", "w")
        print(f"Running benchmark {benchmark} with Oz")
        driver = SequentialIndividualRelaxationDriver(
            instr_path,
            exec_root,
            specbuild_dir,
            benchmark,
            initial_dir,
            instr_dir,
            groundtruth_dir,
            "Oz",
            proc_count,
            "",
            False
        )
        driver.maximal_relaxation()


if __name__ == "__main__":
    arg_parser = register_arguments()
    arg_parser.add_argument(
        "--optimization",
        action="store_true",
        help="Run optimization experiment",
    )
    arg_parser.add_argument(
        "--unique_hashes",
        action="store_true",
        help="Run unique hashes experiment",
    )
    arg_parser.add_argument(
        "--maximal_relaxation",
        action="store_true",
        help="Run maximal relaxation experiment",
    )
    arg_parser.add_argument(
        "--all",
        action="store_true",
        help="Run for all benchmarks",
    )

    with open("AAInstrumentation/config.txt", "r") as config_file:
        args = arg_parser.parse_args(config_file.read().splitlines() + sys.argv[1:])

    if sum([args.optimization, args.unique_hashes, args.maximal_relaxation]) > 1:
        print("Please specify only one of the following flags: --optimization, --unique_hashes, --maximal_relaxation")
        exit(1)

    instr_path = args.instr_path
    exec_root = args.exec_root
    specbuild_dir = args.specbuild_dir
    benchmark = args.benchmark
    initial_dir = args.initial_dir
    instr_dir = args.instr_dir
    groundtruth_dir = args.groundtruth_dir

    Path("AAInstrumentation/output").mkdir(parents=True, exist_ok=True)

    if not args.all:
        benchmarks = [benchmark]

    if args.optimization:
        run_optimization_experiment(instr_path, exec_root, specbuild_dir, initial_dir, instr_dir, groundtruth_dir, args.proc_count, benchmarks)

    if args.unique_hashes:
        run_unique_hashes_experiment(instr_path, exec_root, specbuild_dir, initial_dir, instr_dir, groundtruth_dir, args.proc_count, benchmarks)

    if args.maximal_relaxation:
        run_maximal_relaxation_experiment(instr_path, exec_root, specbuild_dir, initial_dir, instr_dir, groundtruth_dir, args.proc_count, benchmarks)
