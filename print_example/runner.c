#include <stdio.h>

int foo();

void bar();

int baz();

int qux();

int quuz();

int quux();

int main() {
  printf("Running foo\n");
  foo();
  printf("Running bar\n");
  bar();
  printf("Running baz\n");
  baz();
  printf("Running qux\n");
  qux();
  printf("Running quuz\n");
  quuz();
  printf("Running quux\n");
  quux();

  return 0;
}
