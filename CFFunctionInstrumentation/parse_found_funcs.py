
from argparse import ArgumentParser
from utils import demangle_function_name

def unique_funcs(funcs_per_module):
    unique_funcs = set()
    for module, funcs in funcs_per_module.items():
        unique_funcs.update(funcs)
    return unique_funcs


def parse_called_funcs(filename):
    print(f'Parsing {filename}')

    funcs_per_module = {}
    # open the file and read the lines
    try:
        with open(filename, 'r') as f:
            for line in f:
                func, _, _, module = line.strip().split(' ')
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

if __name__ == '__main__':
    # pass the filename as an argument
    parser = ArgumentParser()
    parser.add_argument('filename')
    args = parser.parse_args()
    filename = args.filename

    unique_funcs = get_unique_funcs(filename)

    print(f'Found {len(unique_funcs)} unique functions in {filename}:')
    for func in unique_funcs:
        print(demangle_function_name(func))

    funcs_per_module = parse_called_funcs(filename)

    print(f'Found {len(funcs_per_module)} modules in {filename}:')
    for module, funcs in funcs_per_module.items():
        print(f'{module}: {len(funcs)} functions')
        for func in funcs:
            print(demangle_function_name(func))
        print()
