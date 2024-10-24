from __future__ import annotations
from core import (
    AAInstrumentationDriver,
    register_arguments,
    AASequence,
    index,
    size,
    linked_libraries,
)
from multiprocessing import Pool
import os
from pathlib import Path
from subprocess import run, DEVNULL
import hashlib
import argparse
import sys
from dataclasses import dataclass
from abc import abstractmethod
import random
import time
from typing import TypeAlias, Callable


@dataclass
class OptimizerDriver(AAInstrumentationDriver):
    optimizers: list[Optimizer] | None = None

    def register_optimizer(
        self, optimizer_factory: Callable[[OptimizerDriver], Optimizer]
    ):
        if self.optimizers is None:
            self.optimizers = []
        self.optimizers.append(optimizer_factory(self))

    def register_optimizers(
        self, optimizer_factories: list[Callable[[OptimizerDriver], Optimizer]]
    ):
        for optimizer_factory in optimizer_factories:
            self.register_optimizer(optimizer_factory)

    def run(self):
        required_empty_paths = [
            self.instr_dir,
            Path("res/"),
            Path("aa_sequences/"),
        ]
        self.setup_directories(required_empty_paths)

        self.generate_baseline()
        files = self.get_baseline_files()

        candidates_per_file = self.get_candidates_per_file(files)

        precise_sizes = {}
        for file_ in files:
            precise_sizes[file_] = self.run_assemble_and_measure_file(file_, 0, [])

        minima = {}

        for file_ in files:
            print(f"Optimizing {file_}")
            print(f"Number of candidates: {candidates_per_file[file_]}")
            print(f"Baseline: {precise_sizes[file_]}")
            assert self.optimizers is not None
            current_minimum = None
            current_prefix = None
            for optimizer in self.optimizers:
                start_time = time.time()
                new_min, new_prefix = optimizer.optimize(
                    file_, candidates_per_file[file_]
                )
                print(
                    f"{optimizer.description}: {new_min} in {time.time() - start_time}s"
                )
                if current_minimum is None or new_min < current_minimum:
                    current_minimum = new_min
                    current_prefix = new_prefix

            minima[file_] = current_minimum, current_prefix

        self.link_dict(minima, Path("res") / self.benchmark / self.benchmark)
        new_size = self.measure_outputsize(
            Path("res") / self.benchmark / self.benchmark
        )
        baseline_size = self.measure_outputsize(
            Path("baseline") / self.benchmark / self.benchmark
        )
        print(f"Baseline: {baseline_size}")
        print(f"New: {new_size}")

    def link_dict(
        self, result_dict: dict[Path, tuple[size, AASequence]], final_path: Path
    ):
        final_path.parent.mkdir(parents=True, exist_ok=True)

        object_files = []
        # Compiling the minima
        print("Minima:")
        for file_, (size, sequence) in result_dict.items():
            print(f"{file_}: {size} bytes with {sequence}")
            self.run_and_assemble_file(file_, 0, sequence)
            result_path = (
                self.instr_dir / file_.parent / Path("0" + str(file_.stem) + ".o")
            )
            end_path = (
                self.exec_root
                / Path("res")
                / file_.parent
                / Path("res_" + str(file_.stem) + ".o")
            )
            end_path.parent.mkdir(parents=True, exist_ok=True)
            cmd = ["mv", result_path, end_path]
            run(cmd, cwd=self.exec_root, check=True)
            object_files.append(end_path)

        # Linking the minima
        print("Linking:")
        cmd = (
            [
                str(self.instr_path.joinpath("clang")),
                "-no-pie",
                "-lstdc++",
                "-lm",
                "-o",
                str(final_path),
            ]
            + [
                ("-l" + link) if not link.startswith("-") else link
                for link in linked_libraries.get(str(self.benchmark), [])
            ]
            + [str(f) for f in object_files]
        )
        run(cmd, cwd=self.exec_root, stdout=DEVNULL)


@dataclass
class Optimizer:
    driver: OptimizerDriver
    description: str = "Optimizer"

    @abstractmethod
    def optimize(
        self, file_name: Path, num_candidates: size
    ) -> tuple[size, AASequence]:
        """Applies the optimization to the file_name, and returns minimumm size."""
        pass


class ImpreciseBaseline(Optimizer):
    """
    This class implements the imprecise baseline. Essentially, it runs the
    instrumentation with fully imprecise AAInformation.
    """

    def __init__(self, driver: OptimizerDriver):
        super().__init__(driver)
        self.description = "Imprecise Baseline"

    def optimize(
        self, file_name: Path, num_candidates: size
    ) -> tuple[size, AASequence]:
        return self.driver.run_assemble_and_measure_file(
            file_name, 0, list(range(num_candidates))
        ), list(range(num_candidates))


def imprecise_factory():
    return lambda driver: ImpreciseBaseline(driver)


