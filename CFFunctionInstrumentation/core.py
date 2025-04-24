
from subprocess import run, PIPE
from collections import Counter

"""
This files defines many core functionalities for CFFunctionInstrumentation.
"""

cffunctions_positions_file = "CFFunctionInstrumentation/CFFunctionPositions.txt"
cffunctions_positions = None


def parse_called_funcs(filename):
    print(f'Parsing {filename}')

    funcs_per_module = {}
    # open the file and read the lines
    try:
        with open(filename, 'r') as f:
            for line in f:
                splitline = line.strip().split(' ')
                if not len(splitline) == 4:
                    continue
                func = splitline[0]
                module = splitline[3]
                if module not in funcs_per_module:
                    funcs_per_module[module] = []
                funcs_per_module[module].append(func)
    except FileNotFoundError:
        print(f'File {filename} not found')
        return []

    return funcs_per_module

def prepare_func_dict(trace_file, storage_file):

    func_dict = parse_called_funcs(trace_file)

    with open(storage_file, "w") as file:
        file.write(str(func_dict))

def prepare_instrumented_per_module_file(with_compile =False):

    if with_compile:
        pass
        # Compile LLVM with an instrumented version, single threadedly
        # CMake config is something like
        # cmake ../llvm -DCMAKE_BUILD_TYPE=Release -G Ninja -DCMAKE_C_COMPILER=/home/webmiche/questions/llvm-project/build_instrumented/bin/clang -DCMAKE_CXX_COMPILER=/home/webmiche/questions/llvm-project/build_instrumented/bin/clang++ -DLLVM_ENABLE_PROJECTS="clang"

        # afterwards, move the called_functions.txt file to the curr_trace_store.txt file

    prepare_func_dict("curr_trace_store.txt", "instrumented_per_module.txt")

def prepare_positions_file(prepare_instrumented = False):
    if prepare_instrumented:
        prepare_instrumented_per_module_file()

    with open("instrumented_per_module.txt", "r") as file:
        instrumented_per_module = eval(file.read())

    # Invert the mapping
    inverted_mapping = {}
    for module, funcs in instrumented_per_module.items():
        for func in funcs:
            if func not in inverted_mapping:
                inverted_mapping[func] = []
            inverted_mapping[func].append(module)

    # Write the inverted mapping to a file
    with open(cffunctions_positions_file, "w") as file:
        file.write(str(inverted_mapping))


def get_cffunctions():
    """
    Reads the CFFunctionsPositions.txt file and returns a list of functions.
    """

    positions_dict = get_cffunctions_positions()
    return list(positions_dict.keys())


def get_cffunctions_positions():
    """
    Reads the CFFunctionsPositions.txt file and returns a dictionary of
    functions mapped to where they are defined.
    """
    global cffunctions_positions
    if cffunctions_positions is not None:
        return cffunctions_positions

    with open(cffunctions_positions_file, "r") as file:
        cffunctions_positions = eval(file.read())

    return cffunctions_positions

def get_functions_only_folder(folder_name):
    """
    Returns a list of functions that are defined in the given folder.
    """
    cffunctions_positions = get_cffunctions_positions()

    funcs = []
    for func in cffunctions_positions:
        modules = cffunctions_positions[func]

        # check if any module starts with the folder_name
        if any(module.startswith(folder_name) for module in modules):
            funcs.append(func)

    return funcs

def get_functions_only_llvm():
    """
    Returns a list of functions that are defined in the LLVM module.
    """
    return get_functions_only_folder('/home/webmiche/questions/llvm-project/llvm')

def get_functions_only_analysis():
    """
    Returns a list of functions that are defined in the Analysis module.
    """
    return get_functions_only_folder('/home/webmiche/questions/llvm-project/llvm/lib/Analysis')

def prepare_called_funcs_only_llvm(funcs_per_module):
    funcs_to_call = set()
    for module, funcs in funcs_per_module.items():
        if module.startswith('/home/webmiche/questions/llvm-project/llvm'):
            for func in funcs:
                funcs_to_call.add(func)

    prepare_called_funcs(funcs_to_call)

def prepare_called_funcs_only_analysis(funcs_per_module):
    funcs_to_call = set()
    for module, funcs in funcs_per_module.items():
        if module.startswith('/home/webmiche/questions/llvm-project/llvm/lib/Analysis'):
            for func in funcs:
                funcs_to_call.add(func)

    prepare_called_funcs(funcs_to_call)

def prepare_called_funcs_all(funcs_per_module):
    funcs_to_call = set()
    for module, funcs in funcs_per_module.items():
        for func in funcs:
            funcs_to_call.add(func)

    prepare_called_funcs(funcs_to_call)

def prepare_called_funcs(funcs_to_instrument):
    called_funcs_file = open('called_functions.txt', 'w')
    for func in funcs_to_instrument:
        called_funcs_file.write(f'{func}\n')

def choose_compiler(functions_to_trace):
    """
    Chooses a compiler that covers all the functions to trace.
    """
    # Check if all functions are defined in analysis
    analysis_funcs = get_functions_only_analysis()
    if all(func in analysis_funcs for func in functions_to_trace):
        return "build_instrumented_only_analysis"
    # Check if all functions are defined in llvm
    llvm_funcs = get_functions_only_llvm()
    if all(func in llvm_funcs for func in functions_to_trace):
        return "build_instrumented_only_llvm"

    # Otherwise, use the default compiler
    return "build_fully_instrumented"

def run_tracing(functions_to_trace, file_name, opt_level):

    """
    Runs the tracing process for the given functions.
    """
    # Choose the compiler based on the functions to trace
    compiler = choose_compiler(functions_to_trace)

    open("function_trace.txt", "w").close()

    cmd = [
        "./" + compiler + "/bin/clang",
        "-" + opt_level,
        file_name,
        "-o",
        file_name.replace(".c", "_traced.o"),
    ]


    run(cmd, check=True)

    # Get tracing result
    trace = open("function_trace.txt", "r").read()

    trace_dict = parse_trace_counts(trace)

    # Filter out functions that are not in the functions_to_trace list
    filtered_trace_dict = {}
    for function, values in trace_dict.items():
        if function in functions_to_trace:
            filtered_trace_dict[function] = values

    return filtered_trace_dict

def parse_trace(trace_string) -> dict:
    result = {}

    # Split the trace string into lines
    lines = trace_string.split('\n')

    for line in lines:
        if line == '':
            continue
        function, value = line.split(' ')
        if function not in result:
            result[function] = []
        result[function].append(value)

    return result

def parse_trace_counts(trace_string) -> dict:

    return convert_to_count_dict(parse_trace(trace_string))

def convert_to_count_dict(trace_dict) -> dict:
    result = {}
    for function, values in trace_dict.items():
        result[function] = Counter(values)
    return result

def prepare_func_dict(storage_file):
    """
    Prepares the function dictionary from the trace file and stores it in the storage file.
    """

    llvm_functions = get_functions_only_llvm()
    analysis_functions = get_functions_only_analysis()
    all_functions = get_cffunctions()

    curr_index = 0
    func_dict = {}
    for function in llvm_functions:
        func_dict[curr_index] = function
        curr_index += 1

    for function in analysis_functions:
        if function in llvm_functions:
            continue
        func_dict[curr_index] = function
        curr_index += 1

    for function in all_functions:
        if function in llvm_functions or function in analysis_functions:
            continue
        func_dict[curr_index] = function
        curr_index += 1

    with open(storage_file, "w") as file:
        for key, value in func_dict.items():
            file.write(f"{key} {value}\n")



if __name__ == "__main__":
    prepare_func_dict("function_map.txt")
