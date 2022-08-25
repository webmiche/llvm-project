int main() {
    int a = 5;
    printf("$$$BSC_INST$$$a:%p\n", (void*)&a);
(((a)));
    printf("$$$BSC_INST$$$a:%p\n", (void*)&a);
(a);

    printf("$$$BSC_INST$$$a:%p\n", (void*)&a);
a;

    if(1) {printf("$$$BSC_INST$$$a:%p\n", (void*)&a);
(a);}
    else {printf("$$$BSC_INST$$$a:%p\n", (void*)&a);
if ((a)) {printf("$$$BSC_INST$$$a:%p\n", (void*)&a);
((a));}}

    if(1) {printf("$$$BSC_INST$$$a:%p\n", (void*)&a);
a;};

    return 0;
}