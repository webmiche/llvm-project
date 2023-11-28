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


def parse_dicts(file: str):
    with open(file, "r") as f:
        counts_per_pass = {}
        lines = f.readlines()
        for line in lines:
            if line.startswith("{"):
                data = eval(line)
                counts_per_pass[curr_benchmark] = data
            else:
                curr_benchmark = line.split("\n")[0]

    return counts_per_pass


def convert_to_latex_table(queries):
    latex_string = "\hline \n"
    latex_string += "Benchmark & Pass & Queries \\\\ \n"
    latex_string += "\hline \n"
    pass_names = [
        "InstCombinePass_",
        "EarlyCSEPass_",
        "FunctionToLoopPassAdaptor_",
        "DSEPass_",
        "MemCpyOptPass_",
        "SLPVectorizerPass_",
        "LoopVectorizePass_",
        "LoopLoadEliminationPass_",
        "JumpThreadingPass_",
        "MergedLoadStoreMotionPass_",
        "SROAPass_",
    ]
    benchmark_names = [
        "600",
        "602",
        "605",
        "619",
        "620",
        "623",
        "625",
        "631",
        "638",
        "641",
        "644",
        "657",
    ]
    for benchmark in benchmark_names:
        file_dict = queries[benchmark]
        num_lines = 0
        pass_string = ""
        for pass_name in pass_names:
            if not pass_name in file_dict:
                continue
            pass_dict = file_dict[pass_name]
            num_lines += 1
            pass_string += (
                " & "
                + pass_name.removesuffix("_")
                + " & "
                + str(sum(pass_dict.values()))
                # + " & "
                # + str(len(pass_dict.keys()))
                + " \\\\ \n"
            )
        pass_string += "\hline \n"
        latex_string += (
            "\multirow{" + str(num_lines) + "}{*}{" + benchmark + "}" + pass_string
        )

    return latex_string


def convert_both_to_latex_table(o3_queries, oz_queries):
    latex_string = "\hline \n"
    latex_string += "Benchmark & Pass & O3 Queries & Oz Queries \\\\ \n"
    latex_string += "\hline \n"
    pass_names = [
        "GVNPass_",
        "InstCombinePass_",
        "EarlyCSEPass_",
        "FunctionToLoopPassAdaptor_",
        "DSEPass_",
        "MemCpyOptPass_",
        "SLPVectorizerPass_",
        "LoopVectorizePass_",
        "LoopLoadEliminationPass_",
        "JumpThreadingPass_",
        "MergedLoadStoreMotionPass_",
        "SROAPass_",
    ]
    benchmark_names = [
        "600",
        "602",
        "605",
        "619",
        "620",
        "623",
        "625",
        "631",
        "638",
        "641",
        "644",
        "657",
    ]
    for benchmark in benchmark_names:
        file_dict_o3 = o3_queries[benchmark]
        file_dict_oz = oz_queries[benchmark]
        num_lines = 0
        pass_string = ""
        for pass_name in pass_names:
            oz_counts = file_dict_oz.get(pass_name, {"x": 0})
            o3_counts = file_dict_o3.get(pass_name, {"x": 0})

            num_lines += 1
            num_o3 = sum(o3_counts.values())
            num_oz = sum(oz_counts.values())
            num_o3 = "{:,}".format(num_o3).replace(",", "'")
            num_oz = "{:,}".format(num_oz).replace(",", "'")
            pass_string += (
                " & "
                + pass_name.removesuffix("_")
                + " & "
                + num_o3
                + " & "
                + num_oz
                # + " & "
                # + str(len(pass_dict.keys()))
                + " \\\\ \n"
            )
        pass_string += "\hline \n"
        latex_string += (
            "\multirow{" + str(num_lines) + "}{*}{" + benchmark + "}" + pass_string
        )
        for pass_name in file_dict_o3:
            if pass_name not in pass_names:
                print(pass_name)
        for pass_name in file_dict_oz:
            if pass_name not in pass_names:
                print(pass_name)

    return latex_string


def combine_passes(counts):
    combined_counts = {}
    for benchmark, file_dict in counts.items():
        combined_dict = {}
        for file_name, pass_dict in file_dict.items():
            for pass_name, func_dict in pass_dict.items():
                original_pass_name = pass_name.removesuffix(pass_name.split("_")[-1])
                if not original_pass_name in combined_dict:
                    combined_dict[original_pass_name] = {}
                for func_name, count in func_dict.items():
                    if not func_name in combined_dict[original_pass_name]:
                        combined_dict[original_pass_name][func_name] = 0
                    combined_dict[original_pass_name][func_name] += count
        combined_counts[benchmark] = combined_dict

    return combined_counts


def plot_queries_per_passname(counts):
    counts_per_pass = {}
    for file_dict in counts:
        for file_name, pass_dict in file_dict.items():
            for pass_name, func_dict in pass_dict.items():
                original_pass_name = pass_name.removesuffix(pass_name.split("_")[-1])
                if not original_pass_name in counts_per_pass:
                    counts_per_pass[original_pass_name] = []
                counts_per_pass[original_pass_name].append(sum(func_dict.values()))

    for pass_name in counts_per_pass.keys():
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
        white,
    ]
    # plot distribution per pass
    plt.figure(figsize=(20, 10))
    # plt.xlim(1, 100000)
    # plt.ylim(0.7, 10000)
    for i, pass_name in enumerate(counts_per_pass.keys()):
        plt.xscale(value="log")
        plt.yscale(value="log")
        values = counts_per_pass[pass_name]
        logbins = np.geomspace(min(values), max(values), 50)
        plt.hist(
            values,
            bins=logbins,
            color=colors[i % 9],
            edgecolor=black,
            linewidth=1.2,
        )
    plt.xlabel("Number of queries")
    plt.ylabel("Number of occurences")
    plt.legend(counts_per_pass.keys())
    plt.savefig("results/aa_per_passname.pdf")
    plt.show()


if __name__ == "__main__":
    o3_dict = parse_dicts("tmp_all_O3_aa_per_pass.txt")
    oz_dict = parse_dicts("aa_per_pass.txt")
    combined_o3_dict = combine_passes(o3_dict)
    combined_oz_dict = combine_passes(oz_dict)
    print(convert_both_to_latex_table(combined_o3_dict, combined_oz_dict))
