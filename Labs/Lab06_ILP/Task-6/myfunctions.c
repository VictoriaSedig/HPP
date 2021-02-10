#include "myfunctions.h"

double ffff(const double * a, int N) {
  int i;
  double sum = 0;
  for(i = 0; i < N; i++) {
  	for(int j=0; j<N; j++)
    sum += 0.3*a[i];
  }
  return sum; 
}
