// with compiler instructed to return NoAlias
int foo(int* x, int* a) {
    *x = 5;
    *a = 10;
    
    int val = *x; // can be correctly optimized to `val = 5`

    if (val == 5) {
        // with noalias, this if is always taken

        return 2;
    }

    return val;
}