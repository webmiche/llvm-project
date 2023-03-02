int g1;
int g2;

#define BSC_INST_OFFSET_READ(expr, amt) *(char **)(((char *)&(expr)) + (amt))

int foo(int *restrict x, int *restrict y) {
  int *a = &g1;
  int *b = &g2;

  __builtin_printf("\n$$$BSC_INST$$$bsc_default_file|foo:x:0:%p\n",
                   BSC_INST_OFFSET_READ(x, 0));
  if (x != y)
    a = b;
  return *a + *b;
}
