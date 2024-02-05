from core import AAInstrumentationDriver, register_arguments
from typing import List, Callable
from dataclasses import dataclass
from pathlib import Path
import sys
from abc import abstractmethod


@dataclass
class AAChecker(AAInstrumentationDriver):
    """
    This class implements the aa checker for reductions. In particular, this is
    the base class for all the different types of checks that we can perform.

    The main method that is exposed is the `check` method. Additionally, there is
    a `size_criteria` method that can be overridden to implement different size
    criteria for the checks.

    Class members:
    - file_name: The file to apply the sequence to
    - size_diff: The difference in size that is acceptable
    - sequence: The sequence of AA queries
    """

    file_name: Path
    size_diff: int
    sequence: List[int]

    def size_criteria(self, base_size, new_size) -> bool:
        return new_size + self.size_diff <= base_size

    @abstractmethod
    def check(self) -> bool:
        raise NotImplementedError


@dataclass
class SequenceStableCheck(AAChecker):
    """
    This class implements a reduction check with stable sequence, i.e., the
    sequence of relaxed AA queries does not change.
    """

    def check(self) -> bool:
        base_size = self.run_assemble_and_measure_file(self.file_name, 0, [])
        new_size = self.run_assemble_and_measure_file(self.file_name, 0, self.sequence)

        return self.size_criteria(base_size, new_size)


@dataclass
class SequenceStableSmallerCheck(SequenceStableCheck):
    """
    This class implements a reduction check with stable sequence, i.e., the
    sequence of relaxed AA queries does not change, but the size difference
    can be any.
    """

    def size_criteria(self, base_size, new_size) -> bool:
        return new_size < base_size


@dataclass
class FirstQueryChangeCheck(AAChecker):
    """
    This class implements a reduction check that tries all queries that are
    smaller than the first query in the sequence.
    """

    def check(self) -> bool:
        base_size = self.run_assemble_and_measure_file(self.file_name, 0, [])
        sizes = []
        for i in range(self.sequence[0] + 1):
            sizes.append(self.run_assemble_and_measure_file(self.file_name, 0, [i]))

        return any(self.size_criteria(base_size, size) for size in sizes)


@dataclass
class FirstQueryChangeSmallerCheck(FirstQueryChangeCheck, SequenceStableSmallerCheck):
    """
    This class implements a reduction check that tries all queries that are
    smaller than the first query in the sequence, and the size difference
    can be any.
    """


if __name__ == "__main__":
    arg_parser = register_arguments()

    arg_parser.add_argument(
        "--sequence",
        type=int,
        nargs="+",
        help="The sequence of AA queries to check for stability",
    )
    arg_parser.add_argument(
        "--size_diff",
        type=int,
        help="The difference in size that is acceptable",
    )
    arg_parser.add_argument(
        "--file_name",
        type=Path,
        help="The file to apply the sequence to",
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

    stable_check = FirstQueryChangeSmallerCheck(
        instr_path,
        exec_root,
        specbuild_dir,
        benchmark,
        initial_dir,
        instr_dir,
        groundtruth_dir,
        "Oz",
        args.proc_count,
        args.file_name,
        args.size_diff,
        args.sequence,
    )

    result = stable_check.check()
    if not result:
        exit(1)
