
#define BSC_INST_OFFSET_READ(expr, amt) *(char **)(((char *)&(expr)) + (amt))

int foo(int *x, int *y) {

  //__builtin_printf("\n$$$BSC_INST$$$bsc_default_file|foo:y:0:%p\n",
  //                 BSC_INST_OFFSET_READ(y, 0));
  *y = 2;

  //__builtin_printf("\n$$$BSC_INST$$$bsc_default_file|foo:x:0:%p\n",
  //                 BSC_INST_OFFSET_READ(x, 0));
  *x = 1;

  //__builtin_printf("\n$$$BSC_INST$$$bsc_default_file|foo:y:0:%p\n",
  //                  BSC_INST_OFFSET_READ(y, 0));
  return *y;
}
