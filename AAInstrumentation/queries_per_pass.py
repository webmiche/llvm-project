from core import AAInstrumentationDriver, AATraceInfo, register_arguments, AAResult
import sys


class QueriesPerPassDriver(AAInstrumentationDriver):

    def run(self, file):
        queries_per_pass = self.get_candidate_per_pass(file)

        aggregate_results = self.aggregate_results(queries_per_pass)

        print(f"Queries per pass for {file}")
        print(aggregate_results)

    def aggregate_results(self, results):

        remove_empty = {
            k: v for k, v in results.items() if v is not None and len(v) > 0
        }

        res = {}
        for k, v in remove_empty.items():
            res[k] = {
                "NoAlias": v.count(AAResult.NoAlias),
                "MayAlias": v.count(AAResult.MayAlias),
                "MustAlias": v.count(AAResult.MustAlias),
                "PartialAlias": v.count(AAResult.PartialAlias),
            }

        return res


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

    driver = QueriesPerPassDriver(
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

    for file in files:
        driver.run(file)
