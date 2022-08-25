// ./build/bin/clang-aa-instrumenter examples/register.cpp --funcs-and-vars=_Z4main:buf --print-mangled-names -disable-passes="" --
void free(void *a);

int main() {
    register unsigned char* buf = 0;
    if (0) {
        for(0;0;) {
            free(buf);
            unsigned char* other = buf;
        }
    }
}

