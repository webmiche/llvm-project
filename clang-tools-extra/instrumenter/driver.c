extern int foo(int *x, int *y);

int main() {
  int l;
  int m;
  foo(&l, &m);
  return 0;
}
