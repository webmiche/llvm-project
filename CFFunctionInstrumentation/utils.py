from subprocess import run, PIPE

def demangle_function_name(function_name):
    cmd = f"llvm-cxxfilt {function_name}"
    result = run(cmd, shell=True, stdout=PIPE)
    return result.stdout.decode('utf-8').strip()
