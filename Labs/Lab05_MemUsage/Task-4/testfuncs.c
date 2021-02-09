#include "testfuncs.h"
#include <stdio.h>

void transform_std (float * dest, 
		    const float * src, 
		    const float * params, 
		    int n,
		    int np) {
  int i, j;
  int k = 0;
  for (i=0; i<n; i++)
    for(j = 0; j < np; j++) {
      dest[k] = params[j] * src[k] + params[j] * src[k] * src[k];
      k++;
    }
}
  int NP = 2;


void transform_opt (float * __restrict dest,
    const float * __restrict src,
    const float * __restrict params,
    int n,
    int np)  {

  // It is a lot faster inside the function

  if(np != NP) {

    printf("ERROR: np must be same as NP.\n");
    return;
  }

  int i, j;
  int k = 0;
  for (i=0; i<n; i++)
    for(j = 0; j < NP; j++) {
      dest[k] = params[j] * src[k] + params[j] * src[k] * src[k];
      k++;
    }
}

