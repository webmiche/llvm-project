from __future__ import annotations
from subprocess import Popen, PIPE, run
import os
from itertools import combinations
import shutil
import argparse
from pathlib import Path
from dataclasses import dataclass
from multiprocessing import Pool
import sys

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
            "-Os",
            "--arfile",
            str(ar_name),
        ] + (["--take_may"] if take_may else [])
        run(
            cmd,
            cwd=self.exec_root,
        )

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

        for curr_list, i in zip(list_combinations, range(len(list_combinations))):
            # generate appropriate file

            ar_file_name: Path = self.instr_dir.joinpath(str(i) + ".txt")

            with open(ar_file_name, "w") as f:
                f.write((str(1) + "\n"))
                f.write(function_name + "\n")
                f.write(str(len(curr_list)) + "\n")
                for k in curr_list:
                    f.write(f"{k}\n")

        # compile and measure
        with Pool() as p:
            p.starmap(
                self.run_step,
                [
                    (file_name, i, function_name, take_may)
                    for i in range(len(list_combinations))
                ],
            )

        counts = []
        lists = []
        for i in range(len(list_combinations)):
            ar_name = self.instr_dir.joinpath(str(i) + ".txt")
            counts.append(
                self.assemble_and_measure_file(
                    self.instr_dir.joinpath(
                        file_name.parent, str(i) + str(file_name.stem) + ".bc"
                    )
                )
            )
            lists.append(list_combinations[i])

        print(list(set(counts)))
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

        ar_name: Path = self.instr_dir.joinpath(str(0) + ".txt")

        with open(ar_name, "w") as f:
            f.write((str(1) + "\n"))
            f.write(function_name + "\n")
            f.write(str(len(curr_list)) + "\n")

        # compile and count

        self.run_step(
            file_name,
            0,
            function_name,
            take_may,
        )
        min_count = self.assemble_and_measure_file(
            self.instr_dir.joinpath(
                file_name.parent, str(0) + str(file_name.stem) + ".bc"
            )
        )

        while True:
            counts = []
            lists = []
            for i in range(curr_list[-1] + 1 if len(curr_list) else 0, count):
                next_list = curr_list + [i]

                # generate appropriate file

                ar_name = self.instr_dir.joinpath(str(i) + ".txt")

                with open(ar_name, "w") as f:
                    f.write((str(1) + "\n"))
                    f.write(function_name + "\n")
                    f.write(str(len(next_list)) + "\n")
                    for k in next_list:
                        f.write(f"{k}\n")

                # compile and count

                lists.append(next_list)

            with Pool() as p:
                p.starmap(
                    self.run_step,
                    [
                        (file_name, i, function_name, take_may)
                        for i in range(
                            curr_list[-1] + 1 if len(curr_list) else 0, count
                        )
                    ],
                )

            for i in range(curr_list[-1] + 1 if len(curr_list) else 0, count):
                counts.append(
                    self.assemble_and_measure_file(
                        self.instr_dir.joinpath(
                            file_name.parent, str(i) + str(file_name.stem) + ".bc"
                        )
                    )
                )

            print(list(set(counts)))

            index_list = [(i, v) for i, v in enumerate(counts) if v < min_count]

            # No reduction occured, hence we are done
            if index_list == []:
                break

            if take_min:
                min_count = min(counts)
                min_index = counts.index(min_count)
                curr_list = lists[min_index].copy()
            else:
                min_count = index_list[0][1]
                curr_list = lists[index_list[0][0]].copy()

            print(min_count)
            print(curr_list)

        return curr_list, min_count

    def oneexplore(self, f: Path, take_may: bool, description: str):
        os.makedirs(
            self.default_may_truth.joinpath(description, f).parent, exist_ok=True
        )
        os.makedirs(
            Path("alias_queries/").joinpath(description, f).parent, exist_ok=True
        )
        print(f)
        cmd = [
            str(self.instr_path.joinpath("opt")),
            str(self.initial_dir.joinpath(f)),
            "-o",
            str(self.default_may_truth.joinpath(description, f)),
            "--ofile",
            str(Path("alias_queries/").joinpath(description, f.with_suffix(".txt"))),
            "-Os",
        ] + (["--take_may"] if take_may else [])
        run(cmd, cwd=self.exec_root)

    def get_count(self, file_name: Path) -> dict[str, int]:
        try:
            f = open(file_name, "r")
        except FileNotFoundError:
            return {}
        counts: dict[str, int] = {}

        for line in [l.strip() for l in f.readlines()]:
            curr_line = line.split(" ")[0]
            if curr_line in counts:
                counts[curr_line] = counts[curr_line] + 1
            else:
                counts[curr_line] = 1

        return counts

    def exploration(
        self,
        files: list[Path],
        take_may: bool,
    ):
        description: Path = Path("may") if take_may else Path("std")
        os.mkdir(Path("alias_queries/").joinpath(description))
        os.mkdir(Path("res/").joinpath(description))

        print("Track AA Queries " + str(description))
        with Pool() as p:
            p.starmap(self.oneexplore, [(f, take_may, description) for f in files])

        count_per_file = {}

        for f in files:
            filename = self.exec_root.joinpath(
                Path("alias_queries/"), description, f.with_suffix(".txt")
            )
            curr_counts = self.get_count(filename)
            count_per_file[f] = curr_counts

        print(count_per_file)

        results = {}

        print("Start Exploration")
        for file_name in count_per_file.keys():
            print(file_name)
            curr_results = {}
            for function in count_per_file[file_name].keys():
                print(function)
                curr_path: Path = self.instr_dir.joinpath(Path(function))
                if not os.path.exists(curr_path):
                    os.makedirs(curr_path, exist_ok=True)
                count = count_per_file[file_name][function]
                if count < 10:
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

            results[file_name] = curr_results

        print(results)

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

    def exploration_driver(
        self,
    ):
        run(
            [
                "./spec",
                "build",
                str(self.initial_dir),
                str(self.benchmark),
                str(self.instr_path.joinpath("clang")),
                "-bc",
                "--opt_level",
                "Os",
            ],
            cwd=self.specbuild_dir,
        )
        run(
            [
                "cp",
                "-r",
                str(self.initial_dir),
                str(self.exec_root),
            ],
            cwd=self.specbuild_dir,
        )

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
                "-Os",
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
                "-o",
                Path("baseline/").joinpath(self.benchmark, str(self.benchmark)),
            ]
            + ["-l" + link for link in linked_libraries.get(str(self.benchmark), [])]
            + [str(self.groundtruth_dir.joinpath(f.with_suffix(".o"))) for f in files]
        )
        run(cmd, cwd=self.exec_root)

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

        self.exploration(
            files,
            True,
        )

        self.exploration(
            files,
            False,
        )

        for file_name in files:
            output_name = file_name.with_suffix(".o")
            may_size = self.measure_outputsize(
                self.exec_root.joinpath("res/may/", output_name)
            )
            std_size = self.measure_outputsize(
                self.exec_root.joinpath("res/std/", output_name)
            )

            true_may_size = self.assemble_and_measure_file(
                self.default_may_truth.joinpath("may/", file_name)
            )
            true_std_size = self.assemble_and_measure_file(
                self.default_may_truth.joinpath("std/", file_name)
            )
            print(
                str(file_name)
                + ": "
                + str(may_size)
                + " vs "
                + str(true_may_size)
                + " and "
                + str(std_size)
                + " vs "
                + str(true_std_size)
            )
            os.makedirs(
                self.exec_root.joinpath("final_res/", output_name.parent), exist_ok=True
            )
            sizes = [may_size, std_size, true_may_size, true_std_size]
            curr_files = [
                self.exec_root.joinpath("res/may/", output_name),
                self.exec_root.joinpath("res/std/", output_name),
                self.default_may_truth.joinpath("may/", output_name),
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
                "-o",
                "final_res/linked.out",
            ]
            + ["-l" + link for link in linked_libraries.get(str(self.benchmark), [])]
            + ["final_res/" + str(f.with_suffix(".o")) for f in files]
        )
        run(cmd, cwd=self.exec_root)

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

        ## sanity check for correctness
        # cmd = ["./final_res/linked.out", "run/605_run/inp.in", "1>&2"]
        # p = run(" ".join(cmd), cwd=exec_root, shell=True)

        # print(p.returncode)

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
            "-Os",
        ] + (["--take_may"] if take_may else [])
        run(
            cmd,
            cwd=self.exec_root,
        )


