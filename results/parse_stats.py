from pathlib import Path
import ast
import argparse


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


def parse_multi_results(f: Path):
    with open(f, "r") as file:
        lines = file.readlines()

        new_strat = ""
        curr_list = []
        strat_dict = {}
        strat_dict[""] = []

        for line in lines:
            if line.startswith("Track AA Queries"):
                new_strat = line.removeprefix("Track AA Queries ").strip()
                curr_list = []
            if line.__contains__(" vs ") and not line.startswith("result"):
                old_size = int(line.split(" ")[-1].strip())
                new_size = int(line.split(" ")[-3].strip())
                curr_list.append((old_size, new_size))

            if line.__contains__(" used "):
                num_compilations = int(line.split(" ")[-2].strip())
                strat_dict[new_strat] = curr_list, num_compilations

                new_strat = ""
                curr_list = []

        strat_dict[""] = curr_list, 0
        print(strat_dict)
    return strat_dict


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

    return total, time_per_step


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


def parse_sizes(f: Path):
    file_dict = {}
    with open(f, "r") as file:
        for l in file.readlines():
            if l.__contains__(" vs ") and not l.startswith("result"):
                file_dict[l.split(" ")[0].strip()[:-1]] = (
                    int(l.split(" ")[-3].strip()),
                    int(l.split(" ")[-1].strip()),
                )

    return file_dict


def parse_size_improvement(f: Path):
    old_size = 0
    new_size = 0
    with open(f, "r") as file:
        for l in file.readlines():
            if l.startswith("result:"):
                new_size = int(l.split(" ")[-1].strip())
                old_size = int(l.split(" ")[-3].strip())
                continue

    return old_size, new_size


def parse_change_per_query(f: Path, full_sizes: dict):
    file_sizes = dict(zip(full_sizes.keys(), [v[1] for v in full_sizes.values()]))

    change_per_query = {}
    curr_size = 0
    curr_file = ""
    curr_func = ""
    changed_size = -1
    with open(f, "r") as file:
        for l in file.readlines():
            if l.startswith("==== "):
                curr_func = l.split(" ")[-1].strip()
                curr_size = file_sizes[curr_file]
                continue

            if l.startswith("***** "):
                curr_file = l.split(" ")[-1].strip()
                curr_size = file_sizes[curr_file]
                continue

            if l.startswith("greedy search, new min:"):
                new_size = int(l.split(" ")[-1].strip())
                changed_size = curr_size - new_size
                curr_size = new_size
                continue

            if l.startswith("greedy search, current list: "):
                assert changed_size != -1
                new_element = l.split(" ")[-1].strip()[:-1]
                if new_element.startswith("["):
                    new_element = new_element[1:]
                if curr_func in change_per_query:
                    change_per_query[curr_func].append((changed_size, new_element))
                else:
                    change_per_query[curr_func] = [(changed_size, new_element)]
                changed_size = -1
                continue

    return change_per_query


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

opt_flag = "Oz"
if __name__ == "__main__":
    arg_parser = argparse.ArgumentParser()
    arg_parser.add_argument(
        "input_folder",
        type=str,
        help="folder containing the results",
        default="results/epyc-traces/Oz/full_alias/0/",
    )

    arg_parser.add_argument(
        "--opt_flag",
        type=str,
        help="optimization flag",
        default=opt_flag,
    )

    args = arg_parser.parse_args()

    curr_folder = Path(args.input_folder)
    stat_folder = Path("results/stats/" + args.opt_flag + "/")
    parse_multi_results(curr_folder.joinpath("multi_styles_605.txt"))

    # for benchmark in benchmarks:
    #    initial_file = curr_folder.joinpath("gen_res_" + benchmark + "_first_strat.txt")
    #    stat_file = stat_folder.joinpath("stats_" + benchmark + ".txt")
    #    try:
    #        query_dict, counts_dict = parse_stats(initial_file)
    #        file_dict = parse_sizes(initial_file)
    #        old_size, new_size = parse_size_improvement(initial_file)
    #        change_per_query = parse_change_per_query(initial_file, file_dict)
    #        with open(stat_file, "w") as f:
    #            f.write("counts per function per file: " + str(counts_dict) + "\n")
    #            f.write("found results: " + str(query_dict) + "\n")
    #            f.write("change per query: " + str(change_per_query) + "\n")
    #            f.write("sizes per file: " + str(file_dict) + "\n")
    #            f.write("result: " + str(old_size) + " vs " + str(new_size) + "\n")

    #    except Exception as e:
    #        print("failed: " + str(stat_file))
    #        print(e)
    #        continue

    # summed_time = 0.0
    # for benchmark in benchmarks:
    #    print(benchmark)
    #    try:
    #        strategy_dict = parse_file(
    #            curr_folder.joinpath("gen_res_" + benchmark + "_first_strat.txt")
    #        )
    #        total_time, time_per_steps = compute_time_per_step(strategy_dict)
    #        print("total time: " + str(total_time))
    #        print("time per step: " + str(time_per_steps))
    #        summed_time += float(total_time)
    #    except Exception as e:
    #        print("failed: " + str(benchmark))
    #        print(e)
    #        continue

    # print("summed time: " + str(summed_time))
