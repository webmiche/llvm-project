from core import AAInstrumentationDriver, AATraceInfo, register_arguments, AAResult
from queries_per_pass import QueriesPerPassDriver
import sys
from multiprocessing import Pool
from pathlib import Path


class DeterminismCheck(QueriesPerPassDriver):

    def compute_results(self, file, name_prefix):
        queries_per_pass, hash_string = self.get_candidate_per_pass_and_hash(
            file, name_prefix
        )

        aggregate_results = self.aggregate_results(queries_per_pass)

        return hash_string, aggregate_results

    def run(self, file, num_runs):
        base_dict = self.compute_results(file, 0)

        with Pool(self.proc_count) as p:
            results = p.starmap(
                self.compute_results, [(file, i) for i in range(num_runs)]
            )

        for hash_string, result in results:
            print(f"Comparing {hash_string}")
            print(f"Res: {result}")
            for pass_, queries in result.items():
                if base_dict[pass_] != queries:
                    print(f"Pass {pass_} in {file} is non-deterministic")
                    print(
                        f"NoAlias: {base_dict[pass_]['NoAlias']} vs {queries['NoAlias']}"
                    )
                    print(
                        f"MayAlias: {base_dict[pass_]['MayAlias']} vs {queries['MayAlias']}"
                    )
                    print(
                        f"MustAlias: {base_dict[pass_]['MustAlias']} vs {queries['MustAlias']}"
                    )
                    print(
                        f"PartialAlias: {base_dict[pass_]['PartialAlias']} vs {queries['PartialAlias']}"
                    )
                    print(f"Hash: {hash_string}")


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

    driver = DeterminismCheck(
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
    driver.run(Path("600/regcomp.bc"), 10)

    # driver.generate_baseline()

    # files = driver.get_baseline_files()

    # for file in files:
    #    driver.run(file, 100)
