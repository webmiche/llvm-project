from core import AAInstrumentationDriver, register_arguments
from dataclasses import dataclass, field
import sys
from pathlib import Path
from typing import Dict, List
import random
import math
from multiprocessing import Pool


@dataclass
class UniqueHashesDriver(AAInstrumentationDriver):
    """
    This class implements the unique hashes experiment. In particular, it
    exposes a method that, given a file, the number of candidate queries, and the
    number of runs, returns the number of unique hashes that are generated
    from `num_runs` many random AA query sequences.
    """

    random_seed: int = 0

    def handle_population(
        self,
        file_name: Path,
        population: List[List[int]],
        full_population: set,
        distinct_hashes: set,
        sizes: List[int],
    ) -> None:
        """
        Given a population of random sequences, this method runs the assembly
        process for each sequence and adds the resulting hash to the set of
        distinct hashes. It also adds the sequence to the set of full population
        if it is not already present.
        """
        for i, sample in enumerate(population):
            # Check how many queries actually occur in this compilation.
            new_num_candidates = self.get_candidate_count(
                file_name, sample, name_prefix=i
            )
            actual_sample = tuple(sample[:new_num_candidates])

            # If we have already seen this sequence, then we don't need to
            # compute the hash again.
            if not actual_sample in full_population:
                curr_hash, size = self.run_assemble_and_get_hash_and_size(
                    file_name, i, sample
                )
                full_population.add(actual_sample)
                distinct_hashes.add(curr_hash)
                sizes.append(size)

    def get_num_unique_hashes(
        self,
        file_name: Path,
        num_candidates: int,
        num_runs: int,
    ) -> tuple[int, List[int]]:
        random.seed(self.random_seed)
        full_population = set()
        distinct_hashes = set()
        sizes = []
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

            self.handle_population(
                file_name, population, full_population, distinct_hashes, sizes
            )

            if num_candidates < 20 and math.pow(2, num_candidates) <= len(
                full_population
            ):
                # There are at most 2^num_candidates possible sequences so once
                # we have generated that many, we can stop. The limit of 20 is
                # to not have a Python crash due to the math.pow function. Here,
                # we are assuming that we never call this function with more
                # than 2^20 num_runs, which I think is a reasonable assumption.
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

        return len(distinct_hashes), sizes


@dataclass
class ParallelUniqueHashesDriver(UniqueHashesDriver):
    """
    This class implements the unique hashes experiment. In particular, it
    exposes a method that, given a file, the number of candidate queries, and the
    number of runs, returns the number of unique hashes that are generated
    from `num_runs` many random AA query sequences.

    This class is a parallel version of the UniqueHashesDriver. In particular,
    it uses a parallel version of the `handle_population` method.
    """

    random_seed: int = 0

    def truncate_sequence(
        self, file_name: Path, sample: List[int], name_prefix: int
    ) -> tuple[int, ...]:
        """
        Given a sequence of AA queries, this method returns the number of
        queries that actually occur in the compilation. This is useful to
        truncate the sequence to avoid running unnecessary queries.
        """
        count = self.get_candidate_count(file_name, sample, name_prefix=name_prefix)
        return tuple(sample[:count])

    def handle_population(
        self,
        file_name: Path,
        population: List[List[int]],
        full_population: set,
        distinct_hashes: set,
        sizes: List[int],
    ) -> None:
        """
        Given a population of random sequences, this method runs the assembly
        process for each sequence and adds the resulting hash to the set of
        distinct hashes. It also adds the sequence to the set of full population
        if it is not already present.
        """

        # truncate the sequences
        with Pool(self.proc_count) as pool:
            sequences = pool.starmap(
                self.truncate_sequence,
                [(file_name, sample, i) for i, sample in enumerate(population)],
            )

        # remove duplicates
        sequences = list(set(sequences))

        # remove the sequences that we have already seen
        new_sequences = [seq for seq in sequences if not seq in full_population]

        # run the assembly process for the new sequences
        with Pool(self.proc_count) as pool:
            hashes_and_sizes = pool.starmap(
                self.run_assemble_and_get_hash_and_size,
                [(file_name, i, sample) for i, sample in enumerate(new_sequences)],
            )

        # extract the hashes and sizes
        hashes = [hash_ for hash_, _ in hashes_and_sizes]
        curr_sizes = [size for _, size in hashes_and_sizes]

        # add the new sequences to the full population
        full_population.update(new_sequences)

        # add the new hashes to the set of distinct hashes
        distinct_hashes.update(hashes)

        sizes.extend(curr_sizes)


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

    driver = ParallelUniqueHashesDriver(
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
        unique_hashes, sizes = driver.get_num_unique_hashes(file, num_candidates, 100)
        print(f"Unique hashes: {unique_hashes} of 100 runs")
        print(f"Sizes: {sizes}")
