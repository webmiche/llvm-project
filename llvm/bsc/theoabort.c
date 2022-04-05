int g1;
int g2;

int foo(int * restrict x, int * restrict y){
  if (x == y) return -1;

  int *a = &g1;
  int *b = &g2;
  if (x != y)
    a = b;
  return *a + *b;
}
