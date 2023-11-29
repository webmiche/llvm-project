from __future__ import annotations
from subprocess import Popen, PIPE, run, DEVNULL
import os
from itertools import combinations
import shutil
import argparse
from pathlib import Path, PosixPath
from dataclasses import dataclass
from multiprocessing import Pool
import sys
import time
import math
import random
import numpy

# from specbuilder --> spec.py
linked_libraries = {
    "600": ["m"],
    "602": ["-Wl,--allow-multiple-definition"],
    "619": ["m"],
    "625": ["m"],
    "638": ["m"],
    "644": ["m"],
}


def print_results_inner_dict(results):
    size_string = ""
    seq_string = ""
    for key, func_tuple in results.items():
        size_string += str(key) + ": " + str(func_tuple[1]) + ", "
        seq_string += str(key) + ": " + str(func_tuple[0]) + ", "
    print(size_string)
    print(seq_string)


def print_results_dict(results):
    size_string = ""
    seq_string = ""
    for key, file_dict in results.items():
        size_string += str(key) + "{ "
        seq_string += str(key) + "{ "
        for key in file_dict.keys():
            size_string += str(key) + ": " + str(file_dict[key][1]) + ", "
            seq_string += str(key) + ": " + str(file_dict[key][0]) + ", "
        size_string += "} "
        seq_string += "} "
    print(size_string)
    print(seq_string)


def min_inner_dict_list(dicts) -> dict:
    while len(dicts) > 1:
        dicts = [min_inner_dict(dicts[0], dicts[1])] + dicts[2:]

    return dicts[0]


def min_inner_dict(dict_1, dict_2) -> dict:
    new_results = {}
    for func_name, func_tuple in dict_1.items():
        assert func_name in dict_2.keys()
        func_tuple_2 = dict_2[func_name]

        if func_tuple[1] < func_tuple_2[1]:
            new_results[func_name] = func_tuple
        elif func_tuple[1] == func_tuple_2[1]:
            if len(func_tuple[0]) < len(func_tuple_2[0]):
                new_results[func_name] = func_tuple
            else:
                new_results[func_name] = func_tuple_2
        else:
            new_results[func_name] = func_tuple_2

    return new_results


def min_dict_list(dicts) -> dict:
    while len(dicts) > 1:
        dicts = [min_dict(dicts[0], dicts[1])] + dicts[2:]

    return dicts[0]


def min_dict(dict_1, dict_2) -> dict:
    new_results = {}
    for file_name, file_dict in dict_1.items():
        assert file_name in dict_2.keys()
        file_dict_2 = dict_2[file_name]
        new_results[file_name] = {}
        for func_name, func_tuple in file_dict.items():
            assert func_name in file_dict_2.keys()
            func_tuple_2 = file_dict_2[func_name]

            if func_tuple[1] < func_tuple_2[1]:
                new_results[file_name][func_name] = func_tuple
            elif func_tuple[1] == func_tuple_2[1]:
                if len(func_tuple[0]) < len(func_tuple_2[0]):
                    new_results[file_name][func_name] = func_tuple
                else:
                    new_results[file_name][func_name] = func_tuple_2
            else:
                new_results[file_name][func_name] = func_tuple_2

    return new_results


