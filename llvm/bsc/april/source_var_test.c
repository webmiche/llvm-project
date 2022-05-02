// with compiler instructed to return NoAlias
int g = 0;

int foo(int* x, int* a, int* n, int* m) {
    *x = 5;
    *a = 10;

    if (x == &g) {return 0;}
    
    int val = *x; // can be correctly optimized to `val = 5`

    if (val == 5) {
        // with noalias, this if is always taken

        *n = 50;
        *m = 100;

        int val2 = *n;
        return val2;
    } else {
        *n = 50;
        *m = 100;

        int val2 = *n;
        return val2;
    }

    return val;
}

int foo2(int* x, int* a, int* n, int* m) {
    *x = 5;
    *a = 10;

    if (x == &g) {return 0;}
    
    int val = *x; // can be correctly optimized to `val = 5`

    if (val == 5) {
        // with noalias, this if is always taken

        *n = 50;
        *m = 100;

        int val2 = *n;
        return val2;
    } else {
        *n = 50;
        *m = 100;

        int val2 = *n;
        return val2;
    }

    return val;
}