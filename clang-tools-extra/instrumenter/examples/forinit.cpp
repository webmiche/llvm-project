// ./build/bin/clang-aa-instrumenter examples/forinit.cpp --funcs-and-vars=_Z4main:i --print-mangled-names -disable-passes="" --
#include <vector>

int main() {
    std::vector<int> x;
    int a;
    if (0)
        #pragma omp parallel for schedule(static,4) shared(progress,status) num_threads((1) == 0 ? 1 : (((1) > (32*1)) && (a != 2)) && (2 != i) ? 2 : 2 < 2 ? 1 : 2)
        for (auto i = x.begin(); i != x.end(); ++i) {
            i;
            a;
            if(0) {
                a;
            }
        }

}

