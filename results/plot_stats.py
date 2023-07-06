from parse_stats import parse_stats

import matplotlib.pyplot as plt
import numpy as np
import ast


light_gray = "#cacaca"
dark_gray = "#827b7b"
light_blue = "#a6cee3"
dark_blue = "#1f78b4"
light_green = "#b2df8a"
dark_green = "#33a02c"
light_red = "#fb9a99"
dark_red = "#e31a1c"
black = "#000000"
white = "#ffffff"

opt_flag = "Oz"


def filter_non_changes(res_dict):
    filtered_dict = {}
    for f in res_dict:
        filtered_dict[f] = {}
        for func in res_dict[f]:
            if res_dict[f][func][0]:
                filtered_dict[f][func] = res_dict[f][func]

    return filtered_dict


def zip_dicts(query_dict, counts_dict):
    res_dict = {}
    for f in query_dict:
        curr_counts = counts_dict[f]
        for func in query_dict[f]:
            curr_count = curr_counts[func]
            if not f in res_dict:
                res_dict[f] = {}
            res_dict[f][func] = (query_dict[f][func][0], curr_count)

    return res_dict


def flatten_dict(res_dict):
    final_dict = {}
    count = 0
    for f in res_dict:
        for func in res_dict[f]:
            final_dict[count] = res_dict[f][func]
            count += 1

    return final_dict


def plot_comparison(res_dict):
    values = list(res_dict.values())
    values = [x for x in values if len(x[0])]
    relevant_query_counts = [len(x[0]) for x in values]
    total_query_counts = [x[1] for x in values]

    x = np.arange(len((values)))

    width = 0.7  # the width of the bars
    fig, ax = plt.subplots()
    rects1 = ax.bar(
        x,
        total_query_counts,
        width,
        facecolor=white,
        edgecolor=black,
        linestyle="dashed",
    )
    rects2 = ax.bar(x, relevant_query_counts, width, color=light_blue)

    ax.set_yscale("log")

    return plt


def print_relevant_query_stats(benchmark: str):
    query_dict, counts_dict = parse_stats(
        "results/stats/" + opt_flag + "/stats_" + benchmark + ".txt"
    )
    res_dict = zip_dicts(query_dict, counts_dict)
    flat_dict = flatten_dict(res_dict)
    values = list(flat_dict.values())
    total_queries = sum([x[1] for x in values])
    total_relevant_queries = sum([len(x[0]) for x in values])
    print(
        "Total queries: "
        + str(total_queries)
        + " Relevant queries: "
        + str(total_relevant_queries)
        + " Ratio: "
        + str(total_relevant_queries / total_queries)
    )

    relevant_values = [x for x in values if len(x[0])]
    print(
        "Filtered functions: "
        + str(len(values) - len(relevant_values))
        + " of "
        + str(len(values))
        + " Ratio: "
        + str((len(values) - len(relevant_values)) / len(values))
    )

    # relevant_query_counts = [len(x[0]) for x in relevant_values]
    # total_query_counts = [x[1] for x in relevant_values]

    # for rel, tot in zip(relevant_query_counts, total_query_counts):
    #    print(
    #        "Relevant: "
    #        + str(rel)
    #        + " Total: "
    #        + str(tot)
    #        + " Ratio: "
    #        + str(rel / tot)
    #    )


def print_biggest_change(benchmark: str):
    change_dict = parse_change_dict(
        "results/stats/" + opt_flag + "/stats_" + benchmark + ".txt"
    )
    changes = list(change_dict.values())
    flat_changes = [item for sublist in changes for item in sublist]
    print("biggest change of a query: " + str(max(flat_changes)))


def print_biggest_first_change(benchmark: str):
    change_dict = parse_change_dict(
        "results/stats/" + opt_flag + "/stats_" + benchmark + ".txt"
    )
    changes = [v[0] for v in change_dict.values()]
    func = ""
    for f in change_dict:
        if max(changes) in change_dict[f]:
            func = f
            break
    print("biggest change of a first query: " + str(max(changes)) + " in " + func)


