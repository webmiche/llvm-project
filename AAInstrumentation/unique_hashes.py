from core import AAInstrumentationDriver, register_arguments
from dataclasses import dataclass, field
import sys
from pathlib import Path
from typing import Dict, List
import random


@dataclass
class UniqueHashesDriver(AAInstrumentationDriver):
    """
    This class implements the unique hashes experiment. In particular, it
    exposes a method that, given a file, the number of candidate queries, and the
    number of runs, returns the number of unique hashes that are generated
    from `num_runs` many random AA query sequences.
    """

    random_seed: int = 0

    def get_num_unique_hashes(
        self,
        file_name: Path,
        num_candidates: int,
        num_runs: int,
    ) -> int:
        random.seed(self.random_seed)
        population = self.get_n_random_sequences(num_candidates, num_runs)
        distinct_hashes = set()

        for i, sample in enumerate(population):
            curr_hash = self.run_assemble_and_get_hash(file_name, i, sample)
            distinct_hashes.add(curr_hash)

        return len(distinct_hashes)


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

    driver = UniqueHashesDriver(
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
    driver.generate_baseline()

    files = driver.get_baseline_files()

    candidates_per_file = driver.get_candidates_per_file(files)
    for file, num_candidates in candidates_per_file.items():
        print(f"{file}: {num_candidates}")
        unique_hashes = driver.get_num_unique_hashes(file, num_candidates, 100)
        print(f"Unique hashes: {unique_hashes} of 100 runs")
