from core import AAInstrumentationDriver, register_arguments
from multiprocessing import Pool
import os
from pathlib import Path
import subprocess
import hashlib
import argparse
import sys


class MaximalRelaxationDriver(AAInstrumentationDriver):
    def get_groundtruth_hash(self, file_name: Path):
        """Returns the hash of the groundtruth file."""

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

        return self.get_hash(
            self.instr_dir.joinpath(
                file_name.parent, str(0) + str(file_name.stem) + ".o"
            )
        )

    def relax_one_index(
        self,
        prefix: list[int],
        file_name: Path,
        lower_bound: int,
        i: int,
    ):
        """Runs the instrumentation with the queries in prefix relaxed as
        well as the queries from lower_bound to i."""
        self.run_step_single_func(
            file_name,
            i,
            prefix + list(range(lower_bound, i)),
        )

        self.assemble_file(
            self.instr_dir.joinpath(
                file_name.parent, str(i) + str(file_name.stem) + ".bc"
            ),
            self.instr_dir.joinpath(
                file_name.parent, str(i) + str(file_name.stem) + ".o"
            ),
        )

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


class SequentialMaximalRelaxationDriver(MaximalRelaxationDriver):
    def maximal_relaxation_single_file(
        self,
        candidate_count,
        file_name: Path,
    ):
        """Returns the maximum number of queries that can be relaxed without
        impact on the result.

        In particular, this function works batch-wise. It starts with a batch
        with size proc_count and checks if all of the queries can be relaxed. If
        so, it repeats with the next batch. If query i could not be relaxed, it
        leaves query i precise and repeats with a batch starting at i+1. If
        multiple queries could not be relaxed, it treats the smallest index as i
        in the single query case.

        Args:
            candidate_count: The number of candidates to consider.
            file_name: The name of the file to run the algorithm on.
        """
        os.makedirs(str((self.instr_dir / file_name).parent), exist_ok=True)
        print("Number of candidates: " + str(candidate_count))

        self.original_hash = self.get_groundtruth_hash(file_name)

        lower_bound = 0
        upper_bound = candidate_count
        prefix = []

        while True:
            upper_bound = min(candidate_count, lower_bound + self.proc_count)
            if lower_bound == upper_bound:
                break

            with Pool(self.proc_count) as p:
                p.starmap(
                    self.relax_one_index,
                    [
                        (
                            prefix,
                            file_name,
                            lower_bound,
                            i + 1,
                        )
                        for i in range(lower_bound, upper_bound)
                    ],
                )

            for i in range(lower_bound, upper_bound):
                curr_hash = self.get_hash(
                    self.instr_dir.joinpath(
                        file_name.parent, str(i + 1) + str(file_name.stem) + ".o"
                    )
                )
                if curr_hash != self.original_hash:
                    lower_bound = i + 1
                    break

                prefix.append(i)
                lower_bound = i + 1

        print("Final list: " + str(prefix))
        print("with size: " + str(len(prefix)) + " of " + str(candidate_count))


class LogMaximalRelaxationDriver(MaximalRelaxationDriver):
    original_hash: str

    def maximal_relaxation_single_file(
        self,
        candidate_count,
        file_name: Path,
    ):
        os.makedirs(str((self.instr_dir / file_name).parent), exist_ok=True)
        print("Number of candidates: " + str(candidate_count))

        self.original_hash = self.get_groundtruth_hash(file_name)

        prefix = self.rec_relax(
            file_name,
            [],
            0,
            candidate_count,
        )

        print("Final list: " + str(prefix))
        print("with size: " + str(len(prefix)) + " of " + str(candidate_count))

    def rec_relax(
        self,
        file_name,
        prefix,
        lower_bound,
        upper_bound,
    ) -> list[int]:
        """Recursivle relaxes the queries from [lower_bound, upper_bound), with
        the prefix."""
        if lower_bound == upper_bound:
            return prefix

        self.relax_one_index(
            prefix,
            file_name,
            lower_bound,
            upper_bound,
        )

        curr_hash = self.get_hash(
            self.instr_dir.joinpath(
                file_name.parent, str(upper_bound) + str(file_name.stem) + ".o"
            )
        )

        if curr_hash == self.original_hash:
            return prefix + list(range(lower_bound, upper_bound))

        if upper_bound - lower_bound == 1:
            return prefix

        middle = lower_bound + (upper_bound - lower_bound) // 2

        new_prefix = self.rec_relax(
            file_name,
            prefix,
            lower_bound,
            middle,
        )

        return self.rec_relax(
            file_name,
            new_prefix,
            middle,
            upper_bound,
        )


if __name__ == "__main__":
    arg_parser = register_arguments()

    arg_parser.add_argument(
        "--style",
        type=str,
        default="log",
        help="The style of maximal relaxation to use. Either log or sequential.",
    )

    with open("AAInstrumentation/config.txt", "r") as config_file:
        args = arg_parser.parse_args(config_file.read().splitlines() + sys.argv[1:])
    instr_path = Path(args.instr_path)
    exec_root = Path(args.exec_root)
    specbuild_dir = Path(args.specbuild_dir)
    benchmark = Path(args.benchmark)
    initial_dir = Path("naive_start/")
    instr_dir = Path("aafiles/")
    groundtruth_dir = Path("groundtruth/")

    maximal_relaxation_class = None
    if args.style == "log":
        maximal_relaxation_class = LogMaximalRelaxationDriver
    elif args.style == "sequential":
        maximal_relaxation_class = SequentialMaximalRelaxationDriver
    else:
        raise Exception("Unknown style: " + args.style)

    driver = maximal_relaxation_class(
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
