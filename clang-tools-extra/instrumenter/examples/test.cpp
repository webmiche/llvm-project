// #define X a + sq

void is_attacked(int a) {
    int sq;
    if (true) {
        a = a + sq;
        a = a + a;
        // X;
        // is_attacked(X);
        is_attacked(a + 1);
        is_attacked(sq);
    }
    // TODO: use hasCondition to check if's conditions
    if (true) 
        is_attacked(sq);
    else 
        is_attacked(sq);
    if (true)
        if (true)
            a = a + sq; 
        else 
            a = a + sq;// Note: I don't know why these nested ifs work - there are two edits, }}, generated after this semicolon.
    else
        a = sq;
    switch(0) {
        case 2: 
            is_attacked(sq);
            break;
        case 3:
            is_attacked(sq);
            break;
        default:
            is_attacked(sq);
            break;
    }
}