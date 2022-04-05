int foo(int* x, int* a) {
    //if (x == a) printf("");

    *x = 5;
    *a = 10;
    
    int val = *x; // can be correctly optimized to `val = 5`
    // val used here...

    if (val == 5) {
        // if val is 5, a and x cannot alias

        if (a == x) {
            return -1;
        }
    }

    return val;
}