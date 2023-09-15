total_binaries = {"605": 6020, "619": 3318, "631": 25886}
different_sizes = {"605": 144, "619": 4, "631": 166}
times_per_run = {"605": 688.07, "619": 1500, "631": 300}
times_per_instr = {"605": 193, "619": 180, "631": 1716}

for key in total_binaries:
    print(key)
    num_binaries = total_binaries[key]
    num_diff_sizes = different_sizes[key]
    time_per_instr = times_per_instr[key]
    time_per_run = times_per_run[key]

    print("Total time size: " + str(time_per_instr / 60) + " minutes")

    print(
        "Total time trivial: "
        + str((num_binaries * time_per_run + time_per_instr) / 60)
        + " minutes"
    )
    print(
        "Total time different sizes: "
        + str((num_diff_sizes * time_per_run + time_per_instr) / 60)
        + " minutes"
    )
