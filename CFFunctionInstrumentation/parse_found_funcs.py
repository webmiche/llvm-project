
from argparse import ArgumentParser
from utils import demangle_function_name

def unique_funcs(funcs_per_module):
    unique_functions = set()
    for module, funcs in funcs_per_module.items():
        unique_functions.update(funcs)
    return unique_functions


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

def get_unique_funcs(filename):
    funcs_per_module = parse_called_funcs(filename)
    return unique_funcs(funcs_per_module)

def get_stored_funcs_dict(filename):
    file = open(filename, "r")
    funcs_per_module = eval(file.read())

    return funcs_per_module

def print_stats(funcs_per_module):

    unique_functions = unique_funcs(funcs_per_module)

    print(f'Found {len(funcs_per_module)} modules')

    print(f'Found {len(unique_functions)} unique functions')

def build_folder_hierarchy(modules):
    hierarchy = {}
    for module in modules:
        module = module.removeprefix('/home/webmiche/questions/llvm-project/')
        parts = module.split('/')
        current = hierarchy
        for part in parts:
            if part not in current:
                current[part] = {}
            current = current[part]
    return hierarchy

def print_hierarchy(hierarchy):
    for outer_most, inner in hierarchy.items():
        print(outer_most)
        for inner_most, inner_inner in inner.items():
            print(f'  {inner_most}')
            for inner_inner_most in inner_inner:
                print(f'    {inner_inner_most}')
                for inner_inner_inner in inner_inner[inner_inner_most]:
                    print(f'      {inner_inner_inner}')
                    for inner_inner_inner_inner in inner_inner[inner_inner_most][inner_inner_inner]:
                        print(f'        {inner_inner_inner_inner}')
                print()
            print()
        print()

def find_tablegen_funcs(funcs_per_module):
    functions_in_tablegen = {}
    for module, funcs in funcs_per_module.items():
        if module.startswith('/home/webmiche/questions/llvm-project/llvm/utils/TableGen'):
            functions_in_tablegen[module] = funcs
    unique_functions = unique_funcs(functions_in_tablegen)
    total_functions = len(unique_functions)
    print(f'Functions in TableGen: {total_functions}')
    return functions_in_tablegen


def prepare_called_funcs(funcs_to_instrument):
    called_funcs_file = open('called_functions.txt', 'w')
    for func in funcs_to_instrument:
        called_funcs_file.write(f'{func}\n')

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

def convert_to_nested_folder_dict(funcs_per_module):
    nested_dict = {}
    for module, funcs in funcs_per_module.items():
        module = module.removeprefix('/home/webmiche/questions/llvm-project/')
        parts = module.split('/')
        current = nested_dict
        for part in parts:
            if part not in current:
                current[part] = {}
            current = current[part]
        current['functions'] = funcs

    return nested_dict

def convert_to_nested_folder_dict_count(funcs_per_module):
    nested_dict = {}
    for module, funcs in funcs_per_module.items():
        module = module.removeprefix('/home/webmiche/questions/llvm-project/')
        parts = module.split('/')
        current = nested_dict
        for part in parts:
            if part not in current:
                current[part] = {}
            current = current[part]
        current['functions'] = len(funcs)

    return nested_dict

def coalesce_nested_dict_to_level(nested_dict, level):
    if level == 0:
        return nested_dict
    coalesced_dict = {}
    for outer_most, inner in nested_dict.items():
        coalesced_dict[outer_most] = coalesce_nested_dict_to_level(inner, level - 1)
    return coalesced_dict

def print_function_count_per_folder(nested_dict):
    for outer_most, inner in nested_dict.items():
        print(outer_most)
        # add up all the numbers in the innermost dicts
        for inner_most, inner_inner in inner.items():
            print(f'  {inner_most}')
            for inner_inner_most, inner_inner_inner in inner_inner.items():
                total = 0
                print(f'    {inner_inner_most}')
                for inner_inner_inner_most, inner_inner_inner_inner in inner_inner_inner.items():
                    for inner_inner_inner_inner_most, inner_inner_inner_inner_inner in inner_inner_inner_inner.items():
                        if inner_inner_inner_inner_most == 'functions':
                            total += inner_inner_inner_inner_inner
                        else:
                            for inner_inner_inner_inner_inner_most, inner_inner_inner_inner_inner_inner in inner_inner_inner_inner_inner.items():
                                if inner_inner_inner_inner_inner_most == 'functions':
                                    total += inner_inner_inner_inner_inner_inner
                                else:
                                    for inner_inner_inner_inner_inner_inner_most, inner_inner_inner_inner_inner_inner_inner in inner_inner_inner_inner_inner_inner.items():
                                        if inner_inner_inner_inner_inner_inner_most == 'functions':
                                            total += inner_inner_inner_inner_inner_inner_inner
                                        else:
                                            print(123)


                print(f'      Total: {total}')



if __name__ == '__main__':
    # pass the filename as an argument
    parser = ArgumentParser()
    parser.add_argument('filename')
    args = parser.parse_args()
    filename = args.filename

    funcs_per_module = get_stored_funcs_dict(filename)

    prepare_called_funcs_only_analysis(funcs_per_module)
