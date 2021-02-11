#include <stdio.h>
#include "funcs.h"

int main() {
  printf("First call to f:\n");
  f();
  printf("Second call to f:\n");
  f();
  otherfunc(777777);
  printf("Third call to f:\n");
  f();
  return 0;
}
