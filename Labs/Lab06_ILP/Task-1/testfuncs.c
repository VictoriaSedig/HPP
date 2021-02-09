#include "testfuncs.h"

void f_std(const double * __restrict a, 
	   const double * __restrict b, 
	   double * __restrict c, int N) {
  int i;
  double x = 0.3;
  for(i = 0; i < N; i++) {
    c[i] = a[i]*a[i] + b[i] + x;
  }
}

void f_opt(const double * __restrict a, 
  
	   const double * __restrict b, 
	   double * __restrict c, int N) {
  int i;
  int unrollfact = 5;
  int loopextra; 
  loopextra = N % unrollfact;
  N = N - loopextra;
  double x = 0.3;
  for(i = 0; i < N; i+=unrollfact) {
    c[i] = a[i]*a[i] + b[i] + x;
    c[i+1] = a[i+1]*a[i+1] + b[i+1] + x;
    c[i+2] = a[i+2]*a[i+2] + b[i+2] + x;
    c[i+3] = a[i+3]*a[i+3] + b[i+3] + x;
    c[i+4] = a[i+4]*a[i+4] + b[i+4] + x;
    //c[i+5] = a[i+5]*a[i+5] + b[i+5] + x;

  }
  for(i=N; i<N+loopextra; i++){
      c[i] = a[i]*a[i] + b[i] + x;

  }


}

