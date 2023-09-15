from subprocess import run

changed_trace = "trace_changed.txt"
changed_trace_diff = "trace_changed_diff.txt"
unchanged_trace = "trace_unchanged.txt"
unchanged_trace_diff = "trace_unchanged_diff.txt"


def parse_trace(file: str):
    f = open(file, "r")
    ir_per_pass = {}
    pass_count = {}
    pass_list = []

    for line in f.readlines():
        if line.__contains__("ignored"):
            continue
        if line.__contains__("invalidated"):
            line = line.strip()

            if line.__contains__("PassManager") and line.__contains__("invalidated"):
                continue
            curr_pass = line.removesuffix(" invalidated ***").strip()
            curr_pass = curr_pass.removesuffix(" (invalidated) ***").strip()
            curr_pass = curr_pass.removesuffix("on <unnamed loop>").strip()
            curr_pass = curr_pass.removeprefix("*** IR Pass").strip()
            curr_pass = curr_pass.removeprefix("*** IR Dump After").strip()
        elif line.startswith("*** "):
            curr_pass = line.strip()
            curr_pass = curr_pass.removeprefix("*** IR Pass").strip()
            curr_pass = curr_pass.removeprefix("*** IR Dump After").strip()
            curr_pass = curr_pass.removesuffix(" ***").strip()
            curr_pass = curr_pass.removesuffix("because no change").strip()
            curr_pass = curr_pass.removesuffix("omitted").strip()
            curr_pass = curr_pass.removesuffix("on <unnamed loop>").strip()

        else:
            ir_per_pass[curr_pass].append(line)
            continue

        if curr_pass.startswith("LoopDeletionPass"):
            curr_pass = "LoopDeletionPass"

        if curr_pass in pass_count:
            pass_count[curr_pass] += 1
        else:
            pass_count[curr_pass] = 0
        curr_pass += "_" + str(pass_count[curr_pass])
        ir_per_pass[curr_pass] = []
        pass_list.append(curr_pass)

    return ir_per_pass, pass_list


changed_dict, changed_passes = parse_trace(changed_trace)
changed_dict_diff, _ = parse_trace(changed_trace_diff)
unchanged_dict, unchanged_passes = parse_trace(unchanged_trace)
unchanged_dict_diff, _ = parse_trace(unchanged_trace_diff)


def print_diff(ir1, ir2):
    with open("t0.txt", "w") as f:
        f.write("".join(ir1))
    with open("t1.txt", "w") as f:
        f.write("".join(ir2))
    cmd = [
        "../build_instr/bin/llvm-diff",
        "t0.txt",
        "t1.txt",
    ]
    run(cmd)


diff_pass_changed = [c for c in changed_passes if c not in unchanged_passes]
diff_pass_unchanged = [c for c in unchanged_passes if c not in changed_passes]

for i, (c, u) in enumerate(zip(changed_passes, unchanged_passes)):
    if changed_dict[c] != unchanged_dict[u]:
        first_diff = c
        break
print("first diff: ", first_diff)
print("at index: ", i)

print_diff(changed_dict[first_diff], unchanged_dict[first_diff])

length = max(len(changed_passes), len(unchanged_passes))
changed_keys = changed_passes
unchanged_keys = unchanged_passes
offset_changed = 0
offset_unchanged = 0
for j in range(length):
    if j <= i:
        old_c = c
        old_u = u
        continue
    if j + offset_changed >= len(changed_keys) or j + offset_unchanged >= len(
        unchanged_keys
    ):
        break
    c = changed_keys[j + offset_changed]
    u = unchanged_keys[j + offset_unchanged]

    if c in diff_pass_changed:
        offset_changed += 1
        c = changed_keys[j + offset_changed]

    if u in diff_pass_unchanged:
        offset_unchanged += 1
        u = unchanged_keys[j + offset_unchanged]

    if c != u:
        print("different passes: ", c, u)
        if changed_dict_diff[c] != "":
            print("Diff to old: ")
            print_diff(changed_dict[c], changed_dict[old_c])
        if unchanged_dict_diff[u] != "":
            print("Diff to old: ")
            print_diff(unchanged_dict[u], unchanged_dict[old_u])
        continue

    if changed_dict_diff[c] != "":
        print("diff in changed: ", c)
        print("Diff to old: ")
        print_diff(changed_dict[c], changed_dict[old_c])
        print("Diff to unchanged: ")
        print_diff(changed_dict[c], unchanged_dict[c])

    if unchanged_dict_diff[u] != "":
        print("diff in unchanged: ", u)
        print("Diff to old: ")
        print_diff(unchanged_dict[u], unchanged_dict[old_u])
        print("Diff to changed: ")
        print_diff(unchanged_dict[u], changed_dict[u])


# find interesting passes (where one of the IRs changes) and print diff to other
# flow and previous IR
