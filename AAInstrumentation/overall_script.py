from optimization import (
    Optimizer,
    OptimizerDriver,
    imprecise_factory,
    parallel_random_factory,
    parallel_local_autotuner_factory,
)
from maximal_relaxation import (
    ParallelIndividualRelaxationDriver,
)
from unique_hashes import ParallelUniqueHashesDriver
from core import register_arguments
import sys
from pathlib import Path
from typing import Callable
from queries_per_pass import QueriesPerPassDriver, OverallQueriesPerPassDriver
from determinism_check import (
    DeterminismCheck,
    NoInstrumentationDeterminismCheck,
)


def run_optimization(
    driver: OptimizerDriver,
    optimizer_factories: list[Callable[[OptimizerDriver], Optimizer]],
):
    driver.register_optimizers(optimizer_factories)
    driver.run()


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

result_directories = {
    "optimization": "AAInstrumentation/optimization",
    "unique_hashes": "AAInstrumentation/unique_hashes",
    "maximal_relaxation": "AAInstrumentation/maximal_relaxation",
    "queries_per_pass": "AAInstrumentation/queries_per_pass",
    "determinism_check": "AAInstrumentation/determinism_check",
    "no_instrumentation_determinism_check": "AAInstrumentation/no_instrumentation_determinism_check",
}


def run_no_instrumentation_determinism_check(
    instr_path,
    exec_root,
    specbuild_dir,
    initial_dir,
    instr_dir,
    groundtruth_dir,
    opt_flag,
    proc_count,
    benchmarks: list[str],
):
    result_directory = (
        result_directories["no_instrumentation_determinism_check"] + f"_{opt_flag}"
    )
    Path(result_directory).mkdir(parents=True, exist_ok=True)
    for benchmark in benchmarks:
        sys.stdout = open(f"{result_directory}/{benchmark}.txt", "w")
        print(f"Running benchmark {benchmark} with {opt_flag}")
        driver = NoInstrumentationDeterminismCheck(
            instr_path,
            exec_root,
            specbuild_dir,
            Path(benchmark),
            initial_dir,
            instr_dir,
            groundtruth_dir,
            opt_flag,
            proc_count,
        )
        driver.generate_baseline()

        files = driver.get_baseline_files()

        for file in files:
            driver.run(file, 10)


def run_determinism_check(
    instr_path,
    exec_root,
    specbuild_dir,
    initial_dir,
    instr_dir,
    groundtruth_dir,
    opt_flag,
    proc_count,
    benchmarks: list[str],
):
    result_directory = result_directories["determinism_check"] + f"_{opt_flag}"
    Path(result_directory).mkdir(parents=True, exist_ok=True)
    for benchmark in benchmarks:
        sys.stdout = open(f"{result_directory}/{benchmark}.txt", "w")
        print(f"Running benchmark {benchmark} with {opt_flag}")
        driver = DeterminismCheck(
            instr_path,
            exec_root,
            specbuild_dir,
            Path(benchmark),
            initial_dir,
            instr_dir,
            groundtruth_dir,
            opt_flag,
            proc_count,
        )
        driver.generate_baseline()

        files = driver.get_baseline_files()

        for file in files:
            driver.run(file, 10)


def run_queries_per_pass_experiment(
    instr_path,
    exec_root,
    specbuild_dir,
    initial_dir,
    instr_dir,
    groundtruth_dir,
    opt_flag,
    proc_count,
    benchmarks: list[str],
    overall: bool = False,
):
    result_directory = result_directories["queries_per_pass"] + f"_{opt_flag}"
    Path(result_directory).mkdir(parents=True, exist_ok=True)
    for benchmark in benchmarks:
        sys.stdout = open(f"{result_directory}/{benchmark}.txt", "w")
        print(f"Running benchmark {benchmark} with {opt_flag}")
        base_class = QueriesPerPassDriver
        if overall:
            base_class = OverallQueriesPerPassDriver
        driver = base_class(
            instr_path,
            exec_root,
            specbuild_dir,
            Path(benchmark),
            initial_dir,
            instr_dir,
            groundtruth_dir,
            opt_flag,
            proc_count,
        )

        driver.generate_baseline()
        files = driver.get_baseline_files()

        for file in files:
            driver.run(file)


