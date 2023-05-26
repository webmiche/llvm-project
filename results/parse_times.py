from pathlib import Path


def parse_file(file: Path):
    # time per step per function per file per strategy
    strategy_dict = {}
    with open(f, "r") as file:
        lines = file.readlines()
        curr_strategy = ""
        file_dict = {}
        curr_file = ""
        function_dict = {}
        curr_func = ""
        step_dict = {}
        curr_step = ""
        curr_time = 0.0
        for line in lines:
            if line.startswith("*****"):
                if curr_file != "":
                    file_dict[curr_file] = function_dict
                function_dict = {}
                curr_file = line.split(" ")[-1].strip()
                continue
            if line.startswith("==== "):
                if curr_func != "":
                    function_dict[curr_func] = step_dict
                step_dict = {}
                curr_func = line.split(" ")[-1].strip()
                continue
            if line.startswith("greedy search"):
                if line.__contains__("after"):
                    full_time = float(line.split(" ")[-1].strip())
                    curr_step = line.split("after")[1].split(" ")[1].strip()
                    iteration_count = line.split(" ")[-3].strip()
                    if curr_step != "step":
                        step_dict[curr_step + " " + iteration_count] = (
                            full_time - curr_time
                        )
                    curr_time = full_time
                continue
            if line.startswith("exhaustive search"):
                if line.__contains__("after"):
                    full_time = float(line.split(" ")[-1].strip())
                    curr_step = line.split("after")[1].split(" ")[1].strip()
                    step_dict[curr_step] = full_time - curr_time
                    curr_time = full_time
                continue

            if line.startswith("Track AA"):
                if curr_strategy != "":
                    strategy_dict[curr_strategy] = file_dict
                file_dict = {}
                curr_strategy = line.split(" ")[-1].strip()

            if line.startswith("Time") or line.startswith("time"):
                curr_time = float(line.split(" ")[-1].strip())

        function_dict[curr_func] = step_dict
        file_dict[curr_file] = function_dict
        strategy_dict[curr_strategy] = file_dict
    return strategy_dict


def compute_time_per_step(strategy_dict):
    # compute time per step
    total = 0.0
    time_per_step = {}
    for strategy in strategy_dict:
        for f in strategy_dict[strategy]:
            for func in strategy_dict[strategy][f]:
                for step in strategy_dict[strategy][f][func]:
                    curr_step = step.split(" ")[0]
                    total += strategy_dict[strategy][f][func][step]
                    if curr_step in time_per_step:
                        time_per_step[curr_step] = (
                            time_per_step[curr_step]
                            + strategy_dict[strategy][f][func][step]
                        )
                    else:
                        time_per_step[curr_step] = strategy_dict[strategy][f][func][
                            step
                        ]

    print(total)
    print(time_per_step)


benchmarks = ["605", "619", "631", "641"]
if __name__ == "__main__":
    curr_folder = Path("results/epyc/3/")
    files = ["gen_res_" + benchmark + "_first_strat.txt" for benchmark in benchmarks]
    for f in [curr_folder.joinpath(curr_f) for curr_f in files]:
        strategy_dict = parse_file(f)
        compute_time_per_step(strategy_dict)
