/**********************************************************************
 * This program calculates pi using C
 *
 **********************************************************************/
#include <stdlib.h>
#include <stdio.h>
#include <omp.h>
#include <math.h>
#include <sys/time.h>


int main(int argc, char *argv[]) {

  /*
  int i;
  int nThreads=4;
  const int intervals = 500000000;
  double sum, dx, x;

  dx  = 1.0/intervals;
  sum = 0.0;


#pragma omp parallel for num_threads(nThreads) firstprivate(x) reduction(+:sum) schedule(guided,4)
  for (i = 1; i <= intervals; i++) { 
    x = dx*(i - 0.5);
    sum += dx*4.0/(1.0 + x*x);
  }

  printf("PI is approx. %.16f\n",  sum);
*/
  int n = 10000;

  int* col = (int *)malloc(n*n*sizeof(int));
  col[3]=5;

  return 0;
}
