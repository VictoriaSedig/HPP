#include <stdio.h>
#include <stdlib.h>
#include <omp.h>


long int Fib(int n, int nThreads) {
  if(n < 2) 
    return n;
 long int i1, i2;
  int index;

  if (nThreads>1){
  #pragma omp parallel num_threads(2) reduction(+: index)
    index = Fib(n-1-omp_get_thread_num(), nThreads/2);
   {
    /*
      if(omp_get_thread_num()==0){
          i1 = Fib(n-1, nThreads/2);
      }
      if (omp_get_thread_num()==1 )
      {
          i2 = Fib(n-2, nThreads/2);

      }
    }*/
  }
  else{
          i1 = Fib(n-1, nThreads);
          i2 = Fib(n-2, nThreads);
  }

  return i1 + i2; // index
}

int main(int argc, char** argv) {
 /* if(argc != 2) {
    printf("Please give one input arg: n\n");
    return -1;
  }
  */
  omp_set_nested(1);
  int n = atoi(argv[1]);
  int nThreads = atoi(argv[2]);
  printf("n = %d\n", n);
  long int Fib_of_n = Fib(n, nThreads);
  printf("Fib(%d) = %ld\n", n, Fib_of_n);
  return 0;
}
