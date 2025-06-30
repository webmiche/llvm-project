from argparse import ArgumentParser
import matplotlib.pyplot as plt
from statistics import geometric_mean

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
            if line.__contains__('with passes') or line.__contains__('without passes'):
                curr_passes = "with" if 'with passes' in line else "without"
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

def plot_results(time_dict):
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

if __name__ == "__main__":

    parser = ArgumentParser(description="Parse a trace file and plot the results.")
    parser.add_argument("file_path", type=str, help="Path to the trace file to parse.")
    args = parser.parse_args()

    time_dict = parse_file(args.file_path)

    if not time_dict:
        print("No data found in the file.")

    else:
        plot_results(time_dict)
