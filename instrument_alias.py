from subprocess import Popen, PIPE, run
import os
from itertools import combinations
import shutil
import argparse
from pathlib import Path
from dataclasses import dataclass
from multiprocessing import Pool

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
    clang_dir: Path
    clang_opt: Path
    instr_opt: Path
    exec_root: Path
    specbuild_dir: Path
    benchmark: Path
    initial_dir: Path
    groundtruth_dir: Path
    default_may_truth: Path
    instr_dir: Path
    llc_path: Path

    def measure_outputsize(self, file: Path) -> int:
        cmd = ["llvm-size", str(file)]
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

    def assemble_and_measure_file(self, file_name: Path) -> int:
        """Measure a given file by compiling to an object file."""

        obj_file_name = file_name.with_suffix(".o")
        run(
            [
                str(self.llc_path),
                "-O2",
                str(file_name),
                "-o",
                str(obj_file_name),
                "-filetype=obj",
            ],
        )

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
            str(self.instr_opt),
            str(self.initial_dir.joinpath(file_name)),
            "-o",
            str(
                self.instr_dir.joinpath(
                    file_name.parent, str(index) + str(file_name.stem) + ".ll"
                )
            ),
            "-S",
            "--arfile",
            str(ar_name),
            "-Os",
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
                        file_name.parent, str(i) + str(file_name.stem) + ".ll"
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
    ):
        os.makedirs(str(self.instr_dir.joinpath(file_name).parent), exist_ok=True)
        curr_list: list = []

        prev_count = -2

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
                file_name.parent, str(0) + str(file_name.stem) + ".ll"
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
                            file_name.parent, str(i) + str(file_name.stem) + ".ll"
                        )
                    )
                )

            print(list(set(counts)))
            prev_count = min_count
            min_count = min(counts)
            # No reduction occured, hence we are done
            if min_count >= prev_count:
                break

            print(min_count)
            min_index = counts.index(min_count)
            curr_list = lists[min_index].copy()
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
            str(self.instr_opt),
            str(self.initial_dir.joinpath(f)),
            "-o",
            str(self.default_may_truth.joinpath(description, f)),
            "-S",
            "--ofile",
            str(Path("alias_queries/").joinpath(description, f.with_suffix(".txt"))),
            "-Os",
        ] + (["--take_may"] if take_may else [])
        run(cmd, cwd=self.exec_root)

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

        def get_count(file_name: Path) -> dict[str, int]:
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

        count_per_file = {}

        for f in files:
            filename = self.exec_root.joinpath(
                Path("alias_queries/"), description, f.with_suffix(".txt")
            )
            curr_counts = get_count(filename)
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
                        # curr_path,
                        take_may,
                    )
                else:
                    curr_results[function] = self.greedy_exploration(
                        file_name,
                        function,
                        count,
                        # curr_path,
                        take_may,
                    )

                # print(curr_results[function])

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
        if not os.path.exists(self.exec_root.joinpath(self.groundtruth_dir)):
            # generate groundtruth
            run(["./spec", "cmake"], cwd=self.specbuild_dir)
            run(["mkdir", "-p", str(self.groundtruth_dir)], cwd=self.specbuild_dir)
            run(
                [
                    "cmake",
                    "-G",
                    "Ninja",
                    "-DCMAKE_C_COMPILER=" + str(self.clang_dir),
                    "-DCMAKE_CXX_COMPILER=" + str(self.clang_dir) + "++",
                    '-DCMAKE_CXX_FLAGS="-Os"',
                    '-DCMAKE_C_FLAGS="-Os"',
                    "..",
                ],
                cwd=self.specbuild_dir.joinpath(self.groundtruth_dir),
            )
            run("ninja", cwd=self.specbuild_dir.joinpath(self.groundtruth_dir))
            run(
                [
                    "cp",
                    "-r",
                    str(self.groundtruth_dir),
                    str(self.exec_root.joinpath(self.groundtruth_dir)),
                ],
                cwd=self.specbuild_dir,
            )

        run(
            [
                "./spec",
                "build",
                str(self.initial_dir),
                str(self.benchmark),
                str(self.clang_dir),
                "-L",
            ],
            cwd=self.specbuild_dir,
        )
        run(
            [
                "cp",
                "-r",
                str(self.initial_dir),
                str(self.exec_root.joinpath(self.initial_dir)),
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

        dirs = [x[0] for x in os.walk(self.initial_dir)]

        required_empty_paths = [
            Path("aafiles/"),
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
            if may_size <= std_size:
                print("may wins")
                cmd = [
                    "cp",
                    str(self.exec_root.joinpath("res/may/", output_name)),
                    str(self.exec_root.joinpath("final_res/", output_name)),
                ]
                run(cmd, cwd=self.exec_root)
            else:
                print("std wins")
                cmd = [
                    "cp",
                    str(self.exec_root.joinpath("res/std/", output_name)),
                    str(self.exec_root.joinpath("final_res/", output_name)),
                ]
                run(cmd, cwd=self.exec_root)

        # linking:

        cmd = (
            [
                "/usr/bin/ld",
                "--hash-style=gnu",
                "--eh-frame-hdr",
                "-m",
                "elf_x86_64",
                "-dynamic-linker",
                "/lib64/ld-linux-x86-64.so.2",
                "-o",
                "final_res/linked.out",
                "/usr/lib64/gcc/x86_64-pc-linux-gnu/12.2.1/../../../../lib64/Scrt1.o",
                "/usr/lib64/gcc/x86_64-pc-linux-gnu/12.2.1/../../../../lib64/crti.o",
                "/usr/lib64/gcc/x86_64-pc-linux-gnu/12.2.1/crtbeginS.o",
                "-L/usr/lib64/gcc/x86_64-pc-linux-gnu/12.2.1",
                "-L/usr/lib64/gcc/x86_64-pc-linux-gnu/12.2.1/../../../../lib64",
                "-L/lib/../lib64",
                "-L/usr/lib/../lib64",
                "-L/lib",
                "-L/usr/lib",
                "-lgcc",
                "--as-needed",
                "-lgcc_s",
                "--no-as-needed",
                "-lc",
                "-lgcc",
                "--as-needed",
                "-lgcc_s",
                "--no-as-needed",
                "/usr/lib64/gcc/x86_64-pc-linux-gnu/12.2.1/crtendS.o",
                "/usr/lib64/gcc/x86_64-pc-linux-gnu/12.2.1/../../../../lib64/crtn.o",
                "-no-pie",
                "-O2",
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
            self.groundtruth_dir.joinpath(str(self.benchmark))
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
            str(self.instr_opt),
            str(self.initial_dir.joinpath(file_name)),
            "-o",
            str(compose_dir.joinpath(file_name)),
            "-S",
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


if __name__ == "__main__":
    arg_parser = argparse.ArgumentParser()

    arg_parser.add_argument(
        "--clang_path",
        type=str,
        nargs="?",
        help="path to clang executable",
        default="/home/michel/ETH/AST/llvm-project/build_clang17/bin/clang",
    )

    arg_parser.add_argument(
        "--clang_opt",
        type=str,
        nargs="?",
        help="path to clangs opt",
        default="/home/michel/ETH/AST/llvm-project/build_clang17/bin/opt",
    )

    arg_parser.add_argument(
        "--instr_opt",
        type=str,
        nargs="?",
        help="path to instrumented opt",
        default="/home/michel/ETH/AST/llvm-project/build_instr/bin/opt",
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

    llc_path = "/home/michel/ETH/AST/llvm-project/build_clang17/bin/llc"

    args = arg_parser.parse_args()

    initial_dir = "naive_start/"
    groundtruth_dir = "baseline/"
    default_may_truth = "naive_truth/"
    instr_dir = "aafiles/"

    InstrumentAlias(
        Path(args.clang_path),
        Path(args.clang_opt),
        Path(args.instr_opt),
        Path(args.exec_root),
        Path(args.specbuild_dir),
        Path("605"),
        Path(initial_dir),
        Path(groundtruth_dir),
        Path(default_may_truth),
        Path(instr_dir),
        Path(llc_path),
    ).exploration_driver()
