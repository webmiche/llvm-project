from core import AAInstrumentationDriver, AATraceInfo, register_arguments, AAResult
from queries_per_pass import QueriesPerPassDriver
import sys
from multiprocessing import Pool
from pathlib import Path


"""
This file implements several checks for non-determinism in LLVM. In particular,
the DeterminismCheck class checks for n runs whether the queries per pass stay
the same. The NoInstrumentationDeterminismCheck class checks whether the trace
with no instrumentation stays the same for n runs.

In Spec, three files show non-determinism. I used `--enable-gvn-memdep=0
--simple-loop-unswitch-memoryssa-threshold=0` to make one deterministic, but
this changes the compiler in such a way that it does something way different.
And, the other two files are still non-deterministic.
"""


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


class NoInstrumentationDeterminismCheck(AAInstrumentationDriver):

    def run(self, file_name, num_runs):
        base_trace = self.get_trace_no_instrumentation(file_name)

        with Pool(self.proc_count) as p:
            traces = p.map(
                self.get_trace_no_instrumentation,
                [(file_name) for _ in range(num_runs)],
            )

        print(f"Check determinism for {file_name}")

        for i, trace in enumerate(traces):
            if trace != base_trace:
                print(f"Trace {i} for {file_name} is non-deterministic")


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
