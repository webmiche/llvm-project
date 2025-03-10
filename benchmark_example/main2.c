#include <stdio.h>
#include <time.h>

void foo_precise(long *a, long *b, long *c);
void foo_relaxed(long *a, long *b, long *c);

int main() {
  long a[4], b[4], c[1];

  int runs = 1000000000;
  clock_t start = clock();
  for (int i = 0; i < runs; i++) {
    foo_precise(a, b, c);
  }
  clock_t end = clock();
  double time = (double)(end - start) / CLOCKS_PER_SEC;
  printf("Time for foo_precise: %f seconds\n", time);

  start = clock();
  for (int i = 0; i < runs; i++) {
    foo_relaxed(a, b, c);
  }
  end = clock();
  time = (double)(end - start) / CLOCKS_PER_SEC;
  printf("Time for foo_relaxed: %f seconds\n", time);

  start = clock();
  for (int i = 0; i < runs; i++) {
    foo_precise(a, b, c);
  }
  end = clock();
  time = (double)(end - start) / CLOCKS_PER_SEC;
  printf("Time for foo_precise: %f seconds\n", time);

  start = clock();
  for (int i = 0; i < runs; i++) {
    foo_relaxed(a, b, c);
  }
  end = clock();
  time = (double)(end - start) / CLOCKS_PER_SEC;
  printf("Time for foo_relaxed: %f seconds\n", time);

  start = clock();
  for (int i = 0; i < runs; i++) {
    foo_precise(a, b, c);
  }
  end = clock();
  time = (double)(end - start) / CLOCKS_PER_SEC;
  printf("Time for foo_precise: %f seconds\n", time);

  start = clock();
  for (int i = 0; i < runs; i++) {
    foo_relaxed(a, b, c);
  }
  end = clock();
  time = (double)(end - start) / CLOCKS_PER_SEC;
  printf("Time for foo_relaxed: %f seconds\n", time);

  return 0;
}
