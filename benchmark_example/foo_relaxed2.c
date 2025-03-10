
void foo_relaxed(long *a, long *restrict b, long *c) {
  a[0] = b[0];
  a[1] = b[1];
  a[2] = b[2];
  a[3] = b[3];
  *c = 1;
}
