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
        print("Error")
        print(result.stderr)
        return []

    functions = parse_function_trace(result.stderr)

    return functions


def parse_function_trace(trace):
    # parse the function trace
    functions = []
    for line in trace.split("\n"):
        if line.startswith("Called function:"):
            function_name = line.split(" ")[2]
            functions.append(function_name)

    return functions


if __name__ == "__main__":
    files = get_files("/home/michel/ETH/AST/questions/llvm-project/build_IR/lib/Transforms/InstCombine/CMakeFiles/LLVMAggressiveInstCombine.dir/")
    functions = []
    for file in files:
        print(file)
        functions.extend(get_functions(file))

    functions = list(set(functions))
    functions.sort()

    for function in functions:
        print(function)
