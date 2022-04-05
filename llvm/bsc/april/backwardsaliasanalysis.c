
typedef struct Point {
  int a;
  int b;
} Point;

// with compiler instructed to return NoAlias always
int foo(int* x, int* y, Point* p) {
    //if (x == y) printf("");

    *x = 5;
    *y = 10;
    
    int val = *x; // can be correctly optimized to `val = 5`, if x and y noalias
    // val used here...

    if (val == 5) {
        // if val is 5, y and x cannot alias

        *x = 50;
        *y = 100;

        int val = *x; // can be correctly optimized to `val = 50`, always
        /// NOT OPTIMIZED TO `val = 50` => LLVM doesn't know that x and y cannot alias

        return val;
    }

    return val;
}