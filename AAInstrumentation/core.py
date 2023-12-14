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
        opt_flag: The optimization level to be used on all compilations.
    """

    instr_path: Path
    exec_root: Path
    specbuild_dir: Path
    benchmark: Path
    initial_dir: Path
    opt_flag: str

    def generate_baseline(self):
        run(
            [
                "./spec",
                "build",
                str(self.initial_dir),
                str(self.benchmark),
                str(self.instr_path.joinpath("clang")),
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


if __name__ == "__main__":
    arg_parser = argparse.ArgumentParser()

    arg_parser.add_argument(
        "--instr_path",
        type=str,
        nargs="?",
        help="path to instrumentation directory with llc, clang and opt",
    )

    arg_parser.add_argument(
        "--exec_root",
        type=str,
        nargs="?",
        help="root for execution",
    )

    arg_parser.add_argument(
        "--specbuild_dir",
        type=str,
        nargs="?",
        help="path to specbuilder",
    )

    arg_parser.add_argument(
        "--benchmark",
        type=str,
        nargs="?",
        help="benchmark to run",
        default="605",
    )

    with open("AAInstrumentation/config.txt", "r") as config_file:
        args = arg_parser.parse_args(config_file.read().splitlines() + sys.argv[1:])
    instr_path = Path(args.instr_path)
    exec_root = Path(args.exec_root)
    specbuild_dir = Path(args.specbuild_dir)
    benchmark = Path(args.benchmark)
    initial_dir = Path("naive_start/")

    AAInstrumentationDriver(
        instr_path,
        exec_root,
        specbuild_dir,
        benchmark,
        initial_dir,
        "Oz",
    ).generate_baseline()