def run_optimization_experiment(
    instr_path,
    exec_root,
    specbuild_dir,
    initial_dir,
    instr_dir,
    groundtruth_dir,
    opt_flag,
    proc_count,
    benchmarks: list[str],
):
    result_directory = result_directories["optimization"] + f"_{opt_flag}"
    Path(result_directory).mkdir(parents=True, exist_ok=True)
    for benchmark in benchmarks:
        sys.stdout = open(f"{result_directory}/{benchmark}.txt", "w")
        print(f"Running benchmark {benchmark} with {opt_flag}")
        driver = OptimizerDriver(
            instr_path,
            exec_root,
            specbuild_dir,
            Path(benchmark),
            initial_dir,
            instr_dir,
            groundtruth_dir,
            opt_flag,
            proc_count,
        )
        run_optimization(
            driver,
            [
                imprecise_factory(),
                parallel_random_factory(1000),
                parallel_local_autotuner_factory(),
            ],
        )


def run_unique_hashes_experiment(
    instr_path,
    exec_root,
    specbuild_dir,
    initial_dir,
    instr_dir,
    groundtruth_dir,
    opt_flag,
    proc_count,
    benchmarks: list[str],
):
    result_directory = result_directories["unique_hashes"] + f"_{opt_flag}"
    Path(result_directory).mkdir(parents=True, exist_ok=True)
    for benchmark in benchmarks:
        sys.stdout = open(f"{result_directory}/{benchmark}.txt", "w")
        print(f"Running benchmark {benchmark} with {opt_flag}")
        driver = ParallelUniqueHashesDriver(
            instr_path,
            exec_root,
            specbuild_dir,
            Path(benchmark),
            initial_dir,
            instr_dir,
            groundtruth_dir,
            opt_flag,
            proc_count,
        )
        driver.generate_baseline()

        files = driver.get_baseline_files()

        candidates_per_file = driver.get_candidates_per_file(files)
        num_runs = 10000
        for file, num_candidates in candidates_per_file.items():
            print(f"{file}: {num_candidates}")
            original_hash, original_size = driver.run_assemble_and_get_hash_and_size(
                file, 0, []
            )
            unique_hashes, sizes = driver.get_num_unique_hashes(
                file, num_candidates, num_runs
            )
            print(f"Unique hashes: {unique_hashes} of {num_runs} runs")
            print(f"Original size: {original_size}")
            print(f"Sizes: {sizes}")


def run_maximal_relaxation_experiment(
    instr_path,
    exec_root,
    specbuild_dir,
    initial_dir,
    instr_dir,
    groundtruth_dir,
    opt_flag,
    proc_count,
    benchmarks: list[str],
):
    result_directory = result_directories["maximal_relaxation"] + f"_{opt_flag}"
    Path(result_directory).mkdir(parents=True, exist_ok=True)
    for benchmark in benchmarks:
        sys.stdout = open(f"{result_directory}/{benchmark}.txt", "w")
        print(f"Running benchmark {benchmark} with {opt_flag}")
        driver = ParallelIndividualRelaxationDriver(
            instr_path,
            exec_root,
            specbuild_dir,
            Path(benchmark),
            initial_dir,
            instr_dir,
            groundtruth_dir,
            opt_flag,
            proc_count,
            "",
            False,
        )
        driver.maximal_relaxation()


