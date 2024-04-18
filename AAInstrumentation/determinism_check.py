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

        return aggregate_results, hash_string

    def run(self, file, num_runs):
        base_dict, base_hash = self.compute_results(file, 0)

        with Pool(self.proc_count) as p:
            results = p.starmap(
                self.compute_results, [(file, i) for i in range(num_runs)]
            )

        for result, hash_string in results:
            for pass_ in base_dict:
                if pass_ not in result:
                    print(f"Pass {pass_} in {file} is non-deterministic (missing pass)")
                    print(
                        f"Hash: {hash_string} vs {base_hash}: {hash_string == base_hash}"
                    )
                    continue
            for pass_, queries in result.items():
                if pass_ not in base_dict:
                    print(f"Pass {pass_} in {file} is non-deterministic (new pass)")
                    print(
                        f"Hash: {hash_string} vs {base_hash}: {hash_string == base_hash}"
                    )
                    continue
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
                    print(
                        f"Hash: {hash_string} vs {base_hash}: {hash_string == base_hash}"
                    )


class VerifyDeterminismFlag(QueriesPerPassDriver):

    def run(self, file):
        base_queries_per_pass, base_hash_string = self.get_candidate_per_pass_and_hash(
            file, 0
        )

        deterministic_queries_per_pass, deterministic_hash_string = (
            self.get_candidate_per_pass_and_hash(file, 1, deterministic=True)
        )

        base_queries_per_pass = self.aggregate_results(base_queries_per_pass)
        deterministic_queries_per_pass = self.aggregate_results(
            deterministic_queries_per_pass
        )

        print(f"Check determinism flag for {file}")

        if base_hash_string != deterministic_hash_string:
            print(f"Change in hash for {file}")
            print(f"Hash: {base_hash_string} vs {deterministic_hash_string}")

        if base_queries_per_pass != deterministic_queries_per_pass:
            print(f"Change in queries per pass for {file}")
            for pass_, queries in base_queries_per_pass.items():
                if pass_ not in deterministic_queries_per_pass:
                    print(f"Pass {pass_} in {file} is non-deterministic (missing pass)")
                    continue
                if queries != deterministic_queries_per_pass[pass_]:
                    print(f"Pass {pass_} in {file} is non-deterministic")
                    print(
                        f"NoAlias: {queries['NoAlias']} vs {deterministic_queries_per_pass[pass_]['NoAlias']}"
                    )
                    print(
                        f"MayAlias: {queries['MayAlias']} vs {deterministic_queries_per_pass[pass_]['MayAlias']}"
                    )
                    print(
                        f"MustAlias: {queries['MustAlias']} vs {deterministic_queries_per_pass[pass_]['MustAlias']}"
                    )
                    print(
                        f"PartialAlias: {queries['PartialAlias']} vs {deterministic_queries_per_pass[pass_]['PartialAlias']}"
                    )

            for pass_ in deterministic_queries_per_pass:
                if pass_ not in base_queries_per_pass:
                    print(f"Pass {pass_} in {file} is non-deterministic (new pass)")
                    continue


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

    driver = VerifyDeterminismFlag(
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
    driver.run(Path("600/regcomp.bc"))

    # driver.generate_baseline()

    # files = driver.get_baseline_files()

    # for file in files:
    #    driver.run(file, 100)
