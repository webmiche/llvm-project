from matplotlib import pyplot as plt
from pathlib import PosixPath

improvement = {
    "600": 0.915,
    "602": 0.361,
    "605": 1.917,
    "619": 0.149,
    "620": 0.113,
    "623": 0.135,
    "625": 0.609,
    "631": 0.985,
    "638": 0.622,
    "641": 0.510,
    "644": 0.796,
    "657": 1.480,
}

sizes = {
    "600": (1886792, 1904232),
    "602": (7829575, 7857959),
    "605": (17599, 17943),
    "619": (16055, 16079),
    "620": (1535741, 1537481),
    "623": (3564399, 3569243),
    "625": (400190, 402646),
    "631": (70709, 71413),
    "638": (1597920, 1607936),
    "641": (113903, 114487),
    "644": (152453, 153677),
    "657": (161253, 163677),
}

current_benchmarks = [
    "600",
    # "602",
    "605",
    "619",
    "620",
    # "623",
    # "625",
    "631",
    # "638",
    "641",
    "644",
    "657",
]


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

colors = [
    light_green,
    dark_green,
    light_blue,
    dark_blue,
    light_gray,
    light_red,
    dark_red,
]


def parse_sizes_new_style(file_name: str):
    with open(file_name, "r") as file:
        lines = file.readlines()
        curr_strat = ""
        size_dict = {"Oz": {}}
        for line in lines:
            if line.__contains__(" vs "):
                ozsize = int(line.split(" ")[-1])
                curr_size = int(line.split(" ")[-3])
                file_name = line.split(" ")[0]
                if file_name == "result:":
                    continue
                    file_name = "Whole program"
                size_dict[curr_strat][file_name] = curr_size
                if file_name not in size_dict["Oz"].keys():
                    size_dict["Oz"][file_name] = ozsize
            if line.__contains__("Running ") and not line.__contains__("pass"):
                curr_strat = line.removeprefix("Running ").split(" on ")[0]
                if curr_strat not in size_dict:
                    size_dict[curr_strat] = {}
            if line.__contains__("found results:"):
                curr_strat = "Overall"
                if curr_strat not in size_dict:
                    size_dict[curr_strat] = {}

    return size_dict


def parse_sizes_old(file_name: str):
    with open(file_name, "r") as file:
        lines = file.readlines()
        curr_strat = "Local Auto Tuner (Exh: 10)"
        size_dict = {"Oz": {}, curr_strat: {}}
        for line in lines:
            if line.__contains__(" vs "):
                ozsize = int(line.split(" ")[-1])
                currsize = int(line.split(" ")[-3])
                file_name = line.split(" ")[0]
                if file_name == "result:":
                    continue
                    file_name = "Whole program"
                if file_name not in size_dict["Oz"].keys():
                    size_dict["Oz"][file_name] = ozsize
                if file_name not in size_dict[curr_strat].keys():
                    size_dict[curr_strat][file_name] = currsize

    return size_dict


def check_oz_sizes(dict_1, dict_2):
    dict_1 = dict_1["Oz"]
    dict_2 = dict_2["Oz"]
    for file_name, size in dict_1.items():
        if dict_2[file_name] != size:
            print(
                f"Oz sizes for {file_name} do not match: {size} vs {dict_2[file_name]}"
            )


def unify_dicts(dict_1, dict_2):
    for curr_strat, func_dict in dict_1.items():
        if curr_strat not in dict_2:
            dict_2[curr_strat] = func_dict


def plot_sizes(size_per_strat: dict):
    plt.figure(figsize=(8, 4))
    plt.ylabel("Size decrease in %")
    # change font size
    plt.rcParams.update({"font.size": 12})
    # disable upper and right axis
    ax = plt.gca()
    ax.spines["right"].set_visible(False)
    ax.spines["top"].set_visible(False)

    for start, result_dict in size_per_strat.items():
        result_dict["Total"] = sum(result_dict.values())

    ozsizes = size_per_strat["Oz"]
    min_size = 0
    max_size = -1
    for strat, result_dict in size_per_strat.items():
        if strat == "Oz" or strat == "Overall":
            continue
        for benchmark_name, curr_size in result_dict.items():
            ozsize = ozsizes[benchmark_name]
            max_size = max(max_size, (curr_size - ozsize) / ozsize * 100)
            if max_size > 140:
                print(benchmark_name)

    print(max_size)
    print(min_size)

    strat_order = [
        "Imprecise",
        "Random 10000",
        "Local Auto Tuner (Exh: 10)",
        # "Overall",
    ]
    for i, strat in enumerate(strat_order):
        result_dict = size_per_strat[strat]
        sizes = []
        labels = []
        for benchmark_name, curr_size in result_dict.items():
            ozsize = ozsizes[benchmark_name]
            sizes.append((ozsize - curr_size) / ozsize * 100 - min_size)

        labels = list(result_dict.keys())
        width = 1
        pos_width = width * (len(size_per_strat.items()) + 1)
        position = range(0, len(labels) * pos_width, pos_width)

        # plot offset bars to avoid overlap
        plt.bar(
            [x + i * 1 - 1.5 for x in position],
            [max(0, x) for x in sizes],
            width=1,
            label=strat,
            color=colors[i],
            bottom=min_size,
        )

        # print values on top of the bars
        for x, y in zip([x + i * 1 - 1.5 for x in position], sizes):
            if y == -min_size:
                continue
            plt.text(
                x,
                max(0, y + min_size + 0.01),
                str(round(y + min_size, 1)),
                ha="center",
                fontsize=9,
            )
        plt.legend()
        # plt.title("Achieved size per strategy on " + benchmark_name)
        plt.xticks(position, labels, rotation=45)

    plt.legend()
    plt.tight_layout()
    plt.savefig("sizes_overall.pdf")


def reduce_dict(dict_1):
    new_dict = {}
    for curr_strat, func_dict in dict_1.items():
        new_dict[curr_strat] = sum(func_dict.values())

    return new_dict


def flip_dict(dict_1):
    new_dict = {}
    for benchmark, strat_dict in dict_1.items():
        for strat, size in strat_dict.items():
            if strat not in new_dict:
                new_dict[strat] = {}
            new_dict[strat][benchmark] = size

    return new_dict


if __name__ == "__main__":
    overall_size_dict = {}
    for benchmark in current_benchmarks:
        new_size_dict = parse_sizes_new_style(
            f"results/epyc-traces/Oz/random_results/3/gen_res_{benchmark}_first_strat.txt"
        )
        old_size_dict = parse_sizes_old(
            f"results/epyc-traces/Oz/full_alias/2/gen_res_{benchmark}_first_strat.txt"
        )
        check_oz_sizes(new_size_dict, old_size_dict)
        unify_dicts(old_size_dict, new_size_dict)
        benchmark_dict = reduce_dict(new_size_dict)
        overall_size_dict[benchmark] = benchmark_dict

    overall_size_dict = flip_dict(overall_size_dict)
    print(overall_size_dict)

    plot_sizes(overall_size_dict)
