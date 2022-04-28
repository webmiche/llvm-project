// with compiler instructed to return NoAlias
int foo(int* x, int* a, int* n, int* m) {
    *x = 5;
    *a = 10;
    
    int val = *x; // can be correctly optimized to `val = 5`

    if (val == 5) {
        // with noalias, this if is always taken



        return 2;
    } else {
        *n = 50;
        *m = 100;

        int val2 = *n;
        return val2;
    }

    return val;
}