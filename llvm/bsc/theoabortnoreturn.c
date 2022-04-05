int g1;
int g2;

int foo(int * restrict x, int * restrict y){
  if (x == y) printf("");

  int *a = &g1;
  int *b = &g2;
  if (x != y)
    a = b;
  return *a + *b;
}
