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

    def __post_init__(self):
        optimizer_list = []
        for optimizer in self.optimizers:
            optimizer_list.append(
                optimizer(
                    self.instr_path,
                    self.exec_root,
                    self.specbuild_dir,
                    self.benchmark,
                    self.initial_dir,
                    self.instr_dir,
                    self.groundtruth_dir,
                    self.opt_flag,
                    self.proc_count,
                )
            )
        self.optimizers = optimizer_list

    def run(self):
        self.generate_baseline()
        files = self.get_baseline_files()

        candidates_per_file = self.get_candidates_per_file(files)

        precise_sizes = {}
        for file_ in files:
            precise_sizes[file_] = self.run_assemble_and_measure_file(file_, 0, [])

        for optimizer in self.optimizers:
            for file_ in files:
                print(f"Optimizing {file_} with {optimizer.description}")
                print(f"Number of candidates: {candidates_per_file[file_]}")
                current_minimum = optimizer.optimize(file_, candidates_per_file[file_])
                print(f"Minimum size: {current_minimum}")
                print(f"Compared to precise size: {precise_sizes[file_]}")


class Optimizer(AAInstrumentationDriver):
    @abstractmethod
    def optimize(self, file_name: Path, num_candidates: int) -> int:
        """Applies the optimization to the file_name, and returns minimumm size."""
        pass


class ImpreciseBaseline(Optimizer):
    """
    This class implements the imprecise baseline. Essentially, it runs the
    instrumentation with fully imprecise AAInformation.
    """

    description = "Imprecise search"

    def optimize(self, file_name: Path, num_candidates: int) -> int:
        return self.run_assemble_and_measure_file(
            file_name, 0, list(range(num_candidates))
        )


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
        [ImpreciseOptimizer],
    )
    driver.run()
