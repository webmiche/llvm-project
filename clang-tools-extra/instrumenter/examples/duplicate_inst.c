int main() {
    int a = 5;
    int b = 5;
    for (int i = 0; i < 1; i++) {printf("$$$BSC_INST$$$a:%p\n", (void*)&a);
{printf("$$$BSC_INST$$$b:%p\n", (void*)&b);
a = b;}}

    return 0;
}
