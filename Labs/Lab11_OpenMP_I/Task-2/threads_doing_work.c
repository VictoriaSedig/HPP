#include <stdio.h>
#include <stdlib.h>



void do_some_work() {
  printf("Now I am going to do some work...\n");
  long int i;
  long int j = 0;
  for(i = 0; i < 3000000; i++) {
    j += 3;
  }
  printf("Work done! My result j = %ld\n", j);
}

int main(int argc, char** argv) {
int n = atoi(argv[1]);
#pragma omp parallel num_threads(n)
  {
    do_some_work();
  }

  return 0;
}
