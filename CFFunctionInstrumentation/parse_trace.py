
from collections import Counter
from subprocess import run, PIPE

def parse_trace(trace_string) -> dict:

    result = {}

    # Split the trace string into lines
    lines = trace_string.split('\n')

    for line in lines:
        if line == '':
            continue
        function, _, _, value = line.split(' ')
        if function not in result:
            result[function] = []
        result[function].append(value)

    return result


def parse_trace_as_count_dict(file_name) -> dict:

    result = {}

    # Split the trace string into lines
    file_iter = open(file_name, 'r')

    for line in file_iter:
        if line == '':
            continue
        function = line.split(' ')[1]
        values = line.split(' ')[3:-1]
        if function not in result:
            result[function] = Counter()
        result[function].update(values)

    return result

def convert_to_count_dict(trace_dict) -> dict:
    result = {}
    for function, values in trace_dict.items():
        result[function] = Counter(values)
    return result

def parse_file(file_path) -> dict:
    with open(file_path, 'r') as f:
        trace_string = f.read()
    return parse_trace(trace_string)

def demangle_function_name(function_name):
    cmd = f"llvm-cxxfilt {function_name}"
    result = run(cmd, shell=True, stdout=PIPE)
    return result.stdout.decode('utf-8').strip()

def single_valued_functions(trace_dict):
    result = {}
    for function, values in trace_dict.items():
        if len(set(values)) == 1:
            if values[0] not in result:
                result[values[0]] = []
            result[values[0]].append(function)
    return result

def compare_single_valued_functions(trace_dict1, trace_dict2):
    single_valued_functions1 = single_valued_functions(trace_dict1)
    single_valued_functions2 = single_valued_functions(trace_dict2)

    num_same = 0
    num_in_1 = 0
    num_in_2 = 0

    for value, functions1 in single_valued_functions1.items():
        if value in single_valued_functions2:
            functions2 = single_valued_functions2[value]
            num_same += len([f for f in functions1 if f in functions2])
            num_in_1 += len([f for f in functions1 if f not in functions2])
        else:
            num_in_1 += len(functions1)

    for value, functions2 in single_valued_functions2.items():
        if value not in single_valued_functions1:
            num_in_2 += len(functions2)


    return num_same, num_in_1, num_in_2

def omnipresent_functions(opt_level_dict):
    # count functions that occur in all traces
    functions = list(opt_level_dict.values())[0].keys()
    for opt_level, trace_dict in opt_level_dict.items():
        functions = functions & trace_dict.keys()
    return functions

def same_value_functions(opt_level_dict):
    # count functions that return the same values in all traces
    omnipresent = omnipresent_functions(opt_level_dict)

    same_value_functions = []
    for function in omnipresent:
        function_values = set()
        for opt_level, trace_dict in opt_level_dict.items():
            for value in trace_dict[function]:
                function_values.add(value)
        if len(function_values) == 1:
            same_value_functions.append(function)

    return same_value_functions


def print_stats(trace_dict):

    print('Function Trace Statistics')
    print('-------------------------')
    print(f"There are {len(trace_dict)} called functions")

    num_single_value_functions = 0
    num_value_zero_functions = 0
    num_value_one_functions = 0
    other_values = []

    for function, values in trace_dict.items():
        value_set = set(values)
        if len(value_set) == 1:
            num_single_value_functions += 1
            if '0' in value_set:
                num_value_zero_functions += 1
            elif '1' in value_set:
                num_value_one_functions += 1
            else:
                other_values.append(values[0])

    print(f"There are {num_single_value_functions} functions that only return one value")
    print(f"  {num_value_zero_functions} functions only return 0")
    print(f"  {num_value_one_functions} functions only return 1")
    #print(f"  Other values: {other_values}")

    max_function = ''
    max_value = 0
    max_distinct_values = 0
    for function, values in trace_dict.items():
        if len(values) > max_value:
            max_value = len(values)
            max_function = function
            max_distinct_values = len(set(values))

    print(f"The most-called function is \"{demangle_function_name(max_function)}\" with {max_value} calls and {max_distinct_values} distinct values")


def analyse_simple():

    opt_levels = ['no_opt', 'O1', 'O2', 'O3', 'Os', 'Oz']
    opt_level_dicts = {}
    for opt_level in opt_levels:
        opt_level_dicts[opt_level] = parse_file(f'print_example/function_trace_{opt_level}.txt')
    for opt_level in opt_levels:
        print(f"Optimization Level: {opt_level}")
        result = opt_level_dicts[opt_level]
        print_stats(result)
        print()

    for outer_index, outer_opt_level in enumerate(opt_levels):
        for inner_opt_level in opt_levels[:outer_index]:
            print(f"Comparing {outer_opt_level} and {inner_opt_level}")
            result1 = opt_level_dicts[outer_opt_level]
            result2 = opt_level_dicts[inner_opt_level]
            single_valued1 = single_valued_functions(result1)
            single_valued2 = single_valued_functions(result2)
            num_single_functions_1 = sum([len(functions) for functions in single_valued1.values()])
            num_single_functions_2 = sum([len(functions) for functions in single_valued2.values()])
            num_same, num_in_1, num_in_2 = compare_single_valued_functions(result1, result2)

            print(f"  {num_same} single-valued functions return the same value (out of {num_single_functions_1} in {outer_opt_level} and {num_single_functions_2} in {inner_opt_level})")
            print()

    omnipresent = omnipresent_functions(opt_level_dicts)
    print(f"Functions that occur in all traces: {len(omnipresent)}")

    same_value = same_value_functions(opt_level_dicts)
    print(f"Functions that return the same value in all traces: {len(same_value)}")

    del opt_level_dicts['no_opt']
    print()

    omnipresent = omnipresent_functions(opt_level_dicts)
    print(f"Functions that occur in all optimized traces: {len(omnipresent)}")

    same_value = same_value_functions(opt_level_dicts)
    print(f"Functions that return the same value in all optimized traces: {len(same_value)}")


    #print("====================================================")
    #print("Partial Trace for 605")
    #print("====================================================")

    #trace_605 = parse_file('function_trace_605.txt')
    #print_stats(trace_605)
    #print()

    #omnipresent = omnipresent_functions({'605': trace_605})
    #print(f"Functions that occur in all traces: {len(omnipresent)}")

    #same_value = same_value_functions({'605': trace_605})
    #print(f"Functions that return the same value in all traces: {len(same_value)}")

def analyse_benchmark(name: str):
    file_name = f"CFFunctionInstrumentation/function_trace_{name}_partial.txt"

    trace_dict = parse_trace_as_count_dict(file_name)

    print_stats(trace_dict)

    for function, values in trace_dict.items():
        print(f"{demangle_function_name(function)}: {values}")


if __name__ == '__main__':
    analyse_simple()
