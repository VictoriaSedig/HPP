#include <stdio.h>
//#include "func.h"

static int function_call_counter = 0;

int f(int k) {
  // Increment function call counter
  function_call_counter++;
  // Do some expensive operations so that this function takes some time
  int x = 3;
  if(k > 0 && 88/k > 2)
    x += 11;
  if(k > 0)
    x += 777/k + 888 / k + 999 / k;
  return x;
}

int get_counter() {
  return function_call_counter;
}


int main() {


  int n = 20000;
  int i, j;
  //int var;
  int sum = 0;
  for(i = 0; i < n; i++) {
    //var = f(i)
    for(j = 0; j < n; j++) {
      sum += f(i) + 3*j;
      //sum += var + 3*j;

    }
  }
  printf("Result sum: %d\n", sum);
  printf("Function call counter: %d\n", get_counter());
  return 0;
}

