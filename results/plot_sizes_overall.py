from matplotlib import pyplot as plt

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


def plot_sizes():
    # plot sizes in a bar plot
    plt.figure(figsize=(10, 6))
    plt.ylabel("Size decrease in %")
    # disable upper and right axis
    ax = plt.gca()
    ax.spines["right"].set_visible(False)
    ax.spines["top"].set_visible(False)

    # add up sizes for total value
    total_sizes = 0, 0
    for size in sizes.values():
        total_sizes = total_sizes[0] + size[0], total_sizes[1] + size[1]

    sizes["Total"] = total_sizes

    values = [(size[1] - size[0]) / size[1] * 100 for size in sizes.values()]
    plt.bar(
        list(sizes.keys()),
        values,
        color=light_blue,
    )

    # add text labels
    for i, v in enumerate(values):
        plt.text(i - 0.35, v + 0.02, f"{v:.2f}%", color=black)

    plt.title("Size decrease for different programs (Autotuner vs. Oz)")
    plt.savefig("results/sizes_overall.png")


if __name__ == "__main__":
    plot_sizes()
