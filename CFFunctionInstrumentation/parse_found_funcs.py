
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



if __name__ == '__main__':
    # pass the filename as an argument
    parser = ArgumentParser()
    parser.add_argument('filename')
    args = parser.parse_args()
    filename = args.filename
    funcs_per_module = get_stored_funcs_dict(filename)


    hierarchy = build_folder_hierarchy(funcs_per_module.keys())

    print_hierarchy(hierarchy)

    # add up all the functions in the TableGen folder
    functions_in_tablegen = {}
    for module, funcs in funcs_per_module.items():
        if module.startswith('/home/webmiche/questions/llvm-project/llvm/utils/TableGen'):
            functions_in_tablegen[module] = funcs

    unique_functions = unique_funcs(functions_in_tablegen)
    total_functions = len(unique_functions)


    print_stats(funcs_per_module)

    print(f'Functions in TableGen: {total_functions}')