def parse_change_dict(file_name: str):
    with open(file_name, "r") as f:
        for line in f.readlines():
            if line.startswith("change per query: "):
                dict_line = line.split("change per query: ")[1].strip()
                return ast.literal_eval(dict_line)


def parse_sizes(file_name: str):
    with open(file_name, "r") as f:
        for line in f.readlines():
            if line.startswith("sizes per file: "):
                dict_line = line.split("sizes per file: ")[1].strip()
                return ast.literal_eval(dict_line)


def parse_total_sizes(file_name: str):
    with open(file_name, "r") as f:
        for line in f.readlines():
            if line.startswith("result: "):
                size_line = line.split("result: ")[1].strip()
                return int(size_line.split(" ")[0].strip()), int(
                    size_line.split(" ")[2].strip()
                )


def parse_counts_dict(file_name: str):
    with open(file_name, "r") as f:
        for line in f.readlines():
            if line.startswith("counts per function per file: "):
                dict_line = line.split("counts per function per file: ")[1].strip()
                return ast.literal_eval(dict_line)


def print_relevant_size_stats(benchmark: str):
    size_dict = parse_sizes(
        "results/stats/" + opt_flag + "/stats_" + benchmark + ".txt"
    )
    new_size, old_size = parse_total_sizes(
        "results/stats/" + opt_flag + "/stats_" + benchmark + ".txt"
    )
    print(
        "New size: "
        + str(new_size)
        + " Old size: "
        + str(old_size)
        + " Difference: "
        + str(old_size - new_size)
        + " Ratio: "
        + str((old_size - new_size) / old_size)
    )

    possible_reduction = sum([size_dict[f][1] - size_dict[f][0] for f in size_dict])
    print("Possible reduction: " + str(possible_reduction))

    # relevant_size_dict = {}
    # for f in difference_dict:
    #    if difference_dict[f]:
    #        relevant_size_dict[f] = difference_dict[f]

    # for f in sorted(relevant_size_dict, key=lambda x: relevant_size_dict[x]):
    #    print(f + ": " + str(relevant_size_dict[f]))


def print_influence_small_func(benchmark: str, threshold=10):
    query_dict, counts_dict = parse_stats(
        "results/stats/" + opt_flag + "/stats_" + benchmark + ".txt"
    )
    size_dict = parse_change_dict(
        "results/stats/" + opt_flag + "/stats_" + benchmark + ".txt"
    )

    size_dict = {f: sum([x[0] for x in size_dict[f]]) for f in size_dict}
    query_and_size_per_function = {}
    func_count = {}
    for f in counts_dict:
        for func in counts_dict[f]:
            size_diff = size_dict.get(func, 0)
            queries = counts_dict[f][func]
            query_and_size_per_function[func + "_" + str(func_count.get(func, 0))] = (
                queries,
                size_diff,
            )
            func_count[func] = func_count.get(func, 0) + 1

    print("Total functions: " + str(len(query_and_size_per_function)))
    smaller_functions = {
        f: query_and_size_per_function[f]
        for f in query_and_size_per_function
        if query_and_size_per_function[f][0] <= threshold
    }
    print(
        "Functions with less than "
        + str(threshold)
        + " queries: "
        + str(len(smaller_functions))
    )
    print("Possible reduction: " + str(sum([x[1] for x in smaller_functions.values()])))


def plot_query_distribution(benchmarks: list):
    functions = {}
    func_count = {}
    for benchmark in benchmarks:
        query_dict, counts_dict = parse_stats(
            "results/stats/" + opt_flag + "/stats_" + benchmark + ".txt"
        )
        for file in counts_dict:
            for func in counts_dict[file]:
                if not func in functions:
                    functions[func] = counts_dict[file][func]
                    continue
                functions[func + "_" + str(func_count.get(func, 0))] = counts_dict[
                    file
                ][func]
                func_count[func] = func_count.get(func, 0) + 1

    print("Total functions: " + str(len(functions)))

    count_smaller_queries = len([x for x in functions.values() if x <= 10])
    print(
        "Less than 10 queries: "
        + str(count_smaller_queries)
        + " meaning "
        + str(count_smaller_queries / len(functions))
        + " of all functions"
    )

    plt.figure(figsize=(10, 10))
    plt.xscale(value="log")
    values = list(functions.values())
    logbins = np.geomspace(min(values), max(values), 100)
    plt.hist(
        list(functions.values()),
        bins=logbins,
        color=light_blue,
        edgecolor=black,
        linewidth=1.2,
    )

    # draw a vertical line at the several percentiles
    for i in [70, 80, 90, 95]:
        plt.axvline(
            x=np.percentile(values, i),
            color=dark_blue,
            linestyle="dashed",
            linewidth=1.2,
        )

    plt.xlabel("Number of queries")
    plt.ylabel("Number of functions")
    plt.title("Distribution of queries per function")
    plt.savefig("results/aa_per_func.pdf")

    plt.show()


