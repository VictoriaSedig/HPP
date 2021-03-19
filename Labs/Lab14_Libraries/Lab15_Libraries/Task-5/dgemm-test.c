#include <stdlib.h>
#include <stdio.h>
#include <sys/time.h>

//gcc -m64 dgemm-test.c -g -O3 -msse3 -ftree-vectorizer-verbose=2. /home/victoria/Desktop/HPP/OpenBLAS-0.3.13/libopenblas_excavatorp-r0.3.13.a -fopt-info-vec -lrt -m64 -ffast-math

/* Declaration for dgemm_(): BLAS function for double-precision
   matrix-matrix multiplication. */
void dgemm_(const char *ta,const char *tb,
	    const int *n, const int *k, const int *l,
	    const double *alpha,const double *A,const int *lda,
	    const double *B, const int *ldb,
	    const double *beta, double *C, const int *ldc);

static double get_wall_seconds() {
  struct timeval tv;
  gettimeofday(&tv, NULL);
  double seconds = tv.tv_sec + (double)tv.tv_usec / 1000000;
  return seconds;
}

int main(int argc, char** argv) {
  if(argc != 2) {
    printf("Please give one input argument: the matrix size N\n");
    return -1;
  }
  int N = atoi(argv[1]);
  printf("N = %d\n", N);
  int i,j,k;
  int Nmax = 10000000;
  double sec1, sec2, sec3, sec4;
  double sum;
  const double beta = 0;
  const double alpha = 1;
  const char transa = 'n';

  // Allocate memory for input matrices A and B
  double* A = (double*)malloc(N*N*sizeof(double));
  double* B = (double*)malloc(N*N*sizeof(double));

  // Allocate memory for reference result matrix C_ref
  double* C_ref = (double*)malloc(N*N*sizeof(double));

  // Allocate memory for dgemm result matrix C_dgemm
  double* C_dgemm = (double*)malloc(N*N*sizeof(double));

  //Need to fill matrices

  for ( i = 0 ; i < N ; i++ ){
    for ( j = 0 ; j < N ; j++ ){
      A[j*N+i] = (double)(rand()%Nmax)/1000;
      B[j*N+i] = (double)(rand()%Nmax)/1000;
    }
  }


  // TODO: Write code to compute reference matrix C_ref here!
    sec1 = get_wall_seconds();

    for (i=0; i<N; i++)  {
      for (j=0; j<N; j++) {
        sum = 0;
        for (k=0; k<N; k++) {
          sum += A[k*N+i] * B[j*N+k];
        }
      
        C_ref[j*N+i] = sum;
      }
    }

    sec2 = get_wall_seconds();




  // TODO: Print time it took to compute C_ref.
    printf("It took %lf seconds to compute C_ref\n", sec2-sec1);



  // TODO: Write code call dgemm BLAS routine to compute C_dgemm here!
    
    
    sec3 = get_wall_seconds();
    dgemm_(&transa, &transa, &N, &N, &N,&alpha, A , &N, B, &N,&beta, C_dgemm, &N);
    sec4 = get_wall_seconds();

  // TODO: Print time it took to compute C_dgemm.
    printf("It took %lf seconds to compute C_dgemm\n", sec4-sec3);


  // TODO: Write code to compare C_ref and C_dgemm here, print maximum
  // difference found. Print a happy message if difference is small,
  // and a sad error message otherwise.
    double diff=0.0;
    double newdiff=0.0;


      for ( i = 0 ; i < N ; i++ )
      {
        for ( j = 0 ; j < N ; j++ )
        {
          diff = C_ref[j*N+i] - C_dgemm[j*N+i];
          if(diff>newdiff){
            newdiff=diff;
        }
        }
      }
      if(newdiff<0.000001){
        printf("Happy message");
      }
      else{
        printf("Sad message :(");
      }



  free(A);
  free(B);
  free(C_ref);
  free(C_dgemm);
  
  return 0;
}
