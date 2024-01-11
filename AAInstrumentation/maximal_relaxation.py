from core import AAInstrumentationDriver, register_arguments
from multiprocessing import Pool
import os
from pathlib import Path
import subprocess
import hashlib
import argparse
import sys


class MaximalRelaxationDriver(AAInstrumentationDriver):
    def maximal_relaxation_single_file(
        self,
        candidate_count,
        file_name: Path,
    ):
        """Returns the maximum number of queries that can be relaxed without
        impact on the result.

        In particular, this function works batch-wise. It starts with a batch
        with size proc_count and checks if all of the queries can be relaxed. If
        so, it increases the batch size by proc_count and repeats. If query i
        could not be relaxed, it leaves query i precise and repeats with a batch
        starting at i+1. If multiple queries could not be relaxed, it treats
        the smallest index as i in the single query case.

        Args:
            candidate_count: The number of candidates to consider. file_name:
            The name of the file to run the algorithm on.
        """
        os.makedirs(str((self.instr_dir / file_name).parent), exist_ok=True)
        print("Number of candidates: " + str(candidate_count))

        self.run_step_single_func(
            file_name,
            0,
            [],
        )
        self.assemble_file(
            self.instr_dir.joinpath(
                file_name.parent, str(0) + str(file_name.stem) + ".bc"
            ),
            self.instr_dir.joinpath(
                file_name.parent, str(0) + str(file_name.stem) + ".o"
            ),
        )

        original_hash = self.get_hash(
            self.instr_dir.joinpath(
                file_name.parent, str(0) + str(file_name.stem) + ".o"
            )
        )

        lower_bound = 0
        upper_bound = candidate_count
        curr_fixed = 0
        curr_list = []

        while True:
            hashes = [0] * self.proc_count
            lower_bound = curr_fixed
            upper_bound = min(candidate_count, curr_fixed + self.proc_count)
            # print("==== Next range: " + str(lower_bound) + " - " + str(upper_bound))
            # print("==== Current list: " + str(curr_list))
            if lower_bound == upper_bound:
                break

            with Pool(self.proc_count) as p:
                p.starmap(
                    self.run_step_single_func,
                    [
                        (
                            file_name,
                            i,
                            curr_list + list(range(lower_bound, i + 1)),
                        )
                        for i in range(lower_bound, upper_bound)
                    ],
                )

            with Pool(self.proc_count) as p:
                p.starmap(
                    self.assemble_file,
                    [
                        (
                            self.instr_dir.joinpath(
                                file_name.parent, str(i) + str(file_name.stem) + ".bc"
                            ),
                            self.instr_dir.joinpath(
                                file_name.parent, str(i) + str(file_name.stem) + ".o"
                            ),
                        )
                        for i in range(lower_bound, upper_bound)
                    ],
                )

            for i in range(lower_bound, upper_bound):
                curr_hash = self.get_hash(
                    self.instr_dir.joinpath(
                        file_name.parent, str(i) + str(file_name.stem) + ".o"
                    )
                )
                # print(
                #    "Hash: "
                #    + str(curr_hash)
                #    + " for "
                #    + str(i)
                #    + " vs "
                #    + str(original_hash)
                # )
                if curr_hash != original_hash:
                    # print("Change detected at " + str(i))
                    curr_fixed = i + 1
                    break

                curr_list.append(i)
                curr_fixed = i + 1

        print("Final list: " + str(curr_list))
        print("with size: " + str(len(curr_list)) + " of " + str(candidate_count))

    def maximal_relaxation(
        self,
    ):
        self.generate_baseline()

        files = self.get_baseline_files()

        # compile baseline
        with Pool(self.proc_count) as p:
            p.map(self.compile_baseline_file, files)

        required_empty_paths = [
            self.instr_dir,
            Path("res/"),
            Path("alias_queries/"),
            Path("final_res/"),
            Path("composed_files/"),
        ]

        count_per_file = self.get_candidates_per_file(files)

        for file_name in files:
            print("==== Next file: " + str(file_name))
            self.setup_directories(required_empty_paths)

            self.maximal_relaxation_single_file(count_per_file[file_name], file_name)


if __name__ == "__main__":
    arg_parser = register_arguments()

    with open("AAInstrumentation/config.txt", "r") as config_file:
        args = arg_parser.parse_args(config_file.read().splitlines() + sys.argv[1:])
    instr_path = Path(args.instr_path)
    exec_root = Path(args.exec_root)
    specbuild_dir = Path(args.specbuild_dir)
    benchmark = Path(args.benchmark)
    initial_dir = Path("naive_start/")
    instr_dir = Path("aafiles/")
    groundtruth_dir = Path("groundtruth/")

    driver = MaximalRelaxationDriver(
        instr_path,
        exec_root,
        specbuild_dir,
        benchmark,
        initial_dir,
        instr_dir,
        groundtruth_dir,
        "Oz",
        8,
    )
    driver.maximal_relaxation()
