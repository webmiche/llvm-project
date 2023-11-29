import matplotlib.pyplot as plt
import numpy
import seaborn as sns
from multiprocessing import Pool
import numpy as np
import pandas as pd
from matplotlib.ticker import MaxNLocator

Ozsize = {
    "resize_prob": 4639,
    "insert_new_arc": 4639,
    "replace_weaker_arc": 4639,
    "price_out_impl": 4639,
    "suspend_impl": 4639,
    "refreshArcPointers": 4639,
    "refreshPositions": 4639,
    "marc_arcs": 4639,
    "calculate_max_redcost": 4639,
    "switch_arcs": 4639,
    "arc_compare": 4639,
    "read_min": 1790,
    "update_tree": 535,
    "write_circulations": 579,
    "refresh_neighbour_lists": 1652,
    "flow_cost": 1652,
    "getArcPosition": 1652,
    "flow_org_cost": 1652,
    "primal_feasible": 1652,
    "dual_feasible": 1652,
    "primal_iminus": 178,
    "main": 1239,
    "primal_update_flow": 95,
    "primal_bea_mpp": 781,
    "set_static_vars": 781,
    "cost_compare": 781,
    "markBaskets": 1812,
    "worker": 1812,
    "master": 1812,
    "primal_net_simplex": 1812,
    "primal_start_artificial": 319,
    "swapfunc": 1754,
    "spec_qsort": 1754,
}

exh0 = {
    "resize_prob": 4639,
    "insert_new_arc": 4635,
    "replace_weaker_arc": 4639,
    "price_out_impl": 4490,
    "suspend_impl": 4576,
    "refreshArcPointers": 4639,
    "refreshPositions": 4639,
    "marc_arcs": 4628,
    "calculate_max_redcost": 4639,
    "switch_arcs": 4636,
    "arc_compare": 4639,
    "read_min": 1727,
    "update_tree": 535,
    "write_circulations": 579,
    "refresh_neighbour_lists": 1652,
    "flow_cost": 1645,
    "getArcPosition": 1652,
    "flow_org_cost": 1642,
    "primal_feasible": 1652,
    "dual_feasible": 1652,
    "primal_iminus": 178,
    "main": 1239,
    "primal_update_flow": 95,
    "primal_bea_mpp": 779,
    "set_static_vars": 781,
    "cost_compare": 781,
    "markBaskets": 1812,
    "worker": 1812,
    "master": 1812,
    "primal_net_simplex": 1812,
    "primal_start_artificial": 297,
    "swapfunc": 1754,
    "spec_qsort": 1754,
}

exh13 = {
    "resize_prob": 4639,
    "insert_new_arc": 4635,
    "replace_weaker_arc": 4639,
    "price_out_impl": 4481,
    "suspend_impl": 4576,
    "refreshArcPointers": 4639,
    "refreshPositions": 4639,
    "marc_arcs": 4628,
    "calculate_max_redcost": 4639,
    "switch_arcs": 4636,
    "arc_compare": 4639,
    "read_min": 1727,
    "update_tree": 535,
    "write_circulations": 579,
    "refresh_neighbour_lists": 1652,
    "flow_cost": 1645,
    "getArcPosition": 1652,
    "flow_org_cost": 1642,
    "primal_feasible": 1652,
    "dual_feasible": 1652,
    "primal_iminus": 178,
    "main": 1239,
    "primal_update_flow": 95,
    "primal_bea_mpp": 779,
    "set_static_vars": 781,
    "cost_compare": 781,
    "markBaskets": 1812,
    "worker": 1812,
    "master": 1812,
    "primal_net_simplex": 1812,
    "primal_start_artificial": 297,
    "swapfunc": 1754,
    "spec_qsort": 1754,
}

imprecise_size = {
    "resize_prob": 4640,
    "insert_new_arc": 4635,
    "replace_weaker_arc": 4648,
    "price_out_impl": 4508,
    "suspend_impl": 4595,
    "refreshArcPointers": 4639,
    "refreshPositions": 4639,
    "marc_arcs": 4795,
    "calculate_max_redcost": 4639,
    "switch_arcs": 4641,
    "arc_compare": 4639,
    "read_min": 1904,
    "update_tree": 539,
    "write_circulations": 579,
    "refresh_neighbour_lists": 1652,
    "flow_cost": 1654,
    "getArcPosition": 1652,
    "flow_org_cost": 1653,
    "primal_feasible": 1652,
    "dual_feasible": 1652,
    "primal_iminus": 178,
    "main": 1239,
    "primal_update_flow": 95,
    "primal_bea_mpp": 790,
    "set_static_vars": 781,
    "cost_compare": 781,
    "markBaskets": 1812,
    "worker": 1819,
    "master": 1829,
    "primal_net_simplex": 1812,
    "primal_start_artificial": 297,
    "swapfunc": 1754,
    "spec_qsort": 1754,
}


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