if __name__ == "__main__":
    arg_parser = register_arguments()
    arg_parser.add_argument(
        "--optimization",
        action="store_true",
        help="Run optimization experiment",
    )
    arg_parser.add_argument(
        "--unique_hashes",
        action="store_true",
        help="Run unique hashes experiment",
    )
    arg_parser.add_argument(
        "--maximal_relaxation",
        action="store_true",
        help="Run maximal relaxation experiment",
    )
    arg_parser.add_argument(
        "--queries_per_pass",
        action="store_true",
        help="Run queries per pass experiment",
    )
    arg_parser.add_argument(
        "--queries_per_pass_overall",
        action="store_true",
        help="Run queries per pass experiment with overall flag",
    )
    arg_parser.add_argument(
        "--determinism_check",
        action="store_true",
        help="Run determinism check",
    )
    arg_parser.add_argument(
        "--no_instrumentation_determinism_check",
        action="store_true",
        help="Run no instrumentation determinism check",
    )
    arg_parser.add_argument(
        "--all",
        action="store_true",
        help="Run for all benchmarks",
    )
    arg_parser.add_argument(
        "--opt-flag",
        type=str,
        default="O3",
        help="Optimization flag",
    )
    arg_parser.add_argument(
        "--all-experiments",
        action="store_true",
        help="Run all experiments",
    )

    with open("AAInstrumentation/config.txt", "r") as config_file:
        args = arg_parser.parse_args(config_file.read().splitlines() + sys.argv[1:])

    if (
        sum(
            [
                args.optimization,
                args.unique_hashes,
                args.maximal_relaxation,
                args.queries_per_pass,
                args.queries_per_pass_overall,
                args.determinism_check,
                args.no_instrumentation_determinism_check,
                args.all_experiments,
            ]
        )
        > 1
    ):
        print(
            "Please specify only one of the following flags: --optimization, --unique_hashes, --maximal_relaxation, --queries_per_pass, --queries_per_pass_overall, --determinism_check, --no-instrumentation-determinism-check, --all-experiments"
        )
        exit(1)

    instr_path = args.instr_path
    exec_root = args.exec_root
    specbuild_dir = args.specbuild_dir
    benchmark = args.benchmark
    initial_dir = args.initial_dir
    instr_dir = args.instr_dir
    groundtruth_dir = args.groundtruth_dir

    if not args.all:
        benchmarks = [benchmark]

    if args.all_experiments:
        args.optimization = True
        args.unique_hashes = True
        args.maximal_relaxation = True
        args.queries_per_pass = True
        args.determinism_check = True
        args.no_instrumentation_determinism_check = True

    if args.optimization:
        run_optimization_experiment(
            instr_path,
            exec_root,
            specbuild_dir,
            initial_dir,
            instr_dir,
            groundtruth_dir,
            args.opt_flag,
            args.proc_count,
            benchmarks,
        )

    if args.unique_hashes:
        run_unique_hashes_experiment(
            instr_path,
            exec_root,
            specbuild_dir,
            initial_dir,
            instr_dir,
            groundtruth_dir,
            args.opt_flag,
            args.proc_count,
            benchmarks,
        )

    if args.maximal_relaxation:
        run_maximal_relaxation_experiment(
            instr_path,
            exec_root,
            specbuild_dir,
            initial_dir,
            instr_dir,
            groundtruth_dir,
            args.opt_flag,
            args.proc_count,
            benchmarks,
        )

    if args.queries_per_pass:
        run_queries_per_pass_experiment(
            instr_path,
            exec_root,
            specbuild_dir,
            initial_dir,
            instr_dir,
            groundtruth_dir,
            args.opt_flag,
            args.proc_count,
            benchmarks,
        )

    if args.queries_per_pass_overall:
        run_queries_per_pass_experiment(
            instr_path,
            exec_root,
            specbuild_dir,
            initial_dir,
            instr_dir,
            groundtruth_dir,
            args.opt_flag,
            args.proc_count,
            benchmarks,
            overall=True,
        )

    if args.determinism_check:
        run_determinism_check(
            instr_path,
            exec_root,
            specbuild_dir,
            initial_dir,
            instr_dir,
            groundtruth_dir,
            args.opt_flag,
            args.proc_count,
            benchmarks,
        )

    if args.no_instrumentation_determinism_check:
        run_no_instrumentation_determinism_check(
            instr_path,
            exec_root,
            specbuild_dir,
            initial_dir,
            instr_dir,
            groundtruth_dir,
            args.opt_flag,
            args.proc_count,
            benchmarks,
        )
