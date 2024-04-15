from core import AAInstrumentationDriver, AATraceInfo, register_arguments
import sys


class QueriesPerPassDriver(AAInstrumentationDriver):

    def run(self, file):
        aa_trace = self.get_queries_per_pass(file)

        queries_per_pass, pass_list = aa_trace

        print(f"Queries per pass for {file}")
        self.print_queries_per_pass(queries_per_pass)

    def print_queries_per_pass(self, queries_per_pass):
        to_print = {}
        for pass_name, queries in queries_per_pass.items():
            # filter zero elements
            queries = {k: v for k, v in queries.items() if v != 0}
            if queries:
                to_print[pass_name] = queries

        print(to_print)


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
