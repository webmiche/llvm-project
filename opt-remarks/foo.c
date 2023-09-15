#include <assert.h>

int foo(int *x, int *y) {

  __builtin_assume_separate_storage(x, y);
  *x = 0;
  *y = 1;
  return *x;
}

int main() { return 0; }
