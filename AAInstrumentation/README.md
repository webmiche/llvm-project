# AA Instrumentattion

This README will explain to you several parts of your ASTproject "Enabling
Performance Evaluation of Compilers".

As mentioned in the proposal, we want to evaluate our compilers for runtime
performance instead of binary size for several different projects we have in the
lab. This particular git repository contains the AA Relaxation project, a
project where we try to show the impact of Alias Analysis (AA) on optimizing
compilers. In particular, we try to figure out what the impact of the current AA
is, so we are comparing to "worse" AA. AA in LLVM is implemented as an analysis
that the compiler can query through the "alias" function, giving two pointers
and several other arguments. The analysis will then answer with what it
figured out:

- NoAlias: The pointers never alias.
- MustAlias: The pointers always alias.
- PartialAlias: The pointers point to overlapping memory regions.
- MayAlias: The pointers might alias or not, the analysis did not manage to
  prove anything.

In this project, we simulate "worse AA" by exchanging precise answers (i.e. the
upper three) with MayAlias. This is done through the `--aasquence` command line
flag. This sequence consists of numbers separated by `-`. The first number
denotes how many numbers will follow, all other numbers denote indices of
answers to relax. So, if we want to change the first and third answer, the
command line argument would be `--aasequence=2-0-2`. (If you are interested,
check out the instrumentation in `llvm/lib/Analysis/AliasAnalysis.cpp` starting
from line 180.)

Through this aasequence command line, we can generate a lot of versions of the
same binary. We use this tool for several experiments, which are implemented in
this `AAInstrumentation/`-folder. The most important one for you is called
`optimization` and this is exactly what it does: optimize the resulting binary
by finding the "best" aasequence.

The two core algorithms are in the `AutoTuningOptimizer`-class and the
`RandomOptimizer`-class. For both also exist parallel versions. As you can
imagine, this currently only optimizes binary size. Your project is essentially
to figure out if we could change this to optimize for performance.

## Getting started

First, I would advise you to fork this repository. I do not mind if you fork it
as private or public, but notice that there are other teams doing this project
too and they might be able to see what you are working on, if you fork as
public.

First, you will need to compile the clang custom build that has the aasequence
argument. Checkout the main README for instructions on that. The cmake
configuration I used on my machine is

```bash
cmake -G Ninja ../llvm -DCMAKE_BUILD_TYPE=Release -DLLVM_USE_LINKER=lld -DLLVM_ENABLE_PROJECTS='clang;lld' -DLLVM_ENABLE_ASSERTIONS=On
```

The following compilation command should build all the binaries you should need.

```bash
ninja opt clang llc llvm-size
```

No guarantee that this works, but notice that I am using a Release build with
assertions (for faster compilation and lower memory footprint). Also, I use the
lld linker, as it tends to speed up linking a lot compared to the standard gcc
linker. If your system has relatively little RAM, I strongly advise using lld as
it has lower memory footprint. This not only speeds up linking, it sometimes
gets rid of out-of-memory issues during linking.

## The python code base

In this `AAInstrumentation`-folder, you can find the python instrumentation I
implemented. In the `core`-file, you can find the `AAInstrumentationDriver`,
which implements a lot of the core functionality needed for all the individual
experiments. The most interesting for you is probably the
`run_step_single_func()`-method, which takes a list of integers and runs the
instrumentation. Another interesting function might be `measure_outputsize`, as
this is essentially the method you will have to replace. It takes a file as
argument and returns the "score" of that file. Currently, the "score" is just
the file size. My hope is that we can add another function `measure_performance`
after your project that will return a score for performance.

# Good luck!

This is everything I could think of right now. If you have further questions, or
specific suggestions on things to add to this README, feel free to ping me
(moodle, email, whatever)!
