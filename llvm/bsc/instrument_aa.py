#!/usr/bin/env python3

from pathlib import Path
import os
import functools
import operator


def main():
    PREFIX = "/home/nius/eth/bachelorsthesis/llvm-project/llvm/bsc/specbuilder/"
    # preprocessed_source_dir = Path(PREFIX + "final_preprocessed_clang14")
    PREPROCESSED_DIR = "final_preprocessed_clang14_copy1"
    aa_vars_dir = Path(PREFIX + "collect_variables_out_clang14")
    i = 0
    for aa_var_file in aa_vars_dir.glob("619/**/*.aavars"):
        i = i + 1
        if i % 10 == 0:
            print(f"Done {i} files")
        print(aa_var_file)
        without_aavars = os.path.splitext(aa_var_file)[0]
        without_ll = Path(without_aavars).with_suffix(".c")
        target_source = Path(without_ll.__str__().replace("collect_variables_out_clang14", PREPROCESSED_DIR, -1))
        suffixes = [".c", ".cpp", ".cxx", ".cc"]
        for suffix in suffixes:
            if target_source.with_suffix(suffix).exists():
                target_source = target_source.with_suffix(suffix)
                break
        if not target_source.exists():
            print("Could not find source file for " + aa_var_file.__str__())
            continue
        
        print(without_ll)
        print(target_source)
        
        args = []
        with open(aa_var_file, "r") as f:
            for line in f:
                line = line.strip()
                if not line:
                    continue
                if not line.__contains__(":"):
                    continue
                if not line.split(":")[1]:
                    continue
                    
                args.append(line)
        if args.__len__() == 0:
            print("No arguments found for " + aa_var_file.__str__())
            continue
        instrumenter = "/home/nius/eth/bachelorsthesis/llvm-project/clang-tools-extra/instrumenter/build/bin/clang-aa-instrumenter"
        arg = ",".join(args)
        cmd = f"{instrumenter} -i -p build {target_source} --funcs-and-vars={arg}"
        print(cmd)
        curr_path = Path.cwd()
        os.chdir(PREFIX)
        os.system(cmd)
        os.chdir(curr_path)

if __name__ == '__main__':
    main()
