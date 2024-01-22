from core import AAInstrumentationDriver, register_arguments
from dataclasses import dataclass, field
import sys
from pathlib import Path
from typing import Dict, List
import random
import math


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
        full_population = set()
        distinct_hashes = set()
        last_len = -1

        while len(full_population) < num_runs:
            # It can be the case that some of the random sequences we generate
            # are actually the same since changing AA queries can lead to fewer
            # queries being present. Therefore, we loop here until we have enough
            # sequences that are actually unique runs.

            # We always at least generate 20 new sequences. This tries to make
            # sure that we give the experiment a chance to generate new sequences
            # if we are close to the end.
            population = self.get_n_random_sequences(
                num_candidates, max(num_runs - len(full_population), 20)
            )

            for i, sample in enumerate(population):
                curr_hash = self.run_assemble_and_get_hash(file_name, i, sample)
                new_num_candidates = self.get_candidate_count(file_name, sample)
                full_population.add(sample)
                distinct_hashes.add(curr_hash)

            if num_candidates < 20 and math.pow(2, num_candidates) <= len(
                full_population
            ):
                # We have generated all possible sequences, so we can stop.
                break

            if len(full_population) == last_len:
                # We are not generating any new sequences, so we should stop.
                print(
                    f"Warning: only {len(full_population)} unique sequences generated"
                    f" out of {num_runs} attempts and no new sequences are being"
                    f" generated."
                )
                break
            if len(full_population) < num_runs:
                print(
                    f"Warning: only {len(full_population)} unique sequences generated"
                    f" out of {num_runs} attempts. Trying again."
                )

            last_len = len(full_population)

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
