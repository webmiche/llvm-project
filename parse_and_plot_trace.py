from argparse import ArgumentParser
import matplotlib.pyplot as plt
from statistics import geometric_mean, variance


light_gray = "#cacaca"
dark_gray = "#827b7b"
light_blue = "#a6cee3"
dark_blue = "#1f78b4"
light_green = "#b2df8a"
dark_green = "#33a02c"
light_red = "#fb9a99"
dark_red = "#e31a1c"
light_violet = "#cab2d6"
dark_violet = "#6a3d9a"
light_yellow = "#ffff99"
dark_yellow = "#b15928"
black = "#000000"
white = "#ffffff"
colors = [dark_blue, dark_blue, light_gray, dark_gray, light_red, dark_red, black, white]

def parse_file(file_path):
    """
    Parses a file and returns a list of tuples containing the time and value.
    """

    time_dict = {}

    curr_passes = ""
    curr_benchmark = ""

    with open(file_path, 'r') as file:
        for line in file:
            if not line:
                continue
            if line.startswith("Running benchmark"):

                # the last two words are the passes
                curr_passes = line.split(" ")[-2] + " " + line.split(" ")[-1]
                if not curr_passes == "with passes":
                    curr_passes = curr_passes.removeprefix("with ").strip()
                curr_benchmark = line.split(" ")[2]
                if curr_benchmark not in time_dict:
                    time_dict[curr_benchmark] = {}
                if curr_passes not in time_dict[curr_benchmark]:
                    time_dict[curr_benchmark][curr_passes] = []
                continue
            if line.startswith("real"):
                time = line.split("real")[1].strip()
                if time.endswith('s'):
                    time = time[:-1]
                if time.__contains__('m'):
                    minutes, seconds = time.split('m')
                    time = float(minutes) * 60 + float(seconds)
                else:
                    time = float(time)
                if curr_benchmark and curr_passes:
                    time_dict[curr_benchmark][curr_passes].append(time)


    return time_dict

def plot_results_passes(time_dict):
    """
    Plots the results as a bar chart for each benchmark.
    """
    benchmarks = list(time_dict.keys())
    with_passes = [geometric_mean(time_dict[bench].get("with", [])) for bench in benchmarks]
    without_passes = [geometric_mean(time_dict[bench].get("without", [])) for bench in benchmarks]
    relative_time = [without / with_ if with_ != 0 else 0 for with_, without in zip(with_passes, without_passes)]

    x = range(len(benchmarks))

    width = 0.35
    plt.bar([i + width/2 for i in x], relative_time, width=width, label='Relative Time', color='blue')

    # draw a line at y=1
    plt.axhline(y=1, color='red', linestyle='--', label='100%')
    plt.xlabel('Benchmarks')
    plt.ylabel('Time')
    plt.title('Benchmark Time Comparison')
    plt.xticks([i + 0.2 for i in x], benchmarks)
    plt.ylim(0.88, 1.62)

    # remove upper and right spines
    plt.gca().spines['top'].set_visible(False)
    plt.gca().spines['right'].set_visible(False)

    # set y ticks to percentage
    plt.yticks([.9, 1, 1.1, 1.2, 1.3, 1.4, 1.5],
               [f'{int(tick * 100)}%' for tick in [.9, 1, 1.1, 1.2, 1.3, 1.4, 1.5]])
    plt.legend()
    plt.tight_layout()
    plt.savefig('benchmark_comparison.pdf')


def plot_results_opts(time_dict):
    """
    Plots the results as a bar chart for each benchmark.
    """
    benchmarks = list(time_dict.keys())
    o1 = [geometric_mean(time_dict[bench].get("O1", [])) for bench in benchmarks]
    o2 = [geometric_mean(time_dict[bench].get("O2", [])) for bench in benchmarks]
    o3 = [geometric_mean(time_dict[bench].get("O3", [])) for bench in benchmarks]
    relative_time_o2 = [o2_val / o1_val if o1_val != 0 else 0 for o1_val, o2_val in zip(o1, o2)]
    relative_time_o3 = [o3_val / o1_val if o1_val != 0 else 0 for o1_val, o3_val in zip(o1, o3)]

    variance_o1 = [variance(time_dict[bench].get("O1", [])) for bench in benchmarks]
    variance_o2 = [variance(time_dict[bench].get("O2", [])) for bench in benchmarks]
    variance_o3 = [variance(time_dict[bench].get("O3", [])) for bench in benchmarks]

    print("Variance O1:", variance_o1)
    print("Variance O2:", variance_o2)
    print("Variance O3:", variance_o3)

    x = range(len(benchmarks))

    width = 0.25
    plt.bar([i - width for i in x], relative_time_o2, width=width, label='O2', color=light_blue)
    plt.bar([i for i in x], relative_time_o3, width=width, label='O3', color=light_green)


    # draw a line at y=1
    plt.xlabel('Benchmarks')
    plt.ylabel('Time')

    plt.title('Relative Time compared to O1')
    plt.xticks([i for i in x], benchmarks)

    # remove upper and right spines
    plt.gca().spines['top'].set_visible(False)
    plt.gca().spines['right'].set_visible(False)

    # set y ticks to percentage
    plt.axhline(y=1, color=light_gray, linestyle='--')
    plt.ylim(0.5, 1.35)
    plt.yticks([.6, .7, .8, .9, 1, 1.1, 1.2, 1.3],
               [f'{int(tick * 100)}%' for tick in [.6, .7, .8, .9, 1, 1.1, 1.2, 1.3]])
    plt.legend()
    plt.tight_layout()
    plt.savefig('benchmark_comparison.pdf')

def plot_results_opts_boxplot(time_dict):
    """
    Ont plot for each benchmarks showing the execution time for each optimization level.
    """
    benchmarks = list(time_dict.keys())

    for bench in benchmarks:
        o1 = time_dict[bench].get("O1", [])
        o2 = time_dict[bench].get("O2", [])
        o3 = time_dict[bench].get("O3", [])

        data = [o1, o2, o3]
        labels = ['O1', 'O2', 'O3']

        plt.figure(figsize=(10, 6))
        plt.boxplot(data, labels=labels, patch_artist=True,
                    boxprops=dict(facecolor=light_blue, color=dark_blue),
                    medianprops=dict(color=dark_blue),
                    whiskerprops=dict(color=dark_blue),
                    capprops=dict(color=dark_blue),
                    flierprops=dict(markerfacecolor=dark_blue, marker='o'))

        plt.title(f'Execution Time for {bench}')
        plt.ylabel('Time (seconds)')
        plt.xlabel('Optimization Level')
        plt.ylim(min(o1 + o2 + o3) * 0.95, max(o1 + o2 + o3) * 1.05)

        # remove upper and right spines
        plt.gca().spines['top'].set_visible(False)
        plt.gca().spines['right'].set_visible(False)

        plt.tight_layout()
        plt.savefig(f'{bench}_boxplot.pdf')

if __name__ == "__main__":

    parser = ArgumentParser(description="Parse a trace file and plot the results.")
    parser.add_argument("file_path", type=str, help="Path to the trace file to parse.")
    args = parser.parse_args()

    time_dict = parse_file(args.file_path)
    print("Parsed data:", time_dict)

    if not time_dict:
        print("No data found in the file.")

    else:
        plot_results_opts_boxplot(time_dict)