@dataclass
class AAChecker:
    file_path: Path
    aa_files_dir: Path
    function_name: str

    aa_instr: InstrumentAlias

    def is_valid(self):
        init_size = self.aa_instr.assemble_and_measure_file(self.file_path)
        os.makedirs(self.aa_files_dir.joinpath(self.file_path), exist_ok=True)

        take_may = False
        cmd = [
            str(self.aa_instr.instr_path.joinpath("opt")),
            str(self.file_path),
            "--ofile",
            str(self.aa_files_dir.joinpath(self.file_path.with_suffix(".txt"))),
            "-Os",
        ] + (["--take_may"] if take_may else [])
        print(" ".join(cmd))
        run(cmd, cwd=self.aa_instr.exec_root)

        counts = self.aa_instr.get_count(
            self.aa_files_dir.joinpath(self.file_path.with_suffix(".txt"))
        )
        print(counts)


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
        "--check_file",
        type=str,
        nargs="?",
        help="check if the file is valid",
    )

    args = arg_parser.parse_args()
    run(["git", "rev-parse", "HEAD"], cwd=args.exec_root)

    initial_dir = "naive_start/"
    groundtruth_dir = "baseline/"
    default_may_truth = "naive_truth/"
    instr_dir = "aafiles/"

    if args.check_file:
        print("=============== checking file " + args.check_file + " ===============")
        if not AAChecker(
            Path(args.check_file),
            Path(instr_dir),
            "price_out_impl",
            InstrumentAlias(
                Path(args.instr_path),
                Path(args.exec_root),
                Path(args.specbuild_dir),
                Path(args.benchmark),
                Path(initial_dir),
                Path(groundtruth_dir),
                Path(default_may_truth),
                Path(instr_dir),
            ),
        ).is_valid():
            exit(1)
        exit(0)

    benchmarks = [
        "600",
        "602",
        "605",
        "619",
        "620",
        "623",
        "625",
        "631",
        "638",
        "641",
        "644",
        "657",
    ]
    allowed_benchmarks = ["605", "619"]
    if args.benchmark == "all":
        for i in allowed_benchmarks:
            sys.stdout = open("gen_res_" + i + "_first_strat.txt", "w")
            print("=============== running benchmark " + i + " ===============")
            args.benchmark = i
            InstrumentAlias(
                Path(args.instr_path),
                Path(args.exec_root),
                Path(args.specbuild_dir),
                Path(args.benchmark),
                Path(initial_dir),
                Path(groundtruth_dir),
                Path(default_may_truth),
                Path(instr_dir),
            ).exploration_driver()
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
        ).exploration_driver()
