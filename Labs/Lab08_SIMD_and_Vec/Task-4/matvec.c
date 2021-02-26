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
/*
#ifndef _SSE3_
#error This example requires SSE3
#endif
*/
#include "util.h"

/* Size of the matrix and the vector */
#define SIZE2 14
#define SIZE (1 << SIZE2) // 2^14

#define MINDEX(n, m) (SIZE*(n)+(m)) // ((👎 << SIZE2) | (m))

#define XMM_ALIGNMENT_BYTES 16

static float *restrict mat_a __attribute__((aligned (XMM_ALIGNMENT_BYTES)));
static float *restrict vec_b __attribute__((aligned (XMM_ALIGNMENT_BYTES)));
static float *restrict vec_c __attribute__((aligned (XMM_ALIGNMENT_BYTES)));
static float *restrict vec_ref __attribute__((aligned (XMM_ALIGNMENT_BYTES)));

static void
matvec_sse()
{
        /* Assume that the data size is an even multiple of the 128 bit
         * SSE vectors (i.e. 4 floats) */
        assert(!(SIZE & 0x3));
        /*
        for (int row = 0; row < SIZE; row++ ) { // for rows of the matrix
            __m128 result = _mm_setzero_ps();
            for (int col = 0; col < SIZE; col += 4) { // for columns of the matrix
                __m128 shortVec = _mm_loadu_ps(&vec_b[col]); // loads 4 values from the vector
                __m128 shortRow = _mm_loadu_ps(&mat_a[MINDEX(row, col)]); // loads 4 values from a row in the matrix
                __m128 mul = _mm_mul_ps(shortRow, shortVec);
                // sum the values in the mul vector
                // unroll outer loop to use more than 1 position of the value vector
                __m128 value = _mm_hadd_ps(_mm_hadd_ps(mul, _mm_setzero_ps()),_mm_setzero_ps());
                result = _mm_add_ps(result, value);
            }
            _mm_storeu_ps(&vec_c[row],result);
        }*/
        for (int row = 0; row < SIZE; row += 4) { // for rows of the matrix
            __m128 result = _mm_setzero_ps();
            for (int col = 0; col < SIZE; col += 4) { // for columns of the matrix
                __m128 shortVec = _mm_loadu_ps(&vec_b[col]); // loads 4 values from the vector
                __m128 shortRow0 = _mm_loadu_ps(&mat_a[MINDEX(row, col)]); // loads 4 values from a row in the matrix
                __m128 shortRow1 = _mm_loadu_ps(&mat_a[MINDEX(row+1, col)]);
                __m128 shortRow2 = _mm_loadu_ps(&mat_a[MINDEX(row+2, col)]);
                __m128 shortRow3 = _mm_loadu_ps(&mat_a[MINDEX(row+3, col)]);
                __m128 mul0 = _mm_mul_ps(shortRow0, shortVec);
                __m128 mul1 = _mm_mul_ps(shortRow1, shortVec);
                __m128 mul2 = _mm_mul_ps(shortRow2, shortVec);
                __m128 mul3 = _mm_mul_ps(shortRow3, shortVec);

                __m128 value = _mm_hadd_ps(_mm_hadd_ps(mul0, mul1),_mm_hadd_ps(mul2, mul3));
                result = _mm_add_ps(result, value);
            }
            _mm_storeu_ps(&vec_c[row],result);
        }

        /* TASK: Implement your SSE version of the matrix-vector
         * multiplication here.
         */
        /* HINT: You might find at least the following instructions
         * useful:
         *  - _mm_setzero_ps
         *  - _mm_load_ps
         *  - _mm_hadd_ps
         *  - _mm_cvtss_f32
         *
         * HINT: You can create the sum of all elements in a vector
         * using two hadd instructions.
         */
}

/**
 * Reference implementation of the matrix vector multiply
 * algorithm. Used to verify the answer. Do NOT change this function.
 */
static void
matvec_ref()
{
    int i, j;

    for (i = 0; i < SIZE; i++)
                for (j = 0; j < SIZE; j++)
                        vec_ref[i] += mat_a[MINDEX(i, j)] * vec_b[j];
}



/**
 * Function used to verify the result. No need to change this one.
 */
static int
verify_result()
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
static void
init()
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
        double runtime_ref, runtime_sse;

        printf("Starting SSE run...\n");
        util_monotonic_time(&ts_start);
        matvec_sse();
        util_monotonic_time(&ts_stop);
        runtime_sse = util_time_diff(&ts_start, &ts_stop);
        printf("SSE run completed in %.2f s\n", runtime_sse);

        printf("Starting reference run...\n");
        util_monotonic_time(&ts_start);
    matvec_ref();
        util_monotonic_time(&ts_stop);
        runtime_ref = util_time_diff(&ts_start, &ts_stop);
        printf("Reference run completed in %.2f s\n", runtime_ref);

        printf("Speedup: %.2f\n", runtime_ref / runtime_sse);


    if (verify_result())
        printf("OK\n");
    else
        printf("MISMATCH\n");
}

int
main(int argc, char *argv[])
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