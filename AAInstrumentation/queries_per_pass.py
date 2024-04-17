from core import AAInstrumentationDriver, AATraceInfo, register_arguments, AAResult
import sys


class QueriesPerPassDriver(AAInstrumentationDriver):

    def run(self, file):
        queries_per_pass = self.get_candidate_per_pass(file)

        # candidate_count = self.get_candidate_count(file)
        # sum_candidate_no = 0
        # sum_candidate_must = 0
        # sum_candidate_partial = 0
        # for pass_, queries in queries_per_pass.items():
        #    sum_candidate_no += queries.count(AAResult.NoAlias)
        #    sum_candidate_must += queries.count(AAResult.MustAlias)
        #    sum_candidate_partial += queries.count(AAResult.PartialAlias)

        # sum_candidate_counts = (
        #    sum_candidate_no + sum_candidate_must + sum_candidate_partial
        # )

        # if candidate_count != sum_candidate_counts:
        #    print(
        #        f"File {file} has {candidate_count} candidates but {sum_candidate_counts} queries"
        #    )
        #    print(f"Sum NoAlias: {sum_candidate_no}")
        #    print(f"Sum MustAlias: {sum_candidate_must}")
        #    print(f"Sum PartialAlias: {sum_candidate_partial}")

        return queries_per_pass

        # print(f"Queries per pass for {file}")
        # self.print_queries_per_pass(queries_per_pass)

    def print_queries_per_pass(self, queries_per_pass):
        to_print = {
            k: v for k, v in queries_per_pass.items() if v is not None and len(v) > 0
        }

        final_print = {}
        for k, v in to_print.items():
            final_print[k] = {
                "NoAlias": v.count(AAResult.NoAlias),
                "MayAlias": v.count(AAResult.MayAlias),
                "MustAlias": v.count(AAResult.MustAlias),
                "PartialAlias": v.count(AAResult.PartialAlias),
            }

        print(final_print)


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
    # driver.generate_baseline()

    # files = driver.get_baseline_files()

    # for file in files:
    #     driver.run(file)

    groundtruth_dict = driver.run("600/regcomp.bc")

    for i in range(100):
        print(i)
        new_dict = driver.run("600/regcomp.bc")

        for pass_, queries in groundtruth_dict.items():
            if new_dict[pass_] != queries:
                print(f"Pass {pass_} has changed")
                print("Old vs New:")
                print(
                    f"NoAlias: {queries.count(AAResult.NoAlias)} vs {new_dict[pass_].count(AAResult.NoAlias)}"
                )
                print(
                    f"MayAlias: {queries.count(AAResult.MayAlias)} vs {new_dict[pass_].count(AAResult.MayAlias)}"
                )
                print(
                    f"MustAlias: {queries.count(AAResult.MustAlias)} vs {new_dict[pass_].count(AAResult.MustAlias)}"
                )
                print(
                    f"PartialAlias: {queries.count(AAResult.PartialAlias)} vs {new_dict[pass_].count(AAResult.PartialAlias)}"
                )
