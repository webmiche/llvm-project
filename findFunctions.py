from subprocess import run, PIPE
from os import walk


def get_files(directory):

    files = []
    # get all files in directory
    for root, dirs, curr_files in walk(directory):
        files.append(root)
        if root.endswith(".dir/"):
            for d in dirs:
                files.extend(walk(root + "/" + d))
            files.extend([root + file for file in curr_files])


    # filter out all files that are not .o files
    files = [file for file in files if file.endswith(".cpp.o")]


    return files

def get_functions(file):
    # get all interesting functions from a file
    functions = []
    cmd = ["/home/michel/ETH/AST/questions/llvm-project/build_instrumented/bin/opt", "--passes=function-instrumentation", file, "-disable-output"]

    result = run(cmd, stdout=PIPE, stderr=PIPE, universal_newlines=True)

    if result.returncode != 0:
        print("Error in getting functions")
        print(result.stderr)
        return []

    functions = parse_function_trace(result.stderr)

    return functions


def parse_function_trace(trace):
    # parse the function trace
    called_functions = {}
    function_name = ""
    curr_called_functions = []
    for line in trace.split("\n"):
        if line.startswith("Called functions "):
            if function_name != "":
                called_functions[function_name] = curr_called_functions
            function_name = line.split(" ")[-1].removesuffix(":")
            curr_called_functions = []
        elif line == "":
            continue
        else:
            curr_called_functions.append(line)


    return called_functions

def demangle_function(function_name):
    # demangle a function name
    cmd = ["c++filt", function_name]

    result = run(cmd, stdout=PIPE, stderr=PIPE, universal_newlines=True)

    if result.returncode != 0:
        print("Error in demangling")
        print(result.stderr)
        return function_name

    return result.stdout.strip()

if __name__ == "__main__":
    files = get_files("/home/michel/ETH/AST/questions/llvm-project/build_IR/lib/Transforms/InstCombine/CMakeFiles/LLVMInstCombine.dir/")
    for file in files:
        print(file)
        functions = get_functions(file)
        # filter out all functions without called functions
        functions = {k: v for k, v in functions.items() if len(v) > 0}

        print("For file: " + file)
        for function, called_functions in functions.items():
            print("Function: " + demangle_function(function))
            print("Called functions: ")
            for called_function in called_functions:
                print("\t" + demangle_function(called_function))
            print()
