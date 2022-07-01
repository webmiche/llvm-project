void is_attacked(int a) {
    int sq;
    if (true) {
        a = a + sq;
        a = a + a;

        is_attacked(a + 1);
        is_attacked(sq);
        if (sq) {
            return;
        }
    }

    if (true) 
        is_attacked(sq);
    else 
        is_attacked(sq);
    if (true || true)
        if (true)
            a = a + sq; 
        else 
            a = a + sq;
    else
        a = sq;

    if (false)
        a = a;
    else
        if (sq)
            a = a + sq;
        else 
            a = a + sq;

    do 
        a = a + sq;
    while (sq);

    do {
        a = a + sq;
    } while (sq);
    
    while (sq) {
        a = a + sq;
    }

    while (sq)
        a = a + sq;

    for (int i = 0; i < 10; i++) {
        a = a + sq;
    }

    for (int i = 0; i < 10; i++)
        a = a + sq;

    int coll[] = {1,2,3};

    for (auto i : coll) {
        a = a + sq;
    }

    for (auto i : coll)
        a = a + sq;

    

    // Not handled yet:
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