class RandomOptimizer(Optimizer):
    """
    This class implements the random optimizer. It randomly chooses a set of
    candidates, runs the instrumentation with that set, and returns the minimum
    size encountered.
    """

    def __init__(self, driver: OptimizerDriver, num_runs: size, seed: int = 0):
        super().__init__(driver)
        self.num_runs = num_runs
        self.seed = seed
        self.description = f"Random Optimizer ({num_runs} runs)"

    num_runs: size = 0
    seed: int = 0

    def optimize(
        self, file_name: Path, num_candidates: size
    ) -> tuple[size, AASequence]:
        random.seed(self.seed)
        population = self.driver.get_n_random_sequences(num_candidates, self.num_runs)
        sizes = []
        for i, sample in enumerate(population):
            sizes.append(
                self.driver.run_assemble_and_measure_file(file_name, i, sample)
            )

        return min(sizes), population[sizes.index(min(sizes))]


def random_factory(num_runs: size, seed: int = 0):
    return lambda driver: RandomOptimizer(driver, num_runs, seed)


class ParallelRandomOptimizer(Optimizer):
    """
    This class implements the random optimizer in a parallel way. It randomly
    chooses a set of candidates, runs the instrumentation with that set, and
    returns the minimum size encountered.
    """

    def __init__(self, driver: OptimizerDriver, num_runs: size, seed: int = 0):
        super().__init__(driver)
        self.num_runs = num_runs
        self.seed = seed
        self.description = f"Parallel Random Optimizer ({num_runs} runs)"

    num_runs: size = 0
    seed: int = 0

    def optimize(
        self, file_name: Path, num_candidates: size
    ) -> tuple[size, AASequence]:
        random.seed(self.seed)
        population = self.driver.get_n_random_sequences(num_candidates, self.num_runs)
        sizes = []
        with Pool(self.driver.proc_count) as pool:
            sizes = pool.starmap(
                self.driver.run_assemble_and_measure_file,
                [(file_name, i, sample) for i, sample in enumerate(population)],
            )

        return min(sizes), population[sizes.index(min(sizes))]


def parallel_random_factory(num_runs: size, seed: int = 0):
    return lambda driver: ParallelRandomOptimizer(driver, num_runs, seed)


class AutoTuningOptimizer(Optimizer):
    """
    This class implements the local Autotuner. It aims to optimize the size of
    the final binary by sequentially trying out the queries in the compilation.
    If a query reduces the size, it is fied to imprecise for all following
    queries.
    """

    def __init__(self, driver: OptimizerDriver):
        super().__init__(driver)
        self.description = "AutoTuner"

    def optimize(
        self, file_name: Path, num_candidates: size
    ) -> tuple[size, AASequence]:
        prefix = []
        curr_size = self.driver.run_assemble_and_measure_file(file_name, 0, [])

        for i in range(num_candidates):
            new_size = self.driver.run_assemble_and_measure_file(
                file_name, i, prefix + [i]
            )
            if new_size < curr_size:
                curr_size = new_size
                prefix.append(i)

        return curr_size, prefix


def autotuner_factory():
    return lambda driver: AutoTuningOptimizer(driver)


IterationUpdate: TypeAlias = tuple[AASequence, index, size]


class ParallelLocalAutotuner(Optimizer):
    """
    This class implements the local Autotuner in a parallel way. It aims to
    optimize the size of the final binary by sequentially trying out the queries
    in the compilation. If a query reduces the size, it is fixed to imprecise for
    all following queries.

    This implementation is parallelized in that it proceeds batch-wise. For a
    given batch, each individual query is relaxed in parallel. If no query
    reduces the size, the next batch is tried. If query Q reduces the size, the
    next batch is started with Q relaxed and from the index of Q. If multiple
    queries reduce the size, the first one is treated as Q in the previous case.

    """

    def __init__(self, driver: OptimizerDriver):
        super().__init__(driver)
        self.batch_size = driver.proc_count
        self.description = "Parallel Local Autotuner"

    batch_size: size = 0

    def handle_batch_from_index(
        self, file_name: Path, prefix: AASequence, index: index
    ) -> AASequence:
        sizes = []
        with Pool(self.batch_size) as pool:
            sizes = pool.starmap(
                self.driver.run_assemble_and_measure_file,
                [
                    (file_name, i, prefix + [i])
                    for i in range(index, index + self.batch_size)
                ],
            )

        return sizes

    def update_iteration(
        self, file_name: Path, prefix: AASequence, index: index, current_minimum: size
    ) -> IterationUpdate:
        sizes = self.handle_batch_from_index(file_name, prefix, index)

        for i, size in enumerate(sizes):
            if size < current_minimum:
                return prefix + [index + i], index + i, size

        return prefix, index + self.batch_size, current_minimum

    def optimize(
        self, file_name: Path, num_candidates: size
    ) -> tuple[size, AASequence]:
        prefix = []
        curr_size = self.driver.run_assemble_and_measure_file(file_name, 0, [])
        curr_index = 0

        while curr_index < num_candidates:
            prefix, curr_index, curr_size = self.update_iteration(
                file_name, prefix, curr_index, curr_size
            )

        return curr_size, prefix


def parallel_local_autotuner_factory():
    return lambda driver: ParallelLocalAutotuner(driver)


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
            parallel_random_factory(100),
            parallel_local_autotuner_factory(),
        ]
    )
    driver.run()
