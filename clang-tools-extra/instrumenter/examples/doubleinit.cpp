// ./build/bin/clang-aa-instrumenter examples/doubleinit.cpp --funcs-and-vars=_Z4main:buf --print-mangled-names -disable-passes="" --
#include "stdio.h"

int main() {
    int buf[6], *p = &buf[6];

    int* p2 = &buf[2];
    buf;

    printf("");

}