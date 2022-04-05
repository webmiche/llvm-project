int foo(int** x, int** y, int* a, int* b) {
    //if (x == y) printf("");

    int* xa = *x;
    int* yb = *y;

    *x = a;
    *y = b;
    

    if (val != 5) {
        // y and x must alias

        p->a = 50;
        p->b = 100;
        int val2 = p->a; // can be correctly optimized to `val2 = 50`

        if (val2 == 50) {
            return -2;
        }
    }

    if (val == 5) {
        // if val is 5, y and x cannot alias



        if (y == x) {
            return -1;
        }
    }

    return val;
}