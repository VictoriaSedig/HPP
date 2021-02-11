#include <stdlib.h>
#include "myfuncs.h"

float fun1(float* p, int k) {
  float* tmp = (float*)malloc(k*sizeof(float));
  int i;
  for(i = 0; i < k; i++)
    tmp[i] = p[i] * 0.43;
  float sum;
  //tmp[k]=0.2; //Added
  sum = 0;
  for(i = 0; i < k; i++)
    sum += tmp[i];
  free(tmp);
  return sum;
}

float fun2(float* p, int k) {
  float* tmp = (float*)malloc(k*sizeof(float));
  int i;
  for(i = 0; i < k; i++)
    tmp[i] = p[i] * 0.43 + 0.7;
  float sum;
  sum = 0;
  for(i = 0; i < k; i++)
    sum += tmp[i];
  free(tmp);
  return sum;
}
