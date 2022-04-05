int g1;
int g2;

int foo(int * restrict x, int * restrict y){
  int *a = &g1;
  int *b = &g1;
  if (x != y)
    a = b;
  return *a + *b;
}
