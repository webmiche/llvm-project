#include <stdio.h>

int foo();

void bar();

int baz();

int qux();

int quuz();

int quux();

int main() {
  printf("Running foo 230 times\n");
  for (int i = 0; i < 230; i++) {
    foo();
  }
  printf("Running bar\n");
  bar();
  printf("Running baz\n");
  baz();
  printf("Running qux\n");
  qux();
  printf("Running quuz 450 times\n");
  for (int i = 0; i < 450; i++) {
    quuz();
  }
  printf("Running quux\n");
  quux();

  return 0;
}
