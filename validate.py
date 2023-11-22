from pathlib import Path, PosixPath
from subprocess import Popen, PIPE, run, DEVNULL
import os

specbuild_dir = Path("../specbuilder/")
initial_dir = Path("/home/michel/ETH/AST/llvm-project/initial/")
instr_path = Path("/home/michel/ETH/AST/llvm-project/build_instr/bin/")


def generate_composed_file(file_name: str, indeces_per_function: dict):
    num_funcs = 0
    for function, curr_indeces in indeces_per_function.items():
        if curr_indeces[0] == []:
            continue
        if curr_indeces[0] == ():
            continue
        num_funcs += 1

    str_to_write = str(num_funcs) + "\n"
    for function, curr_indeces in indeces_per_function.items():
        if curr_indeces[0] == ():
            continue
        if curr_indeces[0] == []:
            continue
        str_to_write += function + "\n"
        str_to_write += str(len(curr_indeces[0])) + "\n"
        for index in curr_indeces[0]:
            str_to_write += str(index) + "\n"

    with open(file_name, "w") as f:
        f.write(str_to_write)


def compile_composed(
    file_name: Path,
    compose_dir: Path,
    composed_file_name: Path,
    output_file: Path = None,
):
    if output_file is None:
        output_file = file_name
    cmd = [
        instr_path + "opt",
        file_name,
        "-o",
        str(output_file.with_suffix(".txt")),
        "--arfile",
        str(composed_file_name),
        "-Oz",
    ]
    run(
        cmd,
        stdout=DEVNULL,
    )


def generate_baseline(benchmark: str):
    run(
        [
            "./spec",
            "build",
            initial_dir,
            benchmark,
            str(instr_path.joinpath("clang")),
            "-bc",
            "--opt_level",
            "Oz",
        ],
        cwd=specbuild_dir,
    )


benchmark = "605"
generate_baseline(benchmark)

seq_dict = {
    PosixPath("605/pflowup.bc"): {"primal_update_flow": ([], 95)},
    PosixPath("605/treeup.bc"): {"update_tree": ([], 535)},
    PosixPath("605/pbeampp.bc"): {
        "primal_bea_mpp": ([3, 57], 779),
        "set_static_vars": ([], 781),
        "cost_compare": ([], 781),
    },
    PosixPath("605/pbla.bc"): {"primal_iminus": ([], 178)},
    PosixPath("605/mcf.bc"): {"main": ([], 1239)},
    PosixPath("605/psimplex.bc"): {
        "markBaskets": ([], 1812),
        "worker": ([], 1812),
        "master": ([], 1812),
        "primal_net_simplex": ([], 1812),
    },
    PosixPath("605/readmin.bc"): {"read_min": ([2, 10, 27, 33, 48, 56, 62, 101], 1727)},
    PosixPath("605/mcfutil.bc"): {
        "refresh_neighbour_lists": ([], 1652),
        "flow_cost": ([4, 16], 1645),
        "getArcPosition": ([], 1652),
        "flow_org_cost": ([4, 16], 1642),
        "primal_feasible": ([], 1652),
        "dual_feasible": ([], 1652),
    },
    PosixPath("605/output.bc"): {"write_circulations": ([], 579)},
    PosixPath("605/implicit.bc"): {
        "resize_prob": ([], 4639),
        "insert_new_arc": ([1], 4635),
        "replace_weaker_arc": ([], 4639),
        "price_out_impl": ([4, 5, 12, 13, 22, 39, 40, 70], 4481),
        "suspend_impl": ([2, 6, 28, 32], 4576),
        "refreshArcPointers": ([], 4639),
        "refreshPositions": ([], 4639),
        "marc_arcs": ([0, 49], 4628),
        "calculate_max_redcost": ([], 4639),
        "switch_arcs": ([26], 4636),
        "arc_compare": ([], 4639),
    },
    PosixPath("605/pstart.bc"): {"primal_start_artificial": ([0, 15, 51], 297)},
    PosixPath("605/spec_qsort/spec_qsort.bc"): {
        "swapfunc": ([], 1754),
        "spec_qsort": ([], 1754),
    },
}

for f in seq_dict.keys():
    generate_composed_file(initial_dir.joinpath(f.with_suffix(".txt")), seq_dict[f])
