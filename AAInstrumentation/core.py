"""
    This file contains the core functionality of the AAInstrumentation tool.
    Specific kinds of instrumentation will inherit from AAInstrumentationDriver
    and implement their specific functionality.
"""


from __future__ import annotations
from subprocess import Popen, PIPE, run, DEVNULL
import os
import argparse
from pathlib import Path, PosixPath
from dataclasses import dataclass
import sys
import shutil
import hashlib
import random


def register_arguments():
    """Register the arguments for the instrumentation."""
    arg_parser = argparse.ArgumentParser()
    arg_parser.add_argument(
        "--instr_path",
        type=Path,
        nargs="?",
        help="path to instrumentation directory with llc, clang and opt",
    )
    arg_parser.add_argument(
        "--exec_root",
        type=Path,
        nargs="?",
        help="root for execution",
    )
    arg_parser.add_argument(
        "--specbuild_dir",
        type=Path,
        nargs="?",
        help="path to specbuilder",
    )
    arg_parser.add_argument(
        "--benchmark",
        type=Path,
        nargs="?",
        help="benchmark to run",
        default="605",
    )
    arg_parser.add_argument(
        "--instrument_recursively",
        action="store_true",
        help="instrument all AA queries recursively",
    )
    arg_parser.add_argument(
        "--proc_count",
        type=int,
        nargs="?",
        help="number of processes to use",
        default=8,
    )
    arg_parser.add_argument(
        "--initial_dir",
        type=Path,
        nargs="?",
        help="directory with initial .bc files",
    )
    arg_parser.add_argument(
        "--instr_dir",
        type=Path,
        nargs="?",
        help="directory with instrumented .bc files",
    )
    arg_parser.add_argument(
        "--groundtruth_dir",
        type=Path,
        nargs="?",
        help="directory with groundtruth .bc files",
    )
    return arg_parser