def parse(file_name: str):
    with open(file_name, "r") as f:
        lines = f.readlines()
        counts_dict = {}
        distinct_counts = {}
        num_distinct_counts = {}
        deviations = {}
        curr_func = ""
        alias_queries = {}
        num_hashes_dict = {}
        curr_file = ""
        for line in lines:
            if line.startswith("Running") and not line.__contains__("pass"):
                curr_file = line.split(" on ")[1].strip()
            if line.startswith("==== Next function:"):
                curr_func = line.split()[3]
            if line.startswith("Number of AA Queries:"):
                alias_queries[curr_func] = int(line.split()[4])
            if line.startswith("Number of distinct counts:"):
                num_distinct_counts[curr_func] = int(line.split()[4])
            if line.startswith("Distinct counts:"):
                list_string = line.removeprefix("Distinct counts: ").strip()
                distinct_counts[curr_func] = eval(list_string)
            if line.startswith("Counts:"):
                list_string = line.removeprefix("Counts: ").strip()
                counts_dict[curr_func] = eval(list_string)
            if line.startswith("Deviation:"):
                deviations[curr_func] = float(line.split()[1])
            if line.startswith("Found hashes:") and not curr_file in num_hashes_dict:
                dict_string = line.removeprefix("Found hashes:").strip()
                num_hashes_dict[curr_file] = eval(dict_string)

        return (
            counts_dict,
            distinct_counts,
            deviations,
            alias_queries,
            num_distinct_counts,
            num_hashes_dict,
        )


def export_legend(legend, filename="legend.pdf"):
    fig = legend.figure
    fig.canvas.draw()
    bbox = legend.get_window_extent().transformed(fig.dpi_scale_trans.inverted())
    fig.savefig(filename, dpi="figure", bbox_inches=bbox)


def sampling_values(values, n: int) -> list[tuple[int, float]]:
    samples = np.random.choice(values, size=(10000, n))
    samples = samples.min(axis=1)
    return [(n, s) for s in samples]


def plot_counts(counts_dict, alias_queries):
    plt.figure(figsize=(16, 8))
    # increase font size
    plt.rcParams.update({"font.size": 22})
    for func_name in counts_dict.keys():
        # [
        #    "flow_cost",
        #    "arc_compare",
        #    "primal_bea_mpp",
        #    "price_out_impl",
        #    "read_min",
        #    "marc_arcs",
        # ]:  # counts_dict.keys():
        print("Plotting " + func_name)
        counts = np.array(counts_dict[func_name])

        sampling_range = range(1, 1000)
        with Pool() as pool:
            data = pool.starmap(sampling_values, [(counts, k) for k in sampling_range])
        # data = []
        # for k in sampling_range:
        #    samples = np.random.choice(counts, size=(1000, k))
        #    samples = samples.min(axis=1)

        ok = np.array(data).reshape(-1, 2)
        df = pd.DataFrame(ok, columns=["Amount of samples", "Bytes"])
        # add errorbars instead of stddev
        ax = sns.lineplot(x="Amount of samples", y="Bytes", data=df, errorbar="sd")
        ax.yaxis.set_major_locator(MaxNLocator(integer=True))
        # ax = sns.lineplot(x="Amount of samples", y="Bytes", data=df)

        num_queries = alias_queries[func_name]
        curr_ozsize = Ozsize[func_name]
        plt.hlines(
            curr_ozsize,
            0,
            len(counts),
            label="Oz",
            color=dark_blue,
            linestyles=(0, (5, 5)),
            linewidth=8,
            alpha=0.5,
        )
        num_exh0 = exh0[func_name]
        plt.hlines(
            num_exh0,
            0,
            len(counts),
            label="deterministic(0)",
            color=light_green,
            linestyles="solid",
            linewidth=4,
            alpha=0.7,
        )
        num_imprecise = imprecise_size[func_name]
        plt.hlines(
            num_imprecise,
            0,
            len(counts),
            label="imprecise",
            color=light_blue,
            linestyle="dashed",
            linewidth=4,
            alpha=0.5,
        )
        num_min_random = min(counts)
        plt.hlines(
            num_min_random,
            0,
            len(counts),
            label="random minimum",
            color=dark_blue,
            linestyle="dotted",
            linewidth=4,
            alpha=0.5,
        )
        plt.title(func_name + " (" + str(num_queries) + " queries)")
        plt.tight_layout()
        plt.savefig("plots/" + func_name + ".pdf")
        plt.clf()

    f = lambda m, c, ls: plt.plot([], [], marker=m, color=c, ls=ls)[0]
    handles = [
        f(None, dark_blue, (0, (5, 5))),
        f(None, light_blue, "dashed"),
        f(None, light_green, "solid"),
        f(None, dark_blue, "dotted"),
    ]
    plt.figure(figsize=(16, 8))
    plt.rcParams.update({"font.size": 22})
    legend = plt.legend(
        handles,
        [
            "Oz",
            "Fully Imprecise",
            "Local Autotuner",
            "Random Minimum",
        ],
        loc=3,
        framealpha=1,
        frameon=False,
    )
    export_legend(legend, "plots/legend.pdf")


