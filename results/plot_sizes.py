from matplotlib import pyplot as plt
import numpy
import math


def parse_sizes(file_name: str):
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

    # size_per_file = {}
    # for strat, result_list in size_dict.items():
    #    for file_name, curr_size, ozsize in result_list:
    #        if file_name == "result:":
    #            file_name = "Whole program"
    #        if file_name not in size_per_file:
    #            size_per_file[file_name] = []
    #        size_per_file[file_name].append((strat, curr_size))
    #        if "oz" not in [x[0] for x in size_per_file[file_name]]:
    #            size_per_file[file_name].append(("Oz", ozsize))

    return size_dict


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


def plot_sizes(size_per_file):
    print(size_per_file)
    plt.figure(figsize=(8, 4))
    plt.ylabel("Size decrease in %")
    # disable upper and right axis
    ax = plt.gca()
    ax.spines["right"].set_visible(False)
    ax.spines["top"].set_visible(False)

    for start, result_dict in size_per_file.items():
        print(start, result_dict)
        result_dict["Total"] = sum(result_dict.values())
        print(start, result_dict)

    ozsizes = size_per_file["Oz"]
    min_size = 0
    max_size = -1
    for strat, result_dict in size_per_file.items():
        for file_name, curr_size in result_dict.items():
            ozsize = ozsizes[file_name]
            max_size = max(max_size, (curr_size - ozsize) / ozsize * 100)

    print(max_size)
    print(min_size)

    # take only interesting files
    interesting_files = [
        "605/implicit.bc:",
        "605/readmin.bc:",
        "605/pbeampp.bc:",
        "605/pstart.bc:",
        "Total",
    ]
    for strat, result_dict in size_per_file.items():
        size_per_file[strat] = {
            file_name: curr_size
            for file_name, curr_size in result_dict.items()
            if file_name in interesting_files
        }

    print(size_per_file)

    plt.ylim(bottom=min_size, top=max_size + 1)
    benchmark_name = ""
    strat_order = [
        "Imprecise",
        "Random 10000",
        "Deterministic (Exh: 13)",
        "Overall",
    ]
    for i, strat in enumerate(strat_order):
        result_dict = size_per_file[strat]
        sizes = []
        labels = []
        total_size = 0
        for file_name, curr_size in result_dict.items():
            ozsize = ozsizes[file_name]
            sizes.append((ozsize - curr_size) / ozsize * 100 - min_size)
            total_size += curr_size
            labels.append(file_name.split("/")[-1].split(".")[0])
            if benchmark_name == "":
                benchmark_name = file_name.split("/")[0]

        width = 1
        pos_width = width * (len(size_per_file.items()) + 1)
        position = range(0, len(labels) * pos_width, pos_width)

        # plot offset bars to avoid overlap
        plt.bar(
            [x + i * 1 - 1.5 for x in position],
            [max(0, x) for x in sizes],
            width=1,
            label=strat if not strat == "Deterministic (Exh: 0)" else "Local Autotuner",
            color=colors[i],
            bottom=min_size,
        )

        # print values on top of the bars
        for x, y in zip([x + i * 1 - 1.5 for x in position], sizes):
            if y == -min_size:
                continue
            plt.text(
                x,
                max(0, y + min_size) + 0.1,
                str(round(y + min_size, 1)),
                ha="center",
                fontsize=9,
            )
        plt.legend()
        # plt.title("Achieved size per strategy on " + benchmark_name)
        plt.xticks(position, labels, rotation=45)
        plt.savefig("sizes_" + benchmark_name + "_" + str(i) + ".pdf")

    plt.legend()
    plt.tight_layout()
    plt.savefig("sizes_" + benchmark_name + ".pdf")


if __name__ == "__main__":
    size_dict = parse_sizes("tmp_605_random_deter_all.txt")
    print(size_dict)

    plot_sizes(size_dict)
