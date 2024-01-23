from __future__ import annotations
from core import AAInstrumentationDriver, register_arguments
from multiprocessing import Pool
import os
from pathlib import Path
import subprocess
import hashlib
import argparse
import sys
from dataclasses import dataclass
from abc import abstractmethod


@dataclass
class OptimizerDriver(AAInstrumentationDriver):
    optimizers: list[Optimizer] | None = None

    def register_optimizer(
        self, optimizer_factory: Callable[OptimizerDriver, Optimizer]
    ):
        if self.optimizers is None:
            self.optimizers = []
        self.optimizers.append(optimizer_factory(self))

    def register_optimizers(
        self, optimizer_factories: list[Callable[OptimizerDriver, Optimizer]]
    ):
        for optimizer_factory in optimizer_factories:
            self.register_optimizer(optimizer_factory)

    def run(self):
        self.generate_baseline()
        files = self.get_baseline_files()

        candidates_per_file = self.get_candidates_per_file(files)

        precise_sizes = {}
        for file_ in files:
            precise_sizes[file_] = self.run_assemble_and_measure_file(file_, 0, [])

        for file_ in files:
            print(f"Optimizing {file_}")
            print(f"Number of candidates: {candidates_per_file[file_]}")
            print(f"Baseline: {precise_sizes[file_]}")
            for optimizer in self.optimizers:
                current_minimum = optimizer.optimize(file_, candidates_per_file[file_])
                print(f"{optimizer.description}: {current_minimum}")


@dataclass
class Optimizer:
    driver: OptimizerDriver

    @abstractmethod
    def optimize(self, file_name: Path, num_candidates: int) -> int:
        """Applies the optimization to the file_name, and returns minimumm size."""
        pass


class ImpreciseBaseline(Optimizer):
    """
    This class implements the imprecise baseline. Essentially, it runs the
    instrumentation with fully imprecise AAInformation.
    """

    def __init__(self, driver: OptimizerDriver):
        super().__init__(driver)

    description = "Imprecise Baseline"

    def optimize(self, file_name: Path, num_candidates: int) -> int:
        return self.driver.run_assemble_and_measure_file(
            file_name, 0, list(range(num_candidates))
        )


def imprecise_factory():
    return lambda driver: ImpreciseBaseline(driver)


class RandomOptimizer(Optimizer):
    """
    This class implements the random optimizer. It randomly chooses a set of
    candidates, runs the instrumentation with that set, and returns the minimum
    size encountered.
    """

    def __init__(self, driver: OptimizerDriver, num_runs: int):
        super().__init__(driver)
        self.num_runs = num_runs

    description = "Random Optimizer"
    num_runs: int = 0

    def optimize(self, file_name: Path, num_candidates: int) -> int:
        population = self.driver.get_n_random_sequences(num_candidates, self.num_runs)
        sizes = []
        for i, sample in enumerate(population):
            sizes.append(
                self.driver.run_assemble_and_measure_file(file_name, i, sample)
            )

        return min(sizes)


def random_factory(num_runs: int):
    return lambda driver: RandomOptimizer(driver, num_runs)


class AutoTuningOptimizer(Optimizer):
    """
    This class implements the local Autotuner. It aims to optimize the size of
    the final binary by sequentially trying out the queries in the compilation.
    If a query reduces the size, it is fied to imprecise for all following
    queries.
    """

    def __init__(self, driver: OptimizerDriver):
        super().__init__(driver)

    description = "AutoTuner"

    def optimize(self, file_name: Path, num_candidates: int) -> int:
        prefix = []
        curr_size = self.driver.run_assemble_and_measure_file(file_name, 0, [])

        for i in range(num_candidates):
            new_size = self.driver.run_assemble_and_measure_file(
                file_name, i, prefix + [i]
            )
            if new_size < curr_size:
                curr_size = new_size
                prefix.append(i)

        return curr_size


def autotuner_factory():
    return lambda driver: AutoTuningOptimizer(driver)


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
    driver.register_optimizers(
        [
            imprecise_factory(),
            random_factory(100),
            autotuner_factory(),
        ]
    )
    driver.run()