def plot_dev(counts_dict, alias_queries):
    # set figure size to 10x10
    plt.figure(figsize=(16, 8))
    plt.rcParams.update({"font.size": 22})
    plt.title("Standard Deviation per Number of Queries")
    # disable upper and right axis
    ax = plt.gca()
    ax.spines["right"].set_visible(False)
    ax.spines["top"].set_visible(False)
    colors = [
        light_blue,
        light_green,
        light_red,
        dark_blue,
        dark_green,
    ]
    markers = ["o", "1", "2", "3", "X", "v", "s", "P"]
    # generate tuples of color and marker
    color_marker = [(c, m) for m in markers for c in colors]
    color_counter = 0
    for i, (func_name, counts) in enumerate(counts_dict.items()):
        curr_ozsize = Ozsize[func_name]
        dev = numpy.std([x - curr_ozsize for x in counts])
        if dev == 0:
            continue
        num_queries = alias_queries[func_name]
        plt.scatter(
            num_queries,
            dev / curr_ozsize * 100,
            label=func_name,
            color=color_marker[color_counter][0],
            marker=color_marker[color_counter][1],
            alpha=0.7,
            linewidths=20,
        )
        color_counter += 1
    plt.xlabel("Number of queries")
    plt.ylabel("Standard Deviation")
    # place legend below the plot, with three columns
    plt.legend(loc="upper center", bbox_to_anchor=(0.5, -0.2), ncol=3)

    # layout tight
    plt.tight_layout()
    plt.savefig("deviation.pdf")


def plot_hash_num(num_hashes_dict, alias_queries):
    print(num_hashes_dict)
    # set figure size to 10x10
    plt.figure(figsize=(16, 8))
    plt.rcParams.update({"font.size": 22})
    plt.title("Number of Unique Hashes per Number of Queries (10000 random sequences)")
    # disable upper and right axis
    ax = plt.gca()
    ax.spines["right"].set_visible(False)
    ax.spines["top"].set_visible(False)
    colors = [
        light_blue,
        light_green,
        light_red,
        dark_blue,
        dark_green,
    ]

    # flatten dict
    hashes_per_file = {}
    for func_name, num_hashes in num_hashes_dict.items():
        for file_name, num_hash in num_hashes.items():
            hashes_per_file[file_name] = num_hash

    markers = ["o", "1", "2", "3", "X", "v", "s", "P"]
    color_marker = [(c, m) for m in markers for c in colors]
    color_counter = 0
    plt.yscale("log")
    for i, (func_name, num_hashes) in enumerate(hashes_per_file.items()):
        num_queries = alias_queries[func_name]
        if num_hashes == 1:
            continue
        plt.scatter(
            num_queries,
            num_hashes,
            label=func_name,
            alpha=0.7,
            linewidths=20,
            color=color_marker[color_counter][0],
            marker=color_marker[color_counter][1],
        )
        color_counter += 1
    plt.xlabel("Number of Queries")
    plt.ylabel("Number of Unique Hashes")
    plt.legend(loc="upper center", bbox_to_anchor=(0.5, -0.2), ncol=3)
    plt.tight_layout()
    plt.savefig("hashes.pdf")


if __name__ == "__main__":
    (
        counts_dict,
        distinct_counts,
        deviations,
        alias_queries,
        num_distinct_counts,
        num_hashes_dict,
    ) = parse("tmp_605_oz_actuall_10000.txt")

    # plot_counts(counts_dict, alias_queries)
    plot_hash_num(num_hashes_dict, alias_queries)
    # plot_dev(counts_dict, alias_queries)
