import matplotlib.pyplot as plt


results = {
    "best subsequences": (
        [
            (4639, 4403),
            (1790, 1727),
            (535, 535),
            (579, 579),
            (1652, 1635),
            (178, 178),
            (1239, 1239),
            (95, 95),
            (781, 772),
            (1812, 1812),
            (319, 297),
            (1754, 1754),
        ],
        0,
    ),
    "Random with 100 samples": (
        [
            (4639, 4561),
            (1790, 1857),
            (535, 535),
            (579, 579),
            (1652, 1642),
            (178, 178),
            (1239, 1239),
            (95, 95),
            (781, 782),
            (1812, 1812),
            (319, 297),
            (1754, 1754),
        ],
        98,
    ),
    "Deterministic": (
        [
            (4639, 4409),
            (1790, 1727),
            (535, 535),
            (579, 579),
            (1652, 1635),
            (178, 178),
            (1239, 1239),
            (95, 95),
            (781, 779),
            (1812, 1812),
            (319, 300),
            (1754, 1754),
        ],
        3790,
    ),
    "Random with 3790 samples": (
        [
            (4639, 4407),
            (1790, 1816),
            (535, 535),
            (579, 579),
            (1652, 1635),
            (178, 178),
            (1239, 1239),
            (95, 95),
            (781, 772),
            (1812, 1812),
            (319, 297),
            (1754, 1754),
        ],
        1731,
    ),
    "Genetic with 1 generation exponent": (
        [
            (4639, 4517),
            (1790, 1795),
            (535, 535),
            (579, 579),
            (1652, 1642),
            (178, 178),
            (1239, 1239),
            (95, 95),
            (781, 772),
            (1812, 1812),
            (319, 297),
            (1754, 1754),
        ],
        3381,
    ),
}

names = [
    "implicit.bc",
    "readmin.bc",
    "treeup.bc",
    "output.bc",
    "mcfutil.bc",
    "pbla.bc",
    "mcf.bc",
    "pflowup.bc",
    "pbeampp.bc",
    "psimplex.bc",
    "pstart.bc",
    "spec_qsort/spec_qsort.bc",
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
    light_blue,
    light_green,
    light_red,
    dark_green,
    light_gray,
    dark_blue,
    dark_red,
    dark_gray,
]


def plot():
    plt.figure(figsize=(10, 5))
    plt.title("Comparison of different styles for 605")
    plt.xlabel("Number of samples")
    plt.ylabel("Difference (in %)")

    x_values = []
    for i in range(1, 13):
        x_values.append(i * 7)

    plt.xticks(x_values, names, rotation=45)

    for i, (style, data) in enumerate(results.items()):
        sizes = [(i[0] - i[1]) / i[0] for i in data[0]]
        compilations = data[1]
        plt.bar(
            [x + i - 3 for x in x_values],
            sizes,
            label=style
            + (f" ({compilations} compilations)" if compilations > 0 else ""),
            color=colors[i],
        )

    plt.legend()
    plt.savefig("results/plot_multi_styles.pdf")
    plt.show()


if __name__ == "__main__":
    plot()
