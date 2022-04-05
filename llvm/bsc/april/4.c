
typedef struct Point {
  int a;
  int b;
} Point;

// with compiler instructed to return NoAlias always
int foo(int* x, int* y, Point* p) {
    //if (x == y) printf("");

    *x = 5;
    *y = 10;
    
    int val = *x; // can be correctly optimized to `val = 5`
    // val used here...
    

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