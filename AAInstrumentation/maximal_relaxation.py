from core import AAInstrumentationDriver, register_arguments, AASequence, index
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
class MaximalRelaxationDriver(AAInstrumentationDriver):
    original_hash: str = ""
    instrument_aa_recursively: bool = False

    @abstractmethod
    def relax(
        self,
        file_name: Path,
        prefix,
        total_lower_bound,
        total_upper_bound,
    ):
        """Relaxes the queries from [lower_bound, upper_bound), with the prefix."""
        raise NotImplementedError

    def get_groundtruth_hash(self, file_name: Path):
        """Returns the hash of the groundtruth file."""
        self.run_and_assemble_file(file_name, 0, [], self.instrument_aa_recursively)

        return self.get_hash(
            self.instr_dir.joinpath(
                file_name.parent, str(0) + str(file_name.stem) + ".o"
            )
        )

    def relax_one_index(
        self,
        prefix: AASequence,
        file_name: Path,
        lower_bound: index,
        i: index,
    ):
        """Runs the instrumentation with the queries in prefix relaxed as
        well as the queries from lower_bound to i."""

        self.run_and_assemble_file(
            file_name,
            i,
            prefix + list(range(lower_bound, i)),
            self.instrument_aa_recursively,
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

        count_per_file = self.get_candidates_per_file(
            files, self.instrument_aa_recursively
        )
        self.setup_directories(required_empty_paths)

        for file_name in files:
            print("==== Next file: " + str(file_name))
            self.maximal_relaxation_single_file(count_per_file[file_name], file_name)

    def maximal_relaxation_single_file(
        self,
        candidate_count,
        file_name: Path,
    ):
        """Returns the maximum number of queries that can be relaxed without
        impact on the result.

        Args:
            candidate_count: The number of candidates to consider.
            file_name: The name of the file to run the algorithm on.
        """
        print("Number of candidates: " + str(candidate_count))

        self.original_hash = self.get_groundtruth_hash(file_name)

        prefix = []
        lower_bound = 0
        upper_bound = candidate_count

        while True:
            # Try to relax as many queries as possible
            prefix = self.relax(
                file_name,
                prefix,
                lower_bound,
                upper_bound,
            )

            # how many queries are actually occuring now
            new_count = self.get_candidate_count(
                file_name,
                prefix,
                self.instrument_aa_recursively,
            )

            print("New count: " + str(new_count))

            if new_count < upper_bound:
                # if there are fewer queries than before, (sanity) check that
                # all indices that do not correspond to queries are in the prefix
                for i in range(new_count, upper_bound):
                    assert i in prefix

                # If so, remove them from the prefix
                prefix = [i for i in prefix if i < new_count]
                print("New prefix: " + str(prefix))
                upper_bound = new_count
                break

            if new_count == upper_bound:
                # If there are equally many queries, we are done
                break

            print("New prefix: " + str(prefix))

            # If there are more queries, we try to relax the new ones
            lower_bound = len(prefix)
            upper_bound = new_count

        print("Final list: " + str(prefix))
        print("with size: " + str(len(prefix)) + " of " + str(upper_bound))


class SequentialMaximalRelaxationDriver(MaximalRelaxationDriver):
    def relax(
        self,
        file_name: Path,
        prefix,
        total_lower_bound,
        total_upper_bound,
    ) -> AASequence:
        """
        This function works batch-wise. It starts with a batch with size
        proc_count and checks if all of the queries can be relaxed. If so, it
        repeats with the next batch. If query i could not be relaxed, it leaves
        query i precise and repeats with a batch starting at i+1. If multiple
        queries could not be relaxed, it treats the smallest index as i in the
        single query case.
        """

        os.makedirs(str((self.instr_dir / file_name).parent), exist_ok=True)

        self.original_hash = self.get_groundtruth_hash(file_name)

        lower_bound = 0

        while True:
            upper_bound = min(total_upper_bound, lower_bound + self.proc_count)
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

        return prefix


class LogMaximalRelaxationDriver(MaximalRelaxationDriver):
    def relax(
        self,
        file_name: Path,
        prefix,
        total_lower_bound,
        total_upper_bound,
    ) -> AASequence:
        return self.rec_relax(file_name, prefix, total_lower_bound, total_upper_bound)

    def rec_relax(
        self,
        file_name,
        prefix,
        lower_bound,
        upper_bound,
    ) -> AASequence:
        """Recursivle relaxes the queries from [lower_bound, upper_bound), with
        the prefix."""
        if prefix:
            assert prefix[-1] < lower_bound
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
    instr_path = args.instr_path
    exec_root = args.exec_root
    specbuild_dir = args.specbuild_dir
    benchmark = args.benchmark
    initial_dir = args.initial_dir
    instr_dir = args.instr_dir
    groundtruth_dir = args.groundtruth_dir

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
        args.proc_count,
        "",
        args.instrument_recursively,
    )
    driver.maximal_relaxation()
