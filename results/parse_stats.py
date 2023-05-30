from pathlib import Path
import ast


def parse_file(f: Path):
    # time per step per function per file per strategy
    strategy_dict = {}
    with open(f, "r") as file:
        lines = file.readlines()
        curr_strategy = ""
        file_dict = {}
        curr_file = ""
        function_dict = {}
        curr_func = ""
        step_dict = {}
        curr_step = ""
        curr_time = 0.0
        for line in lines:
            if line.startswith("*****"):
                if curr_file != "":
                    file_dict[curr_file] = function_dict
                function_dict = {}
                curr_file = line.split(" ")[-1].strip()
                continue
            if line.startswith("==== "):
                if curr_func != "":
                    function_dict[curr_func] = step_dict
                step_dict = {}
                curr_func = line.split(" ")[-1].strip()
                continue
            if line.startswith("greedy search"):
                if line.__contains__("after"):
                    full_time = float(line.split(" ")[-1].strip())
                    curr_step = line.split("after")[1].split(" ")[1].strip()
                    iteration_count = line.split(" ")[-3].strip()
                    if curr_step != "step":
                        step_dict[curr_step + " " + iteration_count] = (
                            full_time - curr_time
                        )
                    curr_time = full_time
                continue
            if line.startswith("exhaustive search"):
                if line.__contains__("after"):
                    full_time = float(line.split(" ")[-1].strip())
                    curr_step = line.split("after")[1].split(" ")[1].strip()
                    step_dict[curr_step] = full_time - curr_time
                    curr_time = full_time
                continue

            if line.startswith("Track AA"):
                if curr_strategy != "":
                    strategy_dict[curr_strategy] = file_dict
                file_dict = {}
                curr_strategy = line.split(" ")[-1].strip()

            if line.startswith("Time") or line.startswith("time"):
                curr_time = float(line.split(" ")[-1].strip())

        function_dict[curr_func] = step_dict
        file_dict[curr_file] = function_dict
        strategy_dict[curr_strategy] = file_dict
    return strategy_dict


def compute_time_per_step(strategy_dict):
    # compute time per step
    total = 0.0
    time_per_step = {}
    for strategy in strategy_dict:
        for f in strategy_dict[strategy]:
            for func in strategy_dict[strategy][f]:
                for step in strategy_dict[strategy][f][func]:
                    curr_step = step.split(" ")[0]
                    # curr_step = step
                    total += strategy_dict[strategy][f][func][step]
                    if curr_step in time_per_step:
                        time_per_step[curr_step] = (
                            time_per_step[curr_step]
                            + strategy_dict[strategy][f][func][step]
                        )
                    else:
                        time_per_step[curr_step] = strategy_dict[strategy][f][func][
                            step
                        ]

    print(total)
    print(time_per_step)


def parse_nested_dict(string: str):
    res_dict = {}
    key = ""
    for substring in string.split("{"):
        for substring in substring.split("}"):
            if key == "":
                key = substring.split(":")[0].strip()
                if key.startswith(","):
                    key = key.split(",")[1].strip()
                continue
            res_dict[key] = ast.literal_eval("{" + substring + "}")
            key = ""
    return res_dict


def parse_res_queries(file_name: Path):
    with open(file_name, "r") as f:
        for line in f.readlines():
            if line.startswith("found results: "):
                dict_line = line.split("found results: ")[1].strip()
                return parse_nested_dict(dict_line)


def parse_counts_per_file(file_name: Path):
    with open(file_name, "r") as f:
        for line in f.readlines():
            if line.startswith("counts per function per file: "):
                dict_line = line.split("counts per function per file: ")[1].strip()
                return parse_nested_dict(dict_line)


def parse_stats(f: Path):
    query_dict = parse_res_queries(f)
    counts_dict = parse_counts_per_file(f)
    return query_dict, counts_dict


benchmarks = [
    "619",
    "605",
    "631",
    "641",
    "644",
    "623",
    "657",
    "625",
    "620",
    "600",
    "638",
    "602",
]
if __name__ == "__main__":
    curr_folder = Path("results/epyc-traces/5/")
    # stat_folder = Path("results/stats/")
    # for benchmark in benchmarks:
    #    initial_file = curr_folder.joinpath("gen_res_" + benchmark + "_first_strat.txt")
    #    stat_file = stat_folder.joinpath("stats_" + benchmark + ".txt")
    #    try:
    #        query_dict, counts_dict = parse_stats(initial_file)
    #        with open(stat_file, "w") as f:
    #            f.write("counts per function per file: " + str(counts_dict) + "\n")
    #            f.write("found results: " + str(query_dict) + "\n")

    #    except Exception as e:
    #        print("failed: " + str(f))
    #        print(e)
    #        continue

    for benchmark in benchmarks:
        print(benchmark)
        try:
            strategy_dict = parse_file(
                curr_folder.joinpath("gen_res_" + benchmark + "_first_strat.txt")
            )
            compute_time_per_step(strategy_dict)
        except Exception as e:
            print("failed: " + str(benchmark))
            print(e)
            continue
