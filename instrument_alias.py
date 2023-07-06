from __future__ import annotations
from subprocess import Popen, PIPE, run, DEVNULL
import os
from itertools import combinations
import shutil
import argparse
from pathlib import Path
from dataclasses import dataclass
from multiprocessing import Pool
import sys
import time

# from specbuilder --> spec.py
linked_libraries = {
    "600": ["m"],
    "602": ["-Wl,--allow-multiple-definition"],
    "619": ["m"],
    "625": ["m"],
    "638": ["m"],
    "644": ["m"],
}


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

        run(
            [
                str(self.instr_path.joinpath("llc")),
                "-O2",
                str(file_name),
                "-o",
                str(obj_file_name),
                "-filetype=obj",
            ],
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
            "--aafunc=" + function_name,
            "--aasequence="
            + str(len(index_list))
            + "-"
            + "-".join([str(i) for i in index_list]),
        ] + (["--take_may"] if take_may else [])
        run(
            cmd,
            cwd=self.exec_root,
        )

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
    ):
        os.makedirs(str(self.instr_dir.joinpath(file_name).parent), exist_ok=True)
        # generate all files

        sample_list = list(range(count))
        list_combinations = []

        for n in range(len(sample_list) + 1):
            list_combinations += list(combinations(sample_list, n))

        # compile and measure
        with Pool() as p:
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
        with Pool() as p:
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
    ):
        os.makedirs(str(self.instr_dir.joinpath(file_name).parent), exist_ok=True)
        curr_list: list = []

        # generate empty file

        # compile and count

        self.run_step_single_func(
            file_name,
            0,
            [],
            function_name,
            take_may,
        )
        min_count = self.assemble_and_measure_file(
            self.instr_dir.joinpath(
                file_name.parent, str(0) + str(file_name.stem) + ".bc"
            )
        )

        iteration_count = 0

        proc_count = 64
        curr_fixed = 0
        while True:
            counts = []
            lower_bound = curr_fixed
            upper_bound = min(count, curr_fixed + proc_count)
            print(
                "greedy search, currently checking "
                + str(lower_bound)
                + " to "
                + str(upper_bound)
                + " out of "
                + str(count)
            )

            with Pool() as p:
                p.starmap(
                    self.run_step_single_func,
                    [
                        (file_name, i, curr_list + [i], function_name, take_may)
                        for i in range(lower_bound, upper_bound)
                    ],
                )

            print(
                "greedy search, time after compilation in step "
                + str(iteration_count)
                + " : "
                + str(time.time() - self.start_time)
            )

            with Pool() as p:
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

            print(
                "greedy search, time after assembly in step "
                + str(iteration_count)
                + " : "
                + str(time.time() - self.start_time)
            )

            for i in range(lower_bound, upper_bound):
                counts.append(
                    self.measure_outputsize(
                        self.instr_dir.joinpath(
                            file_name.parent, str(i) + str(file_name.stem) + ".o"
                        )
                    )
                )

            print("greedy search candidates: " + str(list(set(counts))))

            index_list = [(i, v) for i, v in enumerate(counts) if v < min_count]

            # No reduction occured, hence we are done
            if index_list == [] and curr_fixed + proc_count < count:
                curr_fixed += proc_count
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
            print(
                "greedy search, time after step "
                + str(iteration_count)
                + " : "
                + str(time.time() - self.start_time)
            )
            iteration_count += 1
            curr_fixed = lower_bound + min_index

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
        with Pool() as p:
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

            aa_counts = self.get_aa_count_per_pass(
                self.initial_dir.joinpath(file_name),
            )
            aa_counts = {k: v for k, v in aa_counts.items() if v != 0}

            print("Number of Passes: " + str(len(aa_counts.keys())))
            print(
                "Of which more than 10 queries: "
                + str(len([k for k in aa_counts.keys() if aa_counts[k] > 10]))
            )
            aa_per_pass_per_func_per_file[str(file_name)] = aa_counts

        return aa_per_pass_per_func_per_file

    def get_aa_count_per_pass(self, file_name) -> dict:
        cmd = [
            str(self.instr_path.joinpath("opt")),
            str(file_name),
            "--disable-output",
            "--print-aa-per-func",
            "--print-changed",
            "--print-changed-hash",
            "--print-module-scope",  # Maybe remove to only hash function?
            "-" + self.opt_flag,
            "--ir-dump=" + "tmp_trace15.txt",
        ]
        p = run(cmd, stdout=DEVNULL, stderr=DEVNULL, text=True)
        aa, _, _ = self.parse_trace("tmp_trace15.txt")
        return aa

    def exploration(
        self,
        files: list[Path],
        take_may: bool,
    ):
        description: Path = Path("may") if take_may else Path("std")
        os.mkdir(Path("alias_queries/").joinpath(description))
        os.mkdir(Path("res/").joinpath(description))

        print("Track AA Queries " + str(description))
        count_per_file = self.get_aa_count_per_file(take_may, description, files)

        print("counts per function per file: " + str(count_per_file))
        print("Time after AA Query measurement: " + str(time.time() - self.start_time))

        results = {}

        print("Start Exploration")
        for file_name in count_per_file.keys():
            print("***** Next file: " + str(file_name))
            curr_results = {}
            for function in count_per_file[file_name].keys():
                print("==== Next function: " + function)
                self.function_encoding[function] = str(self.func_count)
                self.func_count += 1
                curr_path: Path = self.instr_dir.joinpath(
                    Path(str(self.function_encoding[function]))
                )
                if not os.path.exists(curr_path):
                    os.makedirs(curr_path, exist_ok=True)
                count = count_per_file[file_name][function]
                if count < 0:
                    curr_results[function] = self.exhaustive_exploration(
                        file_name,
                        function,
                        count,
                        take_may,
                    )
                else:
                    curr_results[function] = self.greedy_exploration(
                        file_name,
                        function,
                        count,
                        take_may,
                        False,  # take_min
                    )
                print(
                    "Time after exploration of "
                    + function
                    + ": "
                    + str(time.time() - self.start_time)
                )

            results[file_name] = curr_results
            print(
                "Time after exploration of "
                + str(file_name)
                + ": "
                + str(time.time() - self.start_time)
            )

        print("found results: " + str(results))
        print("time after exploration: " + str(time.time() - self.start_time))

        self.generate_composed_files(results)

        for file_name in files:
            self.compile_composed(
                file_name,
                self.exec_root.joinpath(Path("res/"), description),
                take_may,
            )
            self.assemble_and_measure_file(
                self.exec_root.joinpath(Path("res/"), description, file_name)
            )

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
        for f in files:
            os.makedirs(
                self.exec_root.joinpath(groundtruth_dir, f.parent), exist_ok=True
            )
            cmd = [
                str(self.instr_path.joinpath("opt")),
                "-" + self.opt_flag,
                "-o",
                str(self.groundtruth_dir.joinpath(f)),
                str(self.initial_dir.joinpath(f)),
            ]
            run(cmd, cwd=self.exec_root)
            self.assemble_and_measure_file(self.groundtruth_dir.joinpath(f))

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

        print("Time after baseline: " + str(time.time() - self.start_time))

        dirs = [x[0] for x in os.walk(self.initial_dir)]

        required_empty_paths = [
            self.instr_dir,
            Path("res/"),
            Path("alias_queries/"),
            Path("final_res/"),
            self.default_may_truth,
            Path("composed_files/"),
        ]

        for p in required_empty_paths:
            if os.path.exists(p):
                shutil.rmtree(p)
            os.mkdir(p)

        for d in dirs:
            d = d.removeprefix(str(self.initial_dir) + "/")
            os.makedirs(self.default_may_truth.joinpath("may", d), exist_ok=True)
            os.makedirs(self.default_may_truth.joinpath("std", d), exist_ok=True)

        # self.exploration(
        #    files,
        #    True,
        # )
        # print("Time after may exploration: " + str(time.time() - self.start_time))

        self.exploration(
            files,
            False,
        )
        print("Time after std exploration: " + str(time.time() - self.start_time))

        for file_name in files:
            output_name = file_name.with_suffix(".o")
            # may_size = self.measure_outputsize(
            #    self.exec_root.joinpath("res/may/", output_name)
            # )
            std_size = self.measure_outputsize(
                self.exec_root.joinpath("res/std/", output_name)
            )

            # true_may_size = self.assemble_and_measure_file(
            #    self.default_may_truth.joinpath("may/", file_name)
            # )
            true_std_size = self.assemble_and_measure_file(
                self.default_may_truth.joinpath("std/", file_name)
            )
            print(
                str(file_name)
                + ": "
                # + str(may_size)
                # + " vs "
                # + str(true_may_size)
                # + " and "
                + str(std_size)
                + " vs "
                + str(true_std_size)
            )
            os.makedirs(
                self.exec_root.joinpath("final_res/", output_name.parent), exist_ok=True
            )
            # sizes = [may_size, std_size, true_may_size, true_std_size]
            sizes = [std_size, true_std_size]
            curr_files = [
                # self.exec_root.joinpath("res/may/", output_name),
                self.exec_root.joinpath("res/std/", output_name),
                # self.default_may_truth.joinpath("may/", output_name),
                self.default_may_truth.joinpath("std/", output_name),
            ]

            cmd = [
                "cp",
                str(curr_files[sizes.index(min(sizes))]),
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
        run(cmd, cwd=self.exec_root)

        print("Time after after composition: " + str(time.time() - self.start_time))

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
        ir_per_pass = {}
        curr_ir = ""
        with open(trace_file, "r") as f:
            for line in f.readlines():
                if line == "*** IR Dump At Start ***\n":
                    continue
                if line.startswith("*** "):
                    if curr_ir != "":
                        if curr_pass == "":
                            curr_ir = ""
                        else:
                            ir_per_pass[
                                curr_pass + "_" + str(pass_count[curr_pass] - 1)
                            ] = curr_ir
                            curr_ir = ""

                    trim_line = line.removeprefix("*** IR Dump After ")
                    trim_line = trim_line.removeprefix("*** IR Pass ")
                    trim_line = trim_line.removesuffix(" ***\n")
                    trim_line = trim_line.removesuffix(" omitted because no change")
                    trim_line = trim_line.removesuffix(" ignored ")
                    curr_pass = trim_line
                    curr_pass_key = curr_pass + "_" + str(pass_count.get(curr_pass, 0))
                    for k in aa_count_per_func.keys():
                        aa_per_pass[curr_pass_key + "_" + k] = aa_count_per_func[k]
                        aa_count_per_func[k] = 0
                    pass_count[curr_pass] = pass_count.get(curr_pass, 0) + 1
                    aa_count = 0
                    pass_list.append(curr_pass_key)
                    continue

                if line.startswith("==== "):
                    aa_func = line.split(" ")[1]
                    aa_count_per_func[aa_func] = aa_count_per_func.get(aa_func, 0) + 1
                    continue

                curr_ir += line

        return aa_per_pass, pass_list, ir_per_pass

    def generate_composed_files(self, res: dict):
        for file_name, indeces_per_function in res.items():
            composed_file_name = Path("composed_files/").joinpath(
                str(file_name.with_suffix("")) + "_composed.txt"
            )
            os.makedirs(composed_file_name.parent, exist_ok=True)

            num_funcs = 0
            for function, curr_indeces in indeces_per_function.items():
                if curr_indeces[0] == []:
                    continue
                if curr_indeces[0] == ():
                    continue
                num_funcs += 1

            with open(composed_file_name, "w") as f:
                f.write(str(num_funcs) + "\n")
                for function, curr_indeces in indeces_per_function.items():
                    if curr_indeces[0] == ():
                        continue
                    if curr_indeces[0] == []:
                        continue
                    f.write(function + "\n")
                    f.write(str(len(curr_indeces[0])) + "\n")
                    for index in curr_indeces[0]:
                        f.write(str(index) + "\n")

    def compile_composed(
        self,
        file_name: Path,
        compose_dir: Path,
        take_may: bool,
    ):
        os.makedirs(compose_dir.joinpath(file_name).parent, exist_ok=True)
        cmd = [
            str(self.instr_path.joinpath("opt")),
            str(self.initial_dir.joinpath(file_name)),
            "-o",
            str(compose_dir.joinpath(file_name)),
            "--arfile",
            str(
                Path("composed_files/").joinpath(
                    str(file_name.with_suffix("")) + "_composed.txt"
                )
            ),
            "-" + self.opt_flag,
        ] + (["--take_may"] if take_may else [])
        run(
            cmd,
            cwd=self.exec_root,
        )


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
        for i in range(self.sequence[0] if self.try_all else 1):
            self.aa_instr.run_step_single_func(
                self.file_path,
                i + 1,
                [self.sequence[0] - i],
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
        for i in range(self.sequence[0] if self.try_all else 1):
            os.remove(
                self.aa_instr.instr_dir.joinpath(
                    self.file_path.parent, str(i + 1) + str(self.file_path.stem) + ".bc"
                )
            )
            os.remove(
                self.aa_instr.instr_dir.joinpath(
                    self.file_path.parent, str(i + 1) + str(self.file_path.stem) + ".o"
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

        print("sizes: " + str(sizes))
        print(initial_size)
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
        type=int,
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
            [args.sequence],
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
                        "Oz",
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
