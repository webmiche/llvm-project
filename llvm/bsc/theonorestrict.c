int g1;
int g2;

int foo(int *x, int *y){
  int *a = &g1;
  int *b = &g2;
  if (x != y)
    a = b;
  return *a + *b;
}
