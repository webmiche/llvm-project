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


def plot_func_per_file(res_dict):
    func_per_file = {}
    for file_name, func_dict in res_dict.items():
        func_per_file[file_name.removeprefix("PosixPath('").removesuffix("')")] = list(
            func_dict.keys()
        )

    # plot number of functions per file
    ax = plt.figure(figsize=(6, 3)).gca()
    ax.yaxis.get_major_locator().set_params(integer=True)
    plt.xticks(
        ticks=range(len(func_per_file.keys())),
        labels=[x.split("/")[-1].split(".")[0] for x in func_per_file.keys()],
        rotation=45,
    )
    values = [len(x) for x in func_per_file.values()]
    plt.bar(range(len(func_per_file.keys())), values, color=light_blue, edgecolor=black)
    plt.xlabel("File")
    plt.ylabel("Number of functions")
    plt.title("Number of functions per file")
    plt.tight_layout()
    plt.savefig("results/func_per_file.pdf")
    plt.show()


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


def parse_dicts(file: str):
    with open(file, "r") as f:
        counts_per_pass = []
        lines = f.readlines()
        for line in lines:
            if line.startswith("{"):
                data = eval(line)
                counts_per_pass.append(data)

    return counts_per_pass


def parse_data(file: str):
    with open(file, "r") as f:
        counts_per_pass = []
        counts_per_file = []
        lines = f.readlines()
        for line in lines:
            if line.startswith("{"):
                data = eval(line)
                pass_dicts = data.values()
                for pass_dict in pass_dicts:
                    for pass_name, func_dict in pass_dict.items():
                        for func, value in func_dict.items():
                            counts_per_pass.append(value)

                for file_name, file_dict in data.items():
                    sum_file = 0
                    for pass_dict in file_dict.values():
                        for pass_value in pass_dict.values():
                            sum_file += pass_value
                    counts_per_file.append(sum_file)

    return counts_per_pass, counts_per_file


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
    counts_per_pass, counts_per_file = parse_data("aa_per_pass.txt")

    plt.figure(figsize=(20, 10))
    plt.xscale(value="log")
    plt.yscale(value="log")
    logbins = np.geomspace(1, max(counts_per_file), 50)
    values = [counts_per_pass, list(functions.values()), counts_per_file]
    for value, name in zip(values, ["Passes", "Functions", "Files"]):
        print(
            "Max per "
            + name
            + ": "
            + str(max(value))
            + " Number of "
            + name
            + ": "
            + str(len(value))
            + " sum: "
            + str(sum(value))
        )
    plt.hist(
        values,
        bins=logbins,
        color=[light_blue, light_green, light_red],
        edgecolor=black,
        linewidth=1.2,
    )
    plt.legend(["Passes", "Functions", "Files"])

    percentiles = [80, 95]
    colors = [dark_blue, dark_green, dark_red]
    for value, color in zip(values, colors):
        # draw a vertical line 80-percentile and label it
        for i in percentiles:
            plt.axvline(
                x=np.percentile(value, i),
                color=color,
                linestyle="dashed",
                linewidth=1.2,
            )
            plt.text(
                x=np.percentile(value, i),
                y=4000,
                s=str(i) + "-percentile",
                color=color,
                rotation=270,
            )

    plt.xlabel("Number of queries")
    plt.ylabel("Number of functions/passes/files")
    plt.title("Distribution of queries per function/pass/files")
    plt.savefig("results/aa_per_func_and_pass_and_file.pdf")

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


def plot_queries_per_passname():
    counts = parse_dicts("aa_per_pass.txt")
    counts_per_pass = {}
    for file_dict in counts:
        for file_name, pass_dict in file_dict.items():
            for pass_name, func_dict in pass_dict.items():
                original_pass_name = pass_name.removesuffix(pass_name.split("_")[-1])
                if not original_pass_name in counts_per_pass:
                    counts_per_pass[original_pass_name] = []
                counts_per_pass[original_pass_name].append(sum(func_dict.values()))

    pass_names = [
        "GVNPass_",
        "DSEPass_",
        "FunctionToLoopPassAdaptor_",
        "EarlyCSEPass_",
        "MemCpyOptPass_",
        "InstCombinePass_",
        "MergedLoadStoreMotionPass_",
        "JumpThreadingPass_",
        "LoopLoadEliminationPass_",
    ]
    for pass_name in pass_names:
        print(
            pass_name
            + ": "
            + str(sum(counts_per_pass[pass_name]))
            + " "
            + str(len(counts_per_pass[pass_name]))
        )
    colors = [
        light_blue,
        dark_blue,
        light_green,
        dark_green,
        light_red,
        dark_red,
        light_gray,
        dark_gray,
        black,
    ]
    # plot distribution per pass
    plt.figure(figsize=(20, 10))
    plt.xlim(1, 100000)
    plt.ylim(0.7, 10000)
    for i, pass_name in enumerate(pass_names):
        plt.xscale(value="log")
        plt.yscale(value="log")
        values = counts_per_pass[pass_name]
        logbins = np.geomspace(min(values), max(values), 50)
        plt.hist(
            values,
            bins=logbins,
            color=colors[i],
            edgecolor=black,
            linewidth=1.2,
        )
    plt.xlabel("Number of queries")
    plt.ylabel("Number of occurences")
    plt.legend(counts_per_pass.keys())
    plt.savefig("results/aa_per_passname.pdf")
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
    #        print_biggest_change(benchmark)
    #        print_biggest_first_change(benchmark)
    #    except Exception as e:
    #        print(e)
    #        continue

    # plot_query_per_pass_and_func(benchmarks)
    # plot_queries_per_passname()
    # plot_func_per_file(parse_counts_dict("results/stats/Oz/stats_605.txt"))
