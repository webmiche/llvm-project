// #define X a + sq

void is_attacked(int a) {
    int sq;

    if (true) 
        a = a + sq;
        else 
            a = a + sq;

    if (true || true)
        if (true)
            a = a + sq; 
        else 
            a = a + sq;
    else
        // this doesn't match anymore with complex match helper, matches with simple match helper
        a = sq;
}