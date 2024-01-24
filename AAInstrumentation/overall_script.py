from optimization import (
    Optimizer,
    OptimizerDriver,
    imprecise_factory,
    parallel_random_factory,
    parallel_local_autotuner_factory,
)
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


if __name__ == "__main__":
    arg_parser = register_arguments()

    with open("AAInstrumentation/config.txt", "r") as config_file:
        args = arg_parser.parse_args(config_file.read().splitlines() + sys.argv[1:])
    instr_path = args.instr_path
    exec_root = args.exec_root
    specbuild_dir = args.specbuild_dir
    benchmark = args.benchmark
    initial_dir = args.initial_dir
    instr_dir = args.instr_dir
    groundtruth_dir = args.groundtruth_dir

    Path("AAInstrumentation/output").mkdir(parents=True, exist_ok=True)
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
            args.proc_count,
        )
        run_optimization(
            driver,
            [
                imprecise_factory(),
                parallel_random_factory(1000),
                parallel_local_autotuner_factory(),
            ],
        )