@dataclass
class AAInstrumentationDriver:
    """This class is the base class for all instrumentation drivers. It
    contains the common functionality, like generating the baseline,
    evaluating results, run a single instrumented compilation, etc. In
    particular, this contains class variables for all the paths that have to
    be specified to run the instrumentation on different machines and
    benchmarks.

    Attributes:
        instr_path: The path to the instrumented opt, clang, and llc binaries.
        exec_root: The directory where the instrumentation will be run.
        specbuild_dir: The path to the specbuilder.
        benchmark: The spec benchmark that is currently being instrumented.
        initial_dir: The directory where the initial .bc files are located.
        instr_dir: The directory where all intermediate .bc files will be
            stored.
        groundtruth_dir: The directory where the groundtruth .bc files will be
            stored.
        opt_flag: The optimization level to be used on all compilations.
        proc_count: The number of processes available.
    """

    instr_path: Path
    exec_root: Path
    specbuild_dir: Path
    benchmark: Path
    initial_dir: Path
    instr_dir: Path
    groundtruth_dir: Path
    opt_flag: str
    proc_count: int

    def generate_baseline(self):
        run(
            [
                "./spec",
                "build",
                str(self.initial_dir),
                str(self.benchmark),
                str(self.instr_path / "clang"),
                "-bc",
                "--opt_level",
                self.opt_flag,
            ],
            cwd=self.specbuild_dir,
            stdout=DEVNULL,
            stderr=DEVNULL,
        )
        run(
            [
                "cp",
                "-r",
                str(self.initial_dir),
                str(self.exec_root),
            ],
            cwd=self.specbuild_dir,
            stdout=DEVNULL,
            stderr=DEVNULL,
        )

    def get_baseline_files(self) -> list[str]:
        """Get the baseline files."""

        files = [
            file.relative_to(self.initial_dir)
            for file in (self.initial_dir / self.benchmark).rglob("*.bc")
        ]

        return files

    def compile_baseline_file(self, f: Path):
        (self.exec_root / self.groundtruth_dir / f.parent).mkdir(exist_ok=True)
        cmd = [
            str(self.instr_path / "opt"),
            "-" + self.opt_flag,
            "-o",
            str(self.groundtruth_dir / f),
            str(self.initial_dir / f),
        ]
        run(cmd, cwd=self.exec_root, stdout=DEVNULL)
        self.assemble_file(
            self.groundtruth_dir / f,
            self.groundtruth_dir / f.with_suffix(".o"),
        )

    def setup_directories(self, required_empty_paths: list[Path]):
        """Setup the directories for the instrumentation. " """
        for p in required_empty_paths:
            if os.path.exists(p):
                shutil.rmtree(p)
            os.mkdir(p)

    def get_hash(self, obj_file_name: Path):
        BUF_SIZE = 65536  # lets read stuff in 64kb chunks!
        sha1 = hashlib.sha1()

        with open(obj_file_name, "rb") as f:
            while True:
                data = f.read(BUF_SIZE)
                if not data:
                    break
                sha1.update(data)

        hash_value = sha1.hexdigest()
        return hash_value

    def run_assemble_and_get_hash(
        self,
        file_name: Path,
        name_prefix: int,
        index_list: list[int],
    ):
        self.run_and_assemble_file(file_name, name_prefix, index_list)

        return self.get_hash(
            self.instr_dir
            / file_name.parent
            / Path(str(name_prefix) + str(file_name.stem) + ".o")
        )

    def measure_outputsize(self, file: Path) -> int:
        cmd = [str(self.instr_path / "llvm-size"), str(file)]
        p = run(cmd, stdout=PIPE, stderr=PIPE, text=True)
        if p.stderr != "":
            raise Exception("Error in measuring output size for " + str(file))
        second_line = p.stdout.split("\n")[1]
        line_list = second_line.split("\t")
        # The other results are more info on where size is: text, data, bss
        return int(line_list[0])

    def assemble_file(self, file_name: Path, obj_file_name: Path = None):
        """Assemble the file."""

        if obj_file_name is None:
            obj_file_name = file_name.with_suffix(".o")
        cmd = [
            str(self.instr_path / "llc"),
            "-O2",
            str(file_name),
            "-o",
            str(obj_file_name),
            "-filetype=obj",
        ]
        run(
            cmd,
        )

    def assemble_and_measure_file(self, file_name: Path) -> int:
        """Measure a given file by compiling to an object file."""

        obj_file_name = file_name.with_suffix(".o")
        self.assemble_file(file_name, obj_file_name)

        return self.measure_outputsize(obj_file_name)

    def run_and_assemble_file(
        self,
        file_name: Path,
        name_prefix: int,
        index_list: list[int],
        instrument_recursively=False,
    ):
        """Run a single function and assemble the result."""
        self.run_step_single_func(
            file_name, name_prefix, index_list, instrument_recursively
        )
        self.assemble_file(
            self.instr_dir
            / file_name.parent
            / Path(str(name_prefix) + str(file_name.stem) + ".bc")
        )

    def run_assemble_and_measure_file(
        self,
        file_name: Path,
        name_prefix: int,
        index_list: list[int],
        instrument_recursively=False,
    ) -> int:
        """Run a round of instrumentation, assemble the result, and measure the
        output size."""
        self.run_and_assemble_file(
            file_name, name_prefix, index_list, instrument_recursively
        )
        return self.measure_outputsize(
            self.instr_dir
            / file_name.parent
            / Path(str(name_prefix) + str(file_name.stem) + ".o")
        )

    def get_aa_string_from_indices(self, index_list: list[int]) -> str:
        return str(len(index_list)) + "-" + "-".join([str(i) for i in index_list])

    def run_step_single_func(
        self,
        file_name: Path,
        name_prefix: int,
        index_list: list[int],
        instrument_recursively=False,
    ):
        """Perform one run of the instrumentation.

        Args:
            file_name: The name of the file to be instrumented.
            name_prefix: The prefix to be used for the output file.
            index_list: The list of indices to be instrumented.
        """
        (self.instr_dir / file_name.parent).mkdir(parents=True, exist_ok=True)

        aa_sequence_string = self.get_aa_string_from_indices(index_list)

        base_cmd = [
            str(self.instr_path / "opt"),
            str(self.initial_dir / file_name),
            "-stats",
            "-o",
            str(
                self.instr_dir
                / file_name.parent
                / Path(str(name_prefix) + str(file_name.stem) + ".bc")
            ),
            "-" + self.opt_flag,
        ]
        if instrument_recursively:
            base_cmd.append("--instrument-aa-recursively")
        try:
            cmd = base_cmd + ["--aasequence=" + aa_sequence_string]
            p = run(
                cmd,
                cwd=self.exec_root,
                stdout=DEVNULL,
                stderr=DEVNULL,
                text=True,
            )
        # It can happen that the aa_sequence is too long for the command line.
        # In this case, we write the sequence to a file and pass the file name
        # to opt.
        except OSError:
            aafile_name = "aa_sequence" + str(name_prefix) + ".txt"
            with open(aafile_name, "w") as f:
                f.write(aa_sequence_string)

            cmd = base_cmd + ["--aasequencefile=" + aafile_name]
            # print(" ".join(cmd))
            p = run(
                cmd,
                cwd=self.exec_root,
                stdout=DEVNULL,
                stderr=DEVNULL,
                text=True,
            )

    def get_candidate_count(
        self, file_name: Path, prefix: list[int] = [], instrument_recursively=False
    ) -> int:
        """Get the number of candidates for a given file with a given prefix."""

        cmd = [
            str(self.instr_path / "opt"),
            str(self.initial_dir / file_name),
            "-stats",
            "-" + self.opt_flag,
            "-o",
            "/dev/null",
        ] + ["--aasequence=" + self.get_aa_string_from_indices(prefix)]
        if instrument_recursively:
            cmd.append("--instrument-aa-recursively")
        p = run(
            cmd,
            cwd=self.exec_root,
            stderr=PIPE,
            text=True,
            check=True,
        )
        for line in p.stderr.split("\n"):
            if "Number of queries that are not cached and not MayAlias" in line:
                return int(line.split()[0])
        raise Exception("Error in getting candidate count for " + str(file_name))

    def get_candidates_per_file(
        self, files: list[str], instrument_aa_recursively: bool = False
    ) -> dict:
        """Get the number of relaxation candidates per file."""

        count_per_file = {}

        for file in files:
            count_per_file[file] = self.get_candidate_count(
                Path(file), instrument_recursively=instrument_aa_recursively
            )

        return count_per_file

    def get_random_sequence(self, num_candidates: int) -> list[int]:
        """Get a random sequence of AA queries."""
        sequence = [random.randint(0, 1) for _ in range(num_candidates)]
        index_list = []
        for j, val in enumerate(sequence):
            if val:
                index_list.append(j)
        return tuple(index_list)

    def get_n_random_sequences(self, num_candidates: int, num_runs: int) -> list[tuple]:
        """Get n random sequences of AA queries."""
        population = []
        for _ in range(num_runs):
            population.append(self.get_random_sequence(num_candidates))
        return population

    def get_queries_per_pass(
        self, file_name: Path, index_list: list[int] = [], instrument_recursively=False
    ) -> dict[str, dict[str, int]]:
        """
        Given a file and a list of indices, returns a dictionary mapping passes
        to AA counts. The AA results are are themselves a dictionary mapping
        AAResults (such as MayAlias) to number of occurences.
        """
        aa_sequence_string = self.get_aa_string_from_indices(index_list)
        cmd = [
            str(self.instr_path / "opt"),
            str(self.initial_dir / file_name),
            "--aa-trace",
            "-" + self.opt_flag,
            "--print-pass-names",
            "-disable-output",
        ]
        if instrument_recursively:
            cmd.append("--instrument-aa-recursively")

        cmd += ["--aasequence=" + aa_sequence_string]
        p = run(
            cmd,
            cwd=self.exec_root,
            stdout=DEVNULL,
            stderr=PIPE,
            text=True,
        )

        return self.parse_aa_trace(p.stderr, instrument_recursively)

    def parse_aa_trace(
        self, aa_trace, instrument_recursively=False
    ) -> dict[str, dict[str, int]]:
        """
        Given an aa trace, returns a dictionary mapping passes to AA counts.
        Lines starting with *** are pass and have the form `*** Pass:
        <pass-name> ***`. Other lines are from the AA trace and have the form `{
        } {End|Start} <ptr1> <ptr2> [<AAResult>] [(off <num>)]`. The AAResult is
        there if it is the end of a query. Recursive queries have whitespace in
        front of them. The AAqueries before a pass are the queries that are run
        during it.
        """
        pass_dict = {}

        curr_dict = {"MayAlias": 0, "PartialAlias": 0, "MustAlias": 0, "NoAlias": 0}
        aa_trace_lines = aa_trace.split("\n")
        pass_counts = {}
        for i, line in enumerate(aa_trace_lines):
            if line.startswith("*** "):
                # This is a pass line
                pass_name = line.removeprefix("*** Pass: ").removesuffix(" ***")
                if any([curr_dict[key] > 0 for key in curr_dict.keys()]):
                    pass_index = pass_counts.get(pass_name, 0)
                    pass_counts[pass_name] = pass_index + 1
                    pass_dict[str(pass_index) + pass_name] = curr_dict
                curr_dict = {
                    "MayAlias": 0,
                    "PartialAlias": 0,
                    "MustAlias": 0,
                    "NoAlias": 0,
                }
            elif "End" in line and (instrument_recursively or not line.startswith(" ")):
                if not (
                    "MayAlias" in line
                    or "NoAlias" in line
                    or "MustAlias" in line
                    or "PartialAlias" in line
                ):
                    # This is a query on a pointer with a multi-line description.
                    for j, next_line in enumerate(aa_trace_lines[i + 1 :]):
                        if "LocationSize::beforeOrAfterPointer" in next_line:
                            break

                    if not (
                        "MayAlias" in aa_trace_lines[i]
                        or "NoAlias" in aa_trace_lines[i]
                        or "MustAlias" in aa_trace_lines[i]
                        or "PartialAlias" in aa_trace_lines[i]
                    ):
                        # This is a query on two pointers with a multi-line description.
                        for j, next_line in enumerate(aa_trace_lines[j + i + 1 :]):
                            if "LocationSize::beforeOrAfterPointer" in next_line:
                                break

                    i = i + j
                    line = next_line

                AAResult = line.split()[-1]
                if AAResult.endswith(")"):
                    # This is the PartialAlias with an offset case.
                    AAResult = line.split()[-3]
                curr_dict[AAResult] += 1

        return pass_dict


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

    driver = AAInstrumentationDriver(
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

    count_per_file = driver.get_candidates_per_file(files)

    for file in files:
        queries = driver.get_queries_per_pass(file, [0, 1, 2])
        relaxed_queries = driver.get_queries_per_pass(file)
        if all(
            [
                relaxed_queries[pass_name]["MayAlias"] == queries[pass_name]["MayAlias"]
                for pass_name in relaxed_queries.keys()
            ]
            + [
                relaxed_queries[pass_name]["PartialAlias"]
                == queries[pass_name]["PartialAlias"]
                for pass_name in relaxed_queries.keys()
            ]
            + [
                relaxed_queries[pass_name]["MustAlias"]
                == queries[pass_name]["MustAlias"]
                for pass_name in relaxed_queries.keys()
            ]
            + [
                relaxed_queries[pass_name]["NoAlias"] == queries[pass_name]["NoAlias"]
                for pass_name in relaxed_queries.keys()
            ]
        ):
            print(file)
            print(queries)
            print(relaxed_queries)