def parse_data(file: str):
    with open(file, "r") as f:
        counts = []
        lines = f.readlines()
        for line in lines:
            if line.startswith("{"):
                data = eval(line)
                pass_dicts = data.values()
                for pass_dict in pass_dicts:
                    counts.extend(pass_dict.values())

    return counts


def plot_query_per_pass_and_func(benchmarks: list):
    functions = {}
    func_count = {}
    for benchmark in benchmarks:
        query_dict, counts_dict = parse_stats(
            "results/stats/" + opt_flag + "/stats_" + benchmark + ".txt"
        )
        for file in counts_dict:
            for func in counts_dict[file]:
                if not func in functions:
                    functions[func] = counts_dict[file][func]
                    continue
                functions[func + "_" + str(func_count.get(func, 0))] = counts_dict[
                    file
                ][func]
                func_count[func] = func_count.get(func, 0) + 1

    counts = parse_data("aa_per_pass.txt")

    plt.figure(figsize=(10, 10))
    plt.xscale(value="log")
    # plt.yscale(value="log")
    values = counts
    logbins = np.geomspace(min(values), max(values), 50)
    plt.hist(
        [values, list(functions.values())],
        bins=logbins,
        color=[light_blue, light_green],
        edgecolor=black,
        linewidth=1.2,
    )

    percentiles = [80, 95]
    # draw a vertical line at the several percentiles
    for i in percentiles:
        plt.axvline(
            x=np.percentile(values, i),
            color=dark_blue,
            linestyle="dashed",
            linewidth=3,
        )

    # draw a vertical line at the several percentiles
    for i in percentiles:
        plt.axvline(
            x=np.percentile(list(functions.values()), i),
            color=dark_green,
            linestyle="dashed",
            linewidth=3,
        )

    plt.xlabel("Number of queries")
    plt.ylabel("Number of functions/passes")
    plt.title("Distribution of queries per function/pass")
    plt.legend(["Passes", "Functions"])
    plt.savefig("results/aa_per_func_and_pass.pdf")

    plt.show()


def plot_query_per_pass():
    counts = parse_data("aa_per_pass.txt")

    plt.figure(figsize=(10, 10))
    plt.xscale(value="log")
    plt.yscale(value="log")
    values = counts
    logbins = np.geomspace(min(values), max(values), 100)
    plt.hist(
        values,
        alpha=0.5,
        bins=logbins,
        color=light_blue,
        edgecolor=black,
        linewidth=1.2,
    )

    # draw a vertical line at the several percentiles
    for i in [70, 80, 90, 95]:
        plt.axvline(
            x=np.percentile(values, i),
            color=dark_blue,
            linestyle="dashed",
            linewidth=1.2,
        )

    plt.xlabel("Number of queries")
    plt.ylabel("Number of passes")
    plt.title("Distribution of queries per function")
    plt.savefig("results/aa_per_pass.pdf")

    plt.show()


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
if __name__ == "__main__":
    # for benchmark in benchmarks:
    #    print(benchmark)
    #    try:
    #        print_relevant_size_stats(benchmark)
    #        print_relevant_query_stats(benchmark)
    #        print_influence_small_func(benchmark, 20)
    #        # print_biggest_change(benchmark)
    #        # print_biggest_first_change(benchmark)
    #    except Exception as e:
    #        print(e)
    #        continue

    plot_query_per_pass_and_func(benchmarks)
