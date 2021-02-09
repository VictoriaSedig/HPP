#include "testfunc2.h"

void transform_opt (float * __restrict dest,
	const float * __restrict src,
	const float * __restrict params,
	int n) {
  int i;
  for (i=0; i<n; i++)
    dest[i] = params[0] * src[i] + params[1] * src[i] * src[i];
}

