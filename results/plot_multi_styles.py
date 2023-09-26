import matplotlib.pyplot as plt

results = {
    "best subsequences": (
        [
            (4639, 4398),
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
            (17913, 17561),
        ],
        0,
    ),
    "Random 100 samples": (
        [
            (4639, 4528),
            (1790, 1857),
            (535, 535),
            (579, 579),
            (1652, 1644),
            (178, 178),
            (1239, 1239),
            (95, 95),
            (781, 779),
            (1812, 1812),
            (319, 297),
            (1754, 1754),
            (17913, 17841),
        ],
        99,
    ),
    "Random 100 samples (precise)": (
        [
            (4639, 4468),
            (1790, 1790),
            (535, 535),
            (579, 579),
            (1652, 1652),
            (178, 178),
            (1239, 1239),
            (95, 95),
            (781, 781),
            (1812, 1812),
            (319, 305),
            (1754, 1754),
            (17913, 17733),
        ],
        132,
    ),
    "Random 3372 samples": (
        [
            (4639, 4410),
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
            (17661, 17613),
        ],
        3366,
    ),
    "Random 57910 samples": (
        [
            (4639, 4398),
            (1790, 1812),
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
            (17913, 17645),
        ],
        57882,
    ),
    "Deterministic (Exh: 0)": (
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
            (17913, 17581),
        ],
        3372,
    ),
    "Deterministic (Exh: 13)": (
        [
            (4639, 4400),
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
            (17913, 17573),
        ],
        26277,
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
    "overall",
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
    light_gray,
    light_red,
    dark_red,
    light_green,
    dark_green,
    light_blue,
    dark_blue,
]


def plot():
    plt.figure(figsize=(10, 5))
    plt.title("Comparison of different styles for 605")
    plt.xlabel("Number of samples")
    plt.ylabel("Difference")

    x_values = []
    for i in range(1, 14):
        x_values.append(i * 10)

    plt.xticks(x_values, names, rotation=45)

    for i, (style, data) in enumerate(results.items()):
        sizes = [(i[0] - i[1]) / i[0] for i in data[0]]
        compilations = data[1]
        plt.bar(
            [x + i - 3 for x in x_values],
            sizes,
            label=style + (f" ({compilations} comps)" if compilations > 0 else ""),
            color=colors[i],
        )

    plt.legend()
    plt.savefig("results/plot_multi_styles.pdf")
    plt.show()


if __name__ == "__main__":
    plot()
