from subprocess import run

txts = ["instr_run.txt", "non_instr_run.txt"]

dicts = []

for txt in txts:
    f = open(txt, "r")
    ir_per_pass = {}
    pass_count = {}

    for line in f.readlines():
        if (
            line.__contains__("no change")
            or line.__contains__("ignored")
            or line.__contains__("omitted")
            or line == "Changed Query Used!\n"
        ):
            continue
        if line.startswith("*** "):
            curr_pass = line.split(" ")[4].strip()
            if curr_pass in pass_count:
                pass_count[curr_pass] += 1
            else:
                pass_count[curr_pass] = 0
            curr_pass += "_" + str(pass_count[curr_pass])
            ir_per_pass[curr_pass] = []
            continue

        ir_per_pass[curr_pass].append(line)

    dicts.append(ir_per_pass)


def is_same(trace_0, trace_1):
    with open("t0.txt", "w") as f:
        f.write("".join(trace_0))
    with open("t1.txt", "w") as f:
        f.write("".join(trace_1))
    cmd = [
        "../build_instr/bin/llvm-diff",
        "t0.txt",
        "t1.txt",
    ]
    p = run(cmd)
    return p.returncode == 0


count = 0
for d in dicts[0].keys():
    if d not in dicts[1].keys():
        print(d)
    if not is_same(dicts[0][d], dicts[1][d]):
        # if dicts[0][d] != dicts[1][d]:
        print(d)
        # instr_file = open(str(count) + "_instr.txt", "w")
        # instr_file.write("".join(dicts[0][d]))
        # non_instr_file = open(str(count) + "_non_instr.txt", "w")
        # non_instr_file.write("".join(dicts[1][d]))
        # count += 1


# for i in range(count):
#    print("diff " + str(i))
#    cmd = [
#        "../build_instr/bin/llvm-diff",
#        str(i) + "_instr.txt",
#        str(i) + "_non_instr.txt",
#    ]
#    run(cmd)
