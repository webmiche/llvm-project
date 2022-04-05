void foo(int* x, int* a) {
    //if (x == a) printf("");

    *x = 5;
    *a = 10;
    
    int val = *x; // can be correctly optimized to `val = 5`
    // val used here...

   printf("%d", val);
}

/*int main() {
    int bar = 0;
    int baz = 0;
    foo(&bar, &baz);
*/
    /*int* x = &bar;
    int* a = &baz;
    *x = 5;
    *a = 10;

    int val = *x;*/


 // can be correctly optimized to `val = 5`
    // val used here...

//   printf("%d", val);    
//}
