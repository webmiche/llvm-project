from core import AAInstrumentationDriver, register_arguments
from dataclasses import dataclass, field
import sys
from pathlib import Path
from typing import Dict, List
import random
import math
from multiprocessing import Pool
import shutil


@dataclass
class BugTester(AAInstrumentationDriver):
    """
    This class implements the bug tester. The bug tester produces num_runs many
    random AA sequences and uses them to hunt for bugs. In particular, each new
    binary is linked with the initial (precise) binaries and the test is run.
    """

    random_seed: int = 0

    def test_bug(
        self,
        file_name: Path,
        num_candidates: int,
        num_runs: int,
        precise_files: List[Path],
    ):
        random.seed(self.random_seed)

        # generate random sequences
        full_population = self.get_n_random_sequences(num_candidates, num_runs)

        # for each sequence, compile and find distinct binaries
        with Pool(self.proc_count) as pool:
            hashes = pool.starmap(
                self.run_assemble_and_get_hash,
                [
                    (file_name, i, sample, False)
                    for i, sample in enumerate(full_population)
                ],
            )

        hashes = enumerate(hashes)
        distinct_hashes = []
        for i, hash_ in hashes:
            if hash_ not in [h for h, _, _ in distinct_hashes]:
                distinct_hashes.append((hash_, i, full_population[i]))

        computed_hashes = []
        original_output, time_taken = self.run_baseline(computed_hashes=computed_hashes)
        print(f"time taken: {time_taken}")

        # for each distinct binary, link with precise files, run, and compare output
        for ind, (hash_, i, seq) in enumerate(distinct_hashes):
            print(f"Testing sequence {ind + 1}/{len(distinct_hashes)}")
            output = self.link_and_run(
                file_name, i, precise_files, computed_hashes, timeout=time_taken * 10
            )
            if output is not None and output != original_output:
                print(f"Sequence: {seq}")
                print(f"Output: {output}")

        shutil.rmtree(self.exec_root / "binaries")


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

    driver = BugTester(
        instr_path,
        exec_root,
        specbuild_dir,
        benchmark,
        initial_dir,
        instr_dir,
        groundtruth_dir,
        "O3",
        args.proc_count,
    )
    driver.generate_baseline()

    files = driver.get_baseline_files()

    candidates_per_file = driver.get_candidates_per_file(files)
    for file, num_candidates in candidates_per_file.items():
        print(f"{file}: {num_candidates}")
        driver.test_bug(
            file, num_candidates, 100, [f.with_suffix(".o") for f in files if f != file]
        )
