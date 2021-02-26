/**
 * SSE matrix vector multiplication.
 *
 * Course: High Performance Programming, Uppsala University
 *
 * Author: Andreas Sandberg <andreas.sandberg@it.uu.se>
 * Modified by: Marcus Holm <marcus.holm@it.uu.se>
 *
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>

#include <pmmintrin.h>

#ifndef __SSE3__
#error This example requires SSE3
#endif

#include "util.h"

/* Size of the matrices and the vector */
#define SIZE2 15
#define SIZE (1 << SIZE2) // 2^15

#define MINDEX(n, m) (SIZE*(n)+(m)) // (((n) << SIZE2) | (m))

#define XMM_ALIGNMENT_BYTES 16 

static float *restrict mat_a __attribute__((aligned (XMM_ALIGNMENT_BYTES)));
static float *restrict vec_b __attribute__((aligned (XMM_ALIGNMENT_BYTES)));
static float *restrict vec_c __attribute__((aligned (XMM_ALIGNMENT_BYTES)));
static float *restrict vec_ref __attribute__((aligned (XMM_ALIGNMENT_BYTES)));


/**
 * Implementation that will be auto-vectorized
 */
void matvec_autovec()
{
    int i, j;
    float add;
    add=0;


    //for (i = 0; i < SIZE; i++)
      //          for (j = 0; j < SIZE; j++)
        //                vec_c[i] += mat_a[MINDEX(i, j)] * vec_b[j];

   for (i = 0; i < SIZE; i++){
                for (j = 0; j < SIZE; j++){
                        add += mat_a[MINDEX(i, j)] * vec_b[j];
                    }
            vec_c[i]=add;
            add=0;

        }


	/*for (i = 0; i < SIZE; i++){
        add =0;
        int minstuff = SIZE*i;
                for (j = 0; j < SIZE; j++){
                        float jstuff = vec_b[j];
                        add += mat_a[minstuff] * jstuff;	
                        minstuff++;
                    }
        vec_c[i] = add;
    }
}
*/
}

/**
 * Reference implementation of the matrix vector multiply
 * algorithm. Used to verify the answer. Do NOT change this function.
 */
__attribute__((optimize("no-tree-vectorize"))) 
void matvec_ref()
{
    int i, j;

	for (i = 0; i < SIZE; i++)
                for (j = 0; j < SIZE; j++)
                        vec_ref[i] += mat_a[MINDEX(i, j)] * vec_b[j];
}

	

/**
 * Function used to verify the result. No need to change this one.
 */
__attribute__((optimize("no-tree-vectorize"))) 
int verify_result()
{
        float e_sum;
        int i;

        e_sum = 0;
        for (i = 0; i < SIZE; i++) {
                e_sum += vec_c[i] < vec_ref[i] ?
                        vec_ref[i] - vec_c[i] :
                        vec_c[i] - vec_ref[i];
        }

        printf("e_sum: %.e\n", e_sum);

        return e_sum < 1E-6;
}

/**
 * Initialize mat_a and vec_b with "random" data. Write to every
 * element in mat_c to make sure that the kernel allocates physical
 * memory to every page in the matrix before we start doing
 * benchmarking.
 */
__attribute__((optimize("no-tree-vectorize")))
void init()
{
        int i, j;

        mat_a = _mm_malloc(sizeof(*mat_a) * SIZE * SIZE, XMM_ALIGNMENT_BYTES);
        vec_b = _mm_malloc(sizeof(*vec_b) * SIZE, XMM_ALIGNMENT_BYTES);
        vec_c = _mm_malloc(sizeof(*vec_c) * SIZE, XMM_ALIGNMENT_BYTES);
        vec_ref = _mm_malloc(sizeof(*vec_ref) * SIZE, XMM_ALIGNMENT_BYTES);

        if (!mat_a || !vec_b || !vec_c || !vec_ref) {
                fprintf(stderr, "Memory allocation failed\n");
                abort();
        }

        for (i = 0; i < SIZE; i++) {
                for (j = 0; j < SIZE; j++)
                        mat_a[MINDEX(i, j)] = ((7 * i + j) & 0x0F) * 0x1P-2F;
                vec_b[i] = ((i * 17) & 0x0F) * 0x1P-2F;
        }

        memset(vec_c, 0, sizeof(*vec_c));
        memset(vec_ref, 0, sizeof(*vec_ref));
}

static void 
run_multiply()
{
        struct timeval ts_start, ts_stop;
        double runtime_ref, runtime_autovec;

        printf("Starting autovec run...\n");
        util_monotonic_time(&ts_start);       
        matvec_autovec();
        util_monotonic_time(&ts_stop);
        runtime_autovec = util_time_diff(&ts_start, &ts_stop);
        printf("Autovec run completed in %.2f s\n",
               runtime_autovec);

        printf("Starting reference run...\n");
        util_monotonic_time(&ts_start);
	matvec_ref();
        util_monotonic_time(&ts_stop);
        runtime_ref = util_time_diff(&ts_start, &ts_stop);
        printf("Reference run completed in %.2f s\n",
               runtime_ref);

        printf("Speedup: %.2f\n",
               runtime_ref / runtime_autovec);


	if (verify_result())
	    printf("OK\n");
	else
	    printf("MISMATCH\n");
}

int main(int argc, char *argv[])
{
        /* Initialize the matrices with some "random" data. */
        init();

        run_multiply();

        _mm_free(mat_a);
        _mm_free(vec_b);
        _mm_free(vec_c);
        _mm_free(vec_ref);

        return 0;
}