@dataclass
class InstrumentAlias:
    instr_path: Path
    exec_root: Path
    specbuild_dir: Path
    benchmark: Path
    initial_dir: Path
    groundtruth_dir: Path
    default_may_truth: Path
    instr_dir: Path
    start_time: float
    function_encoding: dict[str, str]
    opt_flag: str
    func_count: int = 0

    file_name: str = ""
    function: str = ""

    num_compilations = 0
    proc_count = 16
    distinct_hashes = {}

    def measure_outputsize(self, file: Path) -> int:
        cmd = [str(self.instr_path.joinpath("llvm-size")), str(file)]
        p = run(cmd, stdout=PIPE, stderr=PIPE, text=True)
        if p.stderr != "":
            return 300000000
        second_line = p.stdout.split("\n")[1]
        line_list = second_line.split("\t")
        # The other results are more info on where size is: test, data, bss
        return int(line_list[0])

    def get_file_length(self, file_name: Path) -> int:
        """Get the length of the file."""
        if not os.path.exists(file_name):
            return 30000
        with open(file_name, "r") as f:
            return len(f.readlines())

    def assemble_file(self, file_name: Path, obj_file_name: Path):
        """Assemble the file."""

        cmd = [
            str(self.instr_path.joinpath("llc")),
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

    def run_step_single_func(
        self,
        file_name: Path,
        index: int,
        index_list: list[int],
        function_name: str,
        take_may: bool,
    ):
        """Run the step with the given file name for the given function name."""

        cmd = (
            [
                str(self.instr_path.joinpath("opt")),
                str(self.initial_dir.joinpath(file_name)),
                "--print-aa-per-func",
                "-o",
                str(
                    self.instr_dir.joinpath(
                        file_name.parent, str(index) + str(file_name.stem) + ".bc"
                    )
                ),
                "-" + self.opt_flag,
                "--aasequence="
                + str(len(index_list))
                + "-"
                + "-".join([str(i) for i in index_list]),
            ]
            + (["--take_may"] if take_may else [])
            + (["--aafunc=" + function_name] if function_name else [])
        )
        # print(" ".join(cmd))
        p = run(
            cmd,
            cwd=self.exec_root,
            stdout=PIPE,
            text=True,
        )
        return len(p.stdout.split("\n"))

    def run_step(
        self,
        file_name: Path,
        index: int,
        function_name: str,
        take_may: bool,
    ):
        """Run the step with the given file name."""

        ar_name: Path = self.instr_dir.joinpath(str(index) + ".txt")

        cmd = [
            str(self.instr_path.joinpath("opt")),
            str(self.initial_dir.joinpath(file_name)),
            "-o",
            str(
                self.instr_dir.joinpath(
                    file_name.parent, str(index) + str(file_name.stem) + ".bc"
                )
            ),
            "-" + self.opt_flag,
            "--arfile",
            str(ar_name),
        ] + (["--take_may"] if take_may else [])
        run(
            cmd,
            cwd=self.exec_root,
            stdout=DEVNULL,
        )

    def write_one_file(self, instr_dir: Path, i: int, curr_list, function_name: str):
        ar_file_name: Path = instr_dir.joinpath(str(i) + ".txt")
        string_list = [str(1), function_name, str(len(curr_list))]
        for k in curr_list:
            string_list.append(str(k))

        with open(ar_file_name, "w") as f:
            f.write("\n".join(string_list))

    def exhaustive_exploration(
        self,
        file_name: Path,
        function_name: str,
        count: int,
        take_may: bool,
        prefix_list,
        offset: int = 0,
    ):
        os.makedirs(str(self.instr_dir.joinpath(file_name).parent), exist_ok=True)
        # generate all files

        sample_list = list(range(offset + 1, count))
        list_combinations = []

        for n in range(len(sample_list) + 1):
            list_combinations += list(combinations(sample_list, n))

        self.num_compilations += len(list_combinations)

        list_combinations = [prefix_list + list(i) for i in list_combinations]

        # compile and measure
        with Pool(self.proc_count) as p:
            p.starmap(
                self.run_step_single_func,
                [
                    (file_name, i, curr_list, function_name, take_may)
                    for i, curr_list in enumerate(list_combinations)
                ],
            )

        print(
            "exhaustive search, time after compilation : "
            + str(time.time() - self.start_time)
        )

        counts = []
        lists = []
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
                    for i in range(len(list_combinations))
                ],
            )

        print(
            "exhaustive search, time after assembly : "
            + str(time.time() - self.start_time)
        )

        for i in range(len(list_combinations)):
            counts.append(
                self.measure_outputsize(
                    self.instr_dir.joinpath(
                        file_name.parent, str(i) + str(file_name.stem) + ".o"
                    )
                )
            )
            lists.append(list_combinations[i])

        print("exhaustive search candidates : " + str(list(set(counts))))
        # take best
        return lists[counts.index(min(counts))], min(counts)

    def greedy_exploration(
        self,
        file_name: Path,
        function_name: str,
        count: int,
        take_may: bool,
        take_min: bool,
        prefix_list,
        offset: int = 0,
    ):
        os.makedirs(str(self.instr_dir.joinpath(file_name).parent), exist_ok=True)
        curr_list: list = prefix_list.copy()

        # compile and count

        self.run_step_single_func(
            file_name,
            0,
            prefix_list,
            function_name,
            take_may,
        )
        min_count = self.assemble_and_measure_file(
            self.instr_dir.joinpath(
                file_name.parent, str(0) + str(file_name.stem) + ".bc"
            )
        )

        iteration_count = 0

        curr_fixed = offset + 1

        while True:
            counts = []
            lower_bound = curr_fixed
            upper_bound = min(count, curr_fixed + self.proc_count)
            if upper_bound == lower_bound:
                break
            # print(
            #    "greedy search, currently checking "
            #    + str(lower_bound)
            #    + " to "
            #    + str(upper_bound)
            #    + " out of "
            #    + str(count)
            # )

            with Pool(self.proc_count) as p:
                p.starmap(
                    self.run_step_single_func,
                    [
                        (file_name, i, curr_list + [i], function_name, take_may)
                        for i in range(lower_bound, upper_bound)
                    ],
                )

            self.num_compilations += upper_bound - lower_bound

            # print(
            #    "greedy search, time after compilation in step "
            #    + str(iteration_count)
            #    + " : "
            #    + str(time.time() - self.start_time)
            # )

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

            # print(
            #    "greedy search, time after assembly in step "
            #    + str(iteration_count)
            #    + " : "
            #    + str(time.time() - self.start_time)
            # )

            for i in range(lower_bound, upper_bound):
                counts.append(
                    self.measure_outputsize(
                        self.instr_dir.joinpath(
                            file_name.parent, str(i) + str(file_name.stem) + ".o"
                        )
                    )
                )
                os.remove(
                    self.instr_dir.joinpath(
                        file_name.parent, str(i) + str(file_name.stem) + ".bc"
                    )
                )
                os.remove(
                    self.instr_dir.joinpath(
                        file_name.parent, str(i) + str(file_name.stem) + ".o"
                    )
                )

            print("greedy search candidates: " + str(list(set(counts))))

            index_list = [(i, v) for i, v in enumerate(counts) if v < min_count]

            # No reduction occured, hence we are done
            if index_list == [] and curr_fixed + self.proc_count < count:
                curr_fixed += self.proc_count
                continue
            elif index_list == []:
                break

            if take_min:
                min_count = min(counts)
                min_index = counts.index(min_count)
                curr_list.append(lower_bound + min_index)
            else:
                min_count = index_list[0][1]
                min_index = index_list[0][0]
                curr_list.append(lower_bound + min_index)

            print("greedy search, new min: " + str(min_count))
            print("greedy search, current list: " + str(curr_list))
            # print(
            #    "greedy search, time after step "
            #    + str(iteration_count)
            #    + " : "
            #    + str(time.time() - self.start_time)
            # )
            iteration_count += 1
            curr_fixed = lower_bound + min_index + 1

        return curr_list, min_count

    def get_func_names(self, f: Path, take_may: bool, description: str) -> list[str]:
        os.makedirs(
            self.default_may_truth.joinpath(description, f).parent, exist_ok=True
        )
        os.makedirs(
            Path("alias_queries/").joinpath(description, f).parent, exist_ok=True
        )
        cmd = [
            str(self.instr_path.joinpath("opt")),
            str(self.initial_dir.joinpath(f)),
            "-o",
            str(self.default_may_truth.joinpath(description, f)),
            "--print-aa-func-names",
            "--ir-dump",
            str(Path("alias_queries/").joinpath(description, f.with_suffix(".txt"))),
            "-" + self.opt_flag,
        ] + (["--take_may"] if take_may else [])
        run(cmd, cwd=self.exec_root)

    def get_count(
        self, text_file_name: Path, compile_file_name: Path
    ) -> dict[str, int]:
        try:
            f = open(text_file_name, "r")
        except FileNotFoundError:
            return {}
        counts: dict[str, int] = {}

        for line in f.readlines():
            cmd = [
                str(self.instr_path.joinpath("opt")),
                "--disable-output",
                "--print-aa-per-func",
                "-" + self.opt_flag,
                str(self.initial_dir.joinpath(compile_file_name)),
                "--aafunc=" + line.strip(),
            ]
            p = run(cmd, stdout=PIPE, stderr=PIPE, text=True)
            counts[line.strip()] = len(p.stdout.split("\n")) - 1

        return counts

    def get_aa_count_per_file(
        self, take_may: bool, description: str, files: list[str]
    ) -> dict:
        with Pool(self.proc_count) as p:
            p.starmap(self.get_func_names, [(f, take_may, description) for f in files])

        count_per_file = {}

        for f in files:
            filename = self.exec_root.joinpath(
                Path("alias_queries/"), description, f.with_suffix(".txt")
            )
            curr_counts = self.get_count(filename, f)
            count_per_file[f] = curr_counts

        return count_per_file

    def get_aa_per_pass(self):
        self.generate_baseline()

        files = [
            Path(os.path.join(dirpath.removeprefix(str(self.initial_dir) + "/"), f))
            for (dirpath, dirnames, filenames) in os.walk(
                self.initial_dir.joinpath(self.benchmark)
            )
            for f in filenames
        ]

        aa_per_pass_per_func_per_file = {}

        for file_name in files:
            counts: dict[str, int] = {}

            aa_counts, _ = self.get_aa_count_per_pass(
                self.initial_dir.joinpath(file_name),
            )

            # filter empty dicts
            aa_counts = {k: v for k, v in aa_counts.items() if v != {}}

            # sum_per_pass = {}
            # for k, v in aa_counts.items():
            #    assert k not in sum_per_pass.keys()
            #    sum_per_pass[k] = sum(v.values())
            # aa_counts = sum_per_pass
            # aa_counts = {k: v for k, v in aa_counts.items() if v != 0}

            # print("Number of Passes: " + str(len(aa_counts.keys())))
            # print(
            #    "Of which more than 10 queries: "
            #    + str(len([k for k in aa_counts.keys() if aa_counts[k] > 10]))
            # )
            aa_per_pass_per_func_per_file[str(file_name)] = aa_counts

        return aa_per_pass_per_func_per_file

    def get_aa_count_per_pass(self, file_name) -> dict:
        cmd = [
            str(self.instr_path.joinpath("opt")),
            str(file_name),
            "--disable-output",
            "--print-aa-per-func",
            "--print-pass-names",
            "-" + self.opt_flag,
        ]
        p = run(cmd, stdout=PIPE, stderr=DEVNULL, text=True, cwd=self.exec_root)
        with open("tmp_trace15.txt", "w") as f:
            f.write(p.stdout)
        aa_count, pass_list = self.parse_trace("tmp_trace15.txt")
        return aa_count, pass_list

    def get_aa_count_per_pass_with_seq_and_func(
        self, file_name, index_list, function_name
    ) -> dict:
        cmd = [
            str(self.instr_path.joinpath("opt")),
            str(self.initial_dir.joinpath(file_name)),
            "--disable-output",
            "--print-pass-names",
            "--print-aa-per-func",
            "-" + self.opt_flag,
            "--aafunc=" + function_name,
            "--aasequence="
            + str(len(index_list))
            + "-"
            + "-".join([str(i) for i in index_list]),
        ]
        p = run(cmd, stdout=PIPE, stderr=DEVNULL, text=True, cwd=self.exec_root)
        with open("tmp_trace15.txt", "w") as f:
            f.write(p.stdout)
        aa_count, pass_list = self.parse_trace("tmp_trace15.txt")
        os.remove("tmp_trace15.txt")
        return aa_count, pass_list

    def compute_aa_trace(self, file_name, take_may=False) -> dict:
        os.makedirs(
            self.default_may_truth.joinpath(file_name).parent,
            exist_ok=True,
        )
        os.makedirs(
            Path("alias_queries/").joinpath(file_name).parent,
            exist_ok=True,
        )
        cmd = [
            str(self.instr_path.joinpath("opt")),
            str(self.initial_dir.joinpath(file_name)),
            "-o",
            str(self.default_may_truth.joinpath(file_name)),
            "--print-aa-per-func",
            "-" + self.opt_flag,
            "--print-pass-names",
        ] + (["--take_may"] if take_may else [])
        p = run(cmd, stdout=PIPE, stderr=DEVNULL, text=True, cwd=self.exec_root)
        with open(
            str(Path("alias_queries/").joinpath(file_name.with_suffix(".txt"))),
            "w",
        ) as f:
            f.write(p.stdout)

    def deterministic_exploration(
        self,
        info_per_pass_per_func,
        pass_list,
        file_name: Path,
        take_may: bool,
        exhaustive_threshhold: int = 0,
    ):
        results = {}

        functions = []
        for k, v in info_per_pass_per_func.items():
            for k2, v2 in v.items():
                if k2 not in functions:
                    functions.append(k2)

        curr_results = {}
        for function in functions:
            print("==== Next function: " + function)
            # self.function_encoding[function] = str(self.func_count)
            self.func_count += 1
            # curr_path: Path = self.instr_dir.joinpath(
            #     Path(str(self.function_encoding[function]))
            # )
            # if not os.path.exists(curr_path):
            #     os.makedirs(curr_path, exist_ok=True)

            curr_seq = []
            curr_offset = -1
            old_size = -1
            new_size = -1
            aa_count = info_per_pass_per_func
            for pass_name in pass_list:
                if pass_name.startswith("BitcodeWriterPass") or not aa_count[
                    pass_name
                ].get(function):
                    continue

                old_size = new_size
                max_query_count = curr_offset + aa_count[pass_name][function] + 1
                print(
                    "Running pass: "
                    + pass_name
                    + " with max_query_index: "
                    + str(max_query_count)
                )
                if aa_count[pass_name][function] <= exhaustive_threshhold:
                    new_seq, new_size = self.exhaustive_exploration(
                        file_name,
                        function,
                        max_query_count,
                        take_may,
                        curr_seq,
                        curr_offset,
                    )
                else:
                    new_seq, new_size = self.greedy_exploration(
                        file_name,
                        function,
                        max_query_count,
                        take_may,
                        False,
                        curr_seq,
                        curr_offset,
                    )
                print(
                    "Pass: "
                    + pass_name
                    + " generated: "
                    + str(new_seq)
                    + " with offset: "
                    + str(curr_offset)
                    + " with count: "
                    + str(new_size)
                )
                if len(new_seq) != len(curr_seq):
                    aa_count, _ = self.get_aa_count_per_pass_with_seq_and_func(
                        file_name, curr_seq, function
                    )

                new_seq = [
                    i
                    for i in new_seq
                    if i < curr_offset + aa_count[pass_name][function] + 1
                ]
                curr_seq = new_seq
                curr_offset += aa_count[pass_name][function]

            curr_results[function] = curr_seq, new_size

            # print(
            #    "Time after exploration of "
            #    + function
            #    + ": "
            #    + str(time.time() - self.start_time)
            # )

        return curr_results

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

    def compute_baseline_file(self, f: Path):
        os.makedirs(
            self.exec_root.joinpath(self.groundtruth_dir, f.parent), exist_ok=True
        )
        cmd = [
            str(self.instr_path.joinpath("opt")),
            "-" + self.opt_flag,
            "-o",
            str(self.groundtruth_dir.joinpath(f)),
            str(self.initial_dir.joinpath(f)),
        ]
        run(cmd, cwd=self.exec_root, stdout=DEVNULL)
        self.assemble_file(
            self.groundtruth_dir.joinpath(f),
            self.groundtruth_dir.joinpath(f.with_suffix(".o")),
        )

    def evaluate_results(
        self,
        results: dict,
    ):
        self.generate_composed_files(results)

        for file_name in results.keys():
            self.compile_composed(
                file_name,
                self.exec_root.joinpath(Path("res/")),
                False,
                str(
                    Path("composed_files/").joinpath(
                        str(file_name.with_suffix("")) + "_composed.txt"
                    )
                ),
            )
            size = self.assemble_and_measure_file(
                self.exec_root.joinpath(Path("res/"), file_name)
            )

            output_name = file_name.with_suffix(".o")
            true_size = self.assemble_and_measure_file(
                self.default_may_truth.joinpath(file_name)
            )
            print(str(file_name) + ": " + str(size) + " vs " + str(true_size))

    def evaluate_results_full(
        self,
        results: dict,
        files: list[Path],
    ):
        self.generate_composed_files(results)

        for file_name in [f for f in files if f not in results.keys()]:
            os.makedirs(
                Path("composed_files/").joinpath(file_name).parent, exist_ok=True
            )
            with open(
                Path("composed_files/").joinpath(
                    str(file_name.with_suffix("")) + "_composed.txt"
                ),
                "w",
            ) as f:
                f.write("0")

        for file_name in files:
            self.compile_composed(
                file_name,
                self.exec_root.joinpath(Path("res/")),
                False,
                str(
                    Path("composed_files/").joinpath(
                        str(file_name.with_suffix("")) + "_composed.txt"
                    )
                ),
            )
            self.assemble_file(
                self.exec_root.joinpath(Path("res/"), file_name),
                self.exec_root.joinpath(Path("res/"), file_name.with_suffix(".o")),
            )

        for file_name in files:
            output_name = file_name.with_suffix(".o")
            size = self.measure_outputsize(self.exec_root.joinpath("res/", output_name))
            true_size = self.assemble_and_measure_file(
                self.default_may_truth.joinpath(file_name)
            )
            if file_name in results.keys():
                print(str(file_name) + ": " + str(size) + " vs " + str(true_size))
            os.makedirs(
                self.exec_root.joinpath("final_res/", output_name.parent), exist_ok=True
            )

            cmd = [
                "cp",
                str(self.exec_root.joinpath("res/", output_name)),
                str(self.exec_root.joinpath("final_res/", output_name)),
            ]
            run(cmd, cwd=self.exec_root)

        # linking:
        cmd = (
            [
                str(self.instr_path.joinpath("clang")),
                "-no-pie",
                "-lstdc++",
                "-lm",
                "-o",
                "final_res/linked.out",
            ]
            + [
                ("-l" + link) if not link.startswith("-") else link
                for link in linked_libraries.get(str(self.benchmark), [])
            ]
            + ["final_res/" + str(f.with_suffix(".o")) for f in files]
        )
        run(cmd, cwd=self.exec_root, stdout=DEVNULL)

        # print("Time after after composition: " + str(time.time() - self.start_time))

        # measure linked file
        res_size = self.measure_outputsize(
            self.exec_root.joinpath("final_res/linked.out")
        )
        true_size = self.measure_outputsize(
            self.groundtruth_dir.joinpath(self.benchmark, str(self.benchmark))
        )

        print("result: " + str(res_size) + " vs " + str(true_size))
        print(
            "meaning a "
            + str(((true_size - res_size) / true_size) * 100)
            + "% improvement"
        )

    def setup_directories(self, required_empty_paths: list[Path]):
        dirs = [x[0] for x in os.walk(self.initial_dir)]

        for p in required_empty_paths:
            if os.path.exists(p):
                shutil.rmtree(p)
            os.mkdir(p)

        for d in dirs:
            d = d.removeprefix(str(self.initial_dir) + "/")
            os.makedirs(self.default_may_truth.joinpath(d), exist_ok=True)

    def exploration_driver(
        self,
    ):
        self.generate_baseline()

        files = [
            Path(os.path.join(dirpath.removeprefix(str(self.initial_dir) + "/"), f))
            for (dirpath, dirnames, filenames) in os.walk(
                self.initial_dir.joinpath(self.benchmark)
            )
            for f in filenames
        ]

        # compute baseline
        with Pool(self.proc_count) as p:
            p.map(self.compute_baseline_file, files)

        cmd = (
            [
                str(self.instr_path.joinpath("clang")),
                "-no-pie",
                "-lstdc++",
                "-lm",
                "-o",
                str(Path("baseline/").joinpath(self.benchmark, str(self.benchmark))),
            ]
            + [
                ("-l" + link) if not link.startswith("-") else link
                for link in linked_libraries.get(str(self.benchmark), [])
            ]
            + [str(self.groundtruth_dir.joinpath(f.with_suffix(".o"))) for f in files]
        )
        run(cmd, cwd=self.exec_root)

        # print("Time after baseline: " + str(time.time() - self.start_time))

        required_empty_paths = [
            self.instr_dir,
            Path("res/"),
            Path("alias_queries/"),
            Path("final_res/"),
            Path("composed_files/"),
        ]

        info_per_file_per_pass_per_func = {}
        count_per_file = {}
        with Pool(self.proc_count) as p:
            p.map(
                self.compute_aa_trace,
                files,
            )

        for f in files:
            aa_count, pass_list = self.parse_trace(
                str(Path("alias_queries/").joinpath(f.with_suffix(".txt")))
            )
            info_per_file_per_pass_per_func[f] = (aa_count, pass_list)

            count_func = {}
            for k, v in aa_count.items():
                for k2, v2 in v.items():
                    if k2 not in count_func.keys():
                        count_func[k2] = 0
                    count_func[k2] += v2
            count_per_file[f] = count_func

        # print("counts per function per file: " + str(count_per_file))
        results = []

        def random_search_driver(num_samples: int):
            return lambda count_per_pass_per_func, pass_list, file_name: self.random_search(
                num_samples, count_per_pass_per_func, file_name
            ), "Random " + str(
                num_samples
            )

        def precise_random_search_driver(num_samples: int):
            return (
                lambda count_per_pass_per_func, pass_list, file_name: self.random_search(
                    num_samples, count_per_pass_per_func, file_name, True
                ),
                "Random " + str(num_samples) + " (precise)",
            )

        def specific_random_search_driver(num_samples: int):
            return (
                lambda count_per_pass_per_func, pass_list, file_name: self.random_search(
                    num_samples,
                    count_per_pass_per_func,
                    file_name,
                    overall=False,
                    exact=True,
                ),
                "Random " + str(num_samples) + " (specific)",
            )

        def deterministic_exploration_driver(
            exhaustive_threshhold: int = 0,
        ):
            return (
                lambda count_per_pass_per_func, pass_list, file_name: self.deterministic_exploration(
                    count_per_pass_per_func,
                    pass_list,
                    file_name,
                    False,
                    exhaustive_threshhold,
                ),
                "Local Tuning (Exh: " + str(exhaustive_threshhold) + ")",
            )

        def imprecise_exploration_driver():
            return (
                lambda count_per_pass_per_func, pass_list, file_name: self.imprecise_search(
                    count_per_pass_per_func, file_name
                ),
                "Imprecise",
            )

        runs = [
            specific_random_search_driver(100),
        ]

        best_results = {}
        for file_name in files:
            curr_result_list = []
            for run_func, name in runs:
                print("Running " + name + " on " + str(file_name))
                self.setup_directories(required_empty_paths)
                count_per_pass_per_func, pass_list = info_per_file_per_pass_per_func[
                    file_name
                ]
                curr_results = run_func(count_per_pass_per_func, pass_list, file_name)
                eval_dict = {file_name: curr_results}
                self.evaluate_results(eval_dict)
                print("Run used " + str(self.num_compilations) + " compilations")
                self.num_compilations = 0
                num_distinct_hashes = {
                    k: len(v) for k, v in self.distinct_hashes.items()
                }
                print("Found hashes:" + str(num_distinct_hashes))
                self.distinct_hashes = {}
                # print("Time after exploration: " + str(time.time() - self.start_time))
                curr_result_list.append(curr_results)
            best_results[file_name] = min_inner_dict_list(curr_result_list)

        print("found results: ")
        print_results_dict(best_results)
        # filter empty lists
        for file_name, seq_per_func_dict in best_results.items():
            seq_per_func_dict = {
                k: v for k, v in seq_per_func_dict.items() if v[0] != []
            }
            best_results[file_name] = seq_per_func_dict

        self.evaluate_results_full(best_results, files)

        print("Total Time: " + str(time.time() - self.start_time))

        ## sanity check for correctness
        # cmd = ["./final_res/linked.out", "run/605_run/inp.in", "1>&2"]
        # p = run(" ".join(cmd), cwd=exec_root, shell=True)

        # print(p.returncode)

    def parse_trace(self, trace_file):
        curr_pass = ""
        aa_count_per_func = {}
        aa_per_pass = {}
        pass_list = []
        pass_count = {}
        # ir_per_pass = {}
        # curr_ir = ""
        with open(trace_file, "r") as f:
            for line in f.readlines():
                if line == "*** IR Dump At Start ***\n":
                    continue
                if line.startswith("*** "):
                    # if curr_ir != "":
                    #    if curr_pass == "":
                    #        curr_ir = ""
                    #    else:
                    #        ir_per_pass[
                    #            curr_pass + "_" + str(pass_count[curr_pass] - 1)
                    #        ] = curr_ir
                    #        curr_ir = ""

                    trim_line = line.removeprefix("*** IR Dump After ")
                    trim_line = trim_line.removeprefix("*** IR Pass ")
                    trim_line = trim_line.removeprefix("*** Pass: ")
                    trim_line = trim_line.removesuffix(" ***\n")
                    trim_line = trim_line.removesuffix(" omitted because no change")
                    trim_line = trim_line.removesuffix(" ignored ")
                    curr_pass = trim_line
                    curr_pass_key = curr_pass + "_" + str(pass_count.get(curr_pass, 0))
                    aa_per_pass[curr_pass_key] = aa_count_per_func
                    aa_count_per_func = {}
                    pass_count[curr_pass] = pass_count.get(curr_pass, 0) + 1
                    aa_count = 0
                    pass_list.append(curr_pass_key)
                    continue

                if line.startswith("==== "):
                    aa_func = line.split(" ")[1]
                    aa_count_per_func[aa_func] = aa_count_per_func.get(aa_func, 0) + 1
                    continue

                # curr_ir += line
        return aa_per_pass, pass_list  # , ir_per_pass

    def generate_composed_files(self, res: dict, name_suffix: str = ""):
        for file_name, indeces_per_function in res.items():
            composed_file_name = Path("composed_files/").joinpath(
                name_suffix, str(file_name.with_suffix("")) + "_composed.txt"
            )
            self.generate_composed_file(composed_file_name, indeces_per_function)

    def generate_composed_file(self, file_name: str, indeces_per_function: dict):
        os.makedirs(file_name.parent, exist_ok=True)

        num_funcs = 0
        for function, curr_indeces in indeces_per_function.items():
            if curr_indeces[0] == []:
                continue
            if curr_indeces[0] == ():
                continue
            num_funcs += 1

        str_to_write = str(num_funcs) + "\n"
        for function, curr_indeces in indeces_per_function.items():
            if curr_indeces[0] == ():
                continue
            if curr_indeces[0] == []:
                continue
            str_to_write += function + "\n"
            str_to_write += str(len(curr_indeces[0])) + "\n"
            for index in curr_indeces[0]:
                str_to_write += str(index) + "\n"

        with open(file_name, "w") as f:
            f.write(str_to_write)

    def compile_composed(
        self,
        file_name: Path,
        compose_dir: Path,
        take_may: bool,
        composed_file_name: Path,
        output_file: Path = None,
    ):
        os.makedirs(compose_dir.joinpath(file_name).parent, exist_ok=True)
        if output_file is None:
            output_file = file_name
        cmd = [
            str(self.instr_path.joinpath("opt")),
            str(self.initial_dir.joinpath(file_name)),
            "-o",
            str(compose_dir.joinpath(output_file)),
            "--arfile",
            str(composed_file_name),
            "-" + self.opt_flag,
        ] + (["--take_may"] if take_may else [])
        run(
            cmd,
            cwd=self.exec_root,
            stdout=DEVNULL,
        )

    def get_hash(self, obj_file_name: Path):
        import hashlib

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

    def maximal_relaxation_single_file(
        self,
        count_per_func,
        file_name: Path,
    ):
        os.makedirs(str(self.instr_dir.joinpath(file_name).parent), exist_ok=True)
        total_count = sum(count_per_func.values())
        print("Total count: " + str(total_count))

        self.run_step_single_func(
            file_name,
            0,
            [],
            None,
            False,
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
        upper_bound = total_count
        curr_fixed = 0
        curr_list = []

        while True:
            hashes = [0] * self.proc_count
            lower_bound = curr_fixed
            upper_bound = min(total_count, curr_fixed + self.proc_count)
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
                            None,
                            False,
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
        print("with size: " + str(len(curr_list)) + " of " + str(total_count))

    def maximal_relaxation(
        self,
    ):
        self.generate_baseline()

        files = [
            Path(os.path.join(dirpath.removeprefix(str(self.initial_dir) + "/"), f))
            for (dirpath, dirnames, filenames) in os.walk(
                self.initial_dir.joinpath(self.benchmark)
            )
            for f in filenames
        ]

        # compute baseline
        with Pool(self.proc_count) as p:
            p.map(self.compute_baseline_file, files)

        required_empty_paths = [
            self.instr_dir,
            Path("res/"),
            Path("alias_queries/"),
            Path("final_res/"),
            Path("composed_files/"),
        ]

        info_per_file_per_pass_per_func = {}
        count_per_file = {}
        with Pool(self.proc_count) as p:
            p.map(
                self.compute_aa_trace,
                files,
            )

        for f in files:
            aa_count, pass_list = self.parse_trace(
                str(Path("alias_queries/").joinpath(f.with_suffix(".txt")))
            )
            info_per_file_per_pass_per_func[f] = (aa_count, pass_list)

            count_func = {}
            for k, v in aa_count.items():
                for k2, v2 in v.items():
                    if k2 not in count_func.keys():
                        count_func[k2] = 0
                    count_func[k2] += v2
            count_per_file[f] = count_func

        for file_name in files:
            print("==== Next file: " + str(file_name))
            self.setup_directories(required_empty_paths)

            self.maximal_relaxation_single_file(count_per_file[file_name], file_name)

    def imprecise_search(
        self,
        info_per_pass_per_func,
        file_name,
    ):
        count_per_func = {}
        for k, v in info_per_pass_per_func.items():
            for k2, v2 in v.items():
                if k2 not in count_per_func.keys():
                    count_per_func[k2] = 0
                count_per_func[k2] += v2

        results = {}

        for function in count_per_func.keys():
            print("==== Next function: " + function)

            os.makedirs(str(self.instr_dir.joinpath(file_name).parent), exist_ok=True)
            aa_count = count_per_func[function]
            self.run_step_single_func(
                file_name, 0, list(range(aa_count)), function, False
            )

            size = self.assemble_and_measure_file(
                self.instr_dir.joinpath(
                    file_name.parent, str(0) + str(file_name.stem) + ".bc"
                )
            )
            print("Imprecise size: " + str(size))

            results[function] = list(range(aa_count)), size

        return results

    def map_func(self, index, index_list, population):
        ret = self.run_step_single_func(
            self.file_name, index, index_list, self.function, False
        )
        population[index] = tuple(filter(lambda x: x <= ret, index_list))

    file_name = None
    function = None

    def random_search(
        self,
        num_samples,
        info_per_pass_per_func,
        file_name,
        with_default=False,
        overall=True,
        exact=False,
    ):
        count_per_func = {}
        total_counts = 0
        for k, v in info_per_pass_per_func.items():
            for k2, v2 in v.items():
                if k2 not in count_per_func.keys():
                    count_per_func[k2] = 0
                count_per_func[k2] += v2
                total_counts += v2

        results = {}
        max_results = {}

        for function in count_per_func.keys():
            print("==== Next function: " + function)

            os.makedirs(str(self.instr_dir.joinpath(file_name).parent), exist_ok=True)

            aa_count = count_per_func[function]
            curr_num_samples = (
                max(round(num_samples * aa_count / total_counts), 1)
                if overall
                else num_samples
            )
            print("Number of AA Queries: " + str(aa_count))
            print("Number of samples: " + str(curr_num_samples))

            population = []
            if with_default:
                population.append([])

            self.file_name = file_name
            self.function = function

            last_len = -1

            while len(population) < curr_num_samples:
                # generate remaining samples
                for _ in range(curr_num_samples - len(population)):
                    curr_list = tuple(random.randint(0, 1) for _ in range(aa_count))
                    index_list = []
                    for j, val in enumerate(curr_list):
                        if val:
                            index_list.append(j)
                    population.append(tuple(index_list))

                with Pool(self.proc_count) as p:
                    p.starmap(
                        self.map_func,
                        (
                            [
                                (i, index_list, population)
                                for i, index_list in enumerate(population)
                                if i >= last_len
                            ]
                        ),
                    )

                if exact:
                    print("bef: " + str(len(population)))
                    population = list(set(population))
                    print("Uniqued: " + str(len(population)))
                    if aa_count < 20 and len(population) >= math.pow(2, aa_count):
                        print("All combinations found, stopping")
                        break

                if last_len == len(population):
                    print("No new samples generated, stopping")
                    break
                last_len = len(population)

            self.num_compilations += len(population)

            with Pool(self.proc_count) as p:
                p.starmap(
                    self.assemble_file,
                    [
                        (
                            self.instr_dir.joinpath(
                                file_name.parent,
                                str(i) + str(file_name.stem) + ".bc",
                            ),
                            self.instr_dir.joinpath(
                                file_name.parent,
                                str(i) + str(file_name.stem) + ".o",
                            ),
                        )
                        for i in range(curr_num_samples)
                    ],
                )

            counts = []
            self.distinct_hashes[function] = set()
            for i in range(curr_num_samples):
                obj_file_name = self.instr_dir.joinpath(
                    file_name.parent, str(i) + str(file_name.stem) + ".o"
                )
                count = self.measure_outputsize(obj_file_name)
                counts.append(count)
                import hashlib

                BUF_SIZE = 65536  # lets read stuff in 64kb chunks!
                sha1 = hashlib.sha1()

                with open(obj_file_name, "rb") as f:
                    while True:
                        data = f.read(BUF_SIZE)
                        if not data:
                            break
                        sha1.update(data)

                hash_value = sha1.hexdigest()
                self.distinct_hashes[function].add(hash_value)

            res_seq = population[counts.index(min(counts))]
            print("Counts: " + str(counts))

            # print("Deviation: " + str(numpy.std(counts)))
            # print("Number of distinct counts: " + str(len(list(set(counts)))))
            # print("Distinct counts: " + str(list(set(counts))))
            # print("Found sequence: " + str(res_seq))
            print("Minimum: " + str(min(counts)))
            print("Maximum: " + str(max(counts)))

            max_results[function] = population[counts.index(max(counts))], max(counts)

            results[function] = res_seq, min(counts)

        # print(
        #    "Time after exploration of "
        #    + str(file_name)
        #    + ": "
        #    + str(time.time() - self.start_time)
        # )

        # print("found results: ")
        # print_results_inner_dict(results)

        print("Running Random " + str(num_samples) + " max on " + str(file_name))
        self.evaluate_results({file_name: max_results})
        print("Running Random " + str(num_samples) + " on " + str(file_name))

        return results


@dataclass
class AAChecker:
    file_path: Path
    function_name: str
    sequence: list[int]
    size_diff: int
    try_all: bool

    aa_instr: InstrumentAlias

    def is_valid(self):
        # compile with seq and without
        if len(self.sequence) > 1 and self.try_all:
            max_index = self.sequence[-1]
            for i, comb in enumerate(
                combinations(range(max_index + 1), len(self.sequence))
            ):
                self.aa_instr.run_step_single_func(
                    self.file_path,
                    i + 1,
                    comb,
                    self.function_name,
                    False,
                )

        else:
            for i in range(self.sequence[0] if self.try_all else 1):
                self.aa_instr.run_step_single_func(
                    self.file_path,
                    i + 1,
                    [self.sequence[0] - i] + self.sequence[1:],
                    self.function_name,
                    False,
                )

        self.aa_instr.run_step_single_func(
            self.file_path,
            0,
            [],
            self.function_name,
            False,
        )

        # assemble both
        sizes = []
        if len(self.sequence) > 1 and self.try_all:
            max_index = self.sequence[-1]
            for i, comb in enumerate(
                combinations(range(max_index + 1), len(self.sequence))
            ):
                sizes.append(
                    self.aa_instr.assemble_and_measure_file(
                        self.aa_instr.instr_dir.joinpath(
                            self.file_path.parent,
                            str(i + 1) + str(self.file_path.stem) + ".bc",
                        )
                    )
                )
        else:
            for i in range(self.sequence[0] if self.try_all else 1):
                sizes.append(
                    self.aa_instr.assemble_and_measure_file(
                        self.aa_instr.instr_dir.joinpath(
                            self.file_path.parent,
                            str(i + 1) + str(self.file_path.stem) + ".bc",
                        )
                    )
                )
        initial_size = self.aa_instr.assemble_and_measure_file(
            self.aa_instr.instr_dir.joinpath(
                self.file_path.parent, str(0) + str(self.file_path.stem) + ".bc"
            )
        )

        # delete files
        if len(self.sequence) > 1 and self.try_all:
            max_index = self.sequence[-1]
            for i, comb in enumerate(
                combinations(range(max_index + 1), len(self.sequence))
            ):
                os.remove(
                    self.aa_instr.instr_dir.joinpath(
                        self.file_path.parent,
                        str(i + 1) + str(self.file_path.stem) + ".bc",
                    )
                )
                os.remove(
                    self.aa_instr.instr_dir.joinpath(
                        self.file_path.parent,
                        str(i + 1) + str(self.file_path.stem) + ".o",
                    )
                )
        else:
            for i in range(self.sequence[0] if self.try_all else 1):
                os.remove(
                    self.aa_instr.instr_dir.joinpath(
                        self.file_path.parent,
                        str(i + 1) + str(self.file_path.stem) + ".bc",
                    )
                )
                os.remove(
                    self.aa_instr.instr_dir.joinpath(
                        self.file_path.parent,
                        str(i + 1) + str(self.file_path.stem) + ".o",
                    )
                )

        os.remove(
            self.aa_instr.instr_dir.joinpath(
                self.file_path.parent, str(0) + str(self.file_path.stem) + ".bc"
            )
        )
        os.remove(
            self.aa_instr.instr_dir.joinpath(
                self.file_path.parent, str(0) + str(self.file_path.stem) + ".o"
            )
        )

        # print("sizes: " + str(sizes))
        # print(initial_size)
        # compare sizes
        return any([self.size_diff <= initial_size - size for size in sizes])


if __name__ == "__main__":
    arg_parser = argparse.ArgumentParser()

    arg_parser.add_argument(
        "--instr_path",
        type=str,
        nargs="?",
        help="path to instrumentation directory with llc, clang and opt",
        default="/home/michel/ETH/AST/llvm-project/build_instr/bin",
    )

    arg_parser.add_argument(
        "--exec_root",
        type=str,
        nargs="?",
        help="root for execution",
        default="/home/michel/ETH/AST/llvm-project/",
    )

    arg_parser.add_argument(
        "--specbuild_dir",
        type=str,
        nargs="?",
        help="path to specbuilder",
        default="/home/michel/ETH/AST/specbuilder/",
    )

    arg_parser.add_argument(
        "--benchmark",
        type=str,
        nargs="?",
        help="benchmark to run",
        default="605",
    )

    arg_parser.add_argument(
        "--file_to_check",
        type=str,
        nargs="?",
        help="check if the given file is valid",
    )

    arg_parser.add_argument(
        "--size_diff",
        type=int,
        nargs="?",
        help="size difference to check",
    )

    arg_parser.add_argument(
        "--sequence",
        type=list[int],
        nargs="?",
        help="sequence to check",
    )

    arg_parser.add_argument(
        "--func_name",
        type=str,
        nargs="?",
        help="function to check",
    )

    arg_parser.add_argument(
        "--try_all",
        type=bool,
        nargs="?",
        help="try all elements smaller than sequence",
        default=False,
    )

    arg_parser.add_argument(
        "--aa_per_pass",
        type=bool,
        nargs="?",
        help="get aa per pass",
        default=False,
    )

    arg_parser.add_argument(
        "--maximal_relaxation",
        type=bool,
        nargs="?",
        help="maximize relaxations",
        default=False,
    )

    args = arg_parser.parse_args()
    p = run(["git", "rev-parse", "HEAD"], cwd=args.exec_root, stdout=PIPE)

    initial_dir = "naive_start/"
    groundtruth_dir = "baseline/"
    default_may_truth = "naive_truth/"
    instr_dir = "aafiles/"

    if args.file_to_check:
        if AAChecker(
            Path(args.file_to_check),
            args.func_name,
            [int(i) for i in args.sequence],
            args.size_diff,
            args.try_all,
            InstrumentAlias(
                Path(args.instr_path),
                Path("./"),
                Path(args.specbuild_dir),
                Path(args.benchmark),
                Path("./"),
                Path(groundtruth_dir),
                Path(default_may_truth),
                Path("./"),
                time.time(),
                {},
                "Oz",
            ),
        ).is_valid():
            exit(0)
        exit(1)

    if args.maximal_relaxation:
        InstrumentAlias(
            Path(args.instr_path),
            Path(args.exec_root),
            Path(args.specbuild_dir),
            Path(args.benchmark),
            Path(initial_dir),
            Path(groundtruth_dir),
            Path(default_may_truth),
            Path(instr_dir),
            time.time(),
            {},
            "O3",
        ).maximal_relaxation()
        exit(0)

    benchmarks = [
        "619",
        "605",
        "631",
        "641",
        "644",
        "657",
        "625",
        "638",
        "620",
        "600",
        "623",
        "602",
    ]
    allowed_benchmarks = ["605", "619", "631", "641"]
    if args.benchmark == "all":
        for i in benchmarks:
            if args.aa_per_pass:
                print(i)
                print(
                    InstrumentAlias(
                        Path(args.instr_path),
                        Path(args.exec_root),
                        Path(args.specbuild_dir),
                        Path(i),
                        Path(initial_dir),
                        Path(groundtruth_dir),
                        Path(default_may_truth),
                        Path(instr_dir),
                        time.time(),
                        {},
                        "O3",
                    ).get_aa_per_pass()
                )
                continue
            sys.stdout = open("gen_res_" + i + "_first_strat.txt", "w")
            print("=============== running benchmark " + i + " ===============")
            print(p.stdout.decode("utf-8"))
            args.benchmark = i
            try:
                InstrumentAlias(
                    Path(args.instr_path),
                    Path(args.exec_root),
                    Path(args.specbuild_dir),
                    Path(args.benchmark),
                    Path(initial_dir),
                    Path(groundtruth_dir),
                    Path(default_may_truth),
                    Path(instr_dir),
                    time.time(),
                    {},
                    "Oz",
                ).exploration_driver()
            except Exception as e:
                print(e)
                continue
    else:
        if args.aa_per_pass:
            print(
                InstrumentAlias(
                    Path(args.instr_path),
                    Path(args.exec_root),
                    Path(args.specbuild_dir),
                    Path(args.benchmark),
                    Path(initial_dir),
                    Path(groundtruth_dir),
                    Path(default_may_truth),
                    Path(instr_dir),
                    time.time(),
                    {},
                    "Oz",
                ).get_aa_per_pass()
            )
        else:
            InstrumentAlias(
                Path(args.instr_path),
                Path(args.exec_root),
                Path(args.specbuild_dir),
                Path(args.benchmark),
                Path(initial_dir),
                Path(groundtruth_dir),
                Path(default_may_truth),
                Path(instr_dir),
                time.time(),
                {},
                "Oz",
            ).exploration_driver()
