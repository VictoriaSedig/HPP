#include <stdlib.h>
#include <stdio.h>
#include <omp.h>
#include <math.h>
#include <sys/time.h>

/// Global variables
 int len;

//Function to take time measurements 
static double get_wall_seconds() {
  struct timeval tv;
  gettimeofday(&tv, NULL);
  double seconds = tv.tv_sec + (double)tv.tv_usec / 1000000;
  return seconds;
}


void make_csr(int n, int* val, int* col, int* row_offset, int* vec){
		int i, j, random;
		int k=0;
		int l = 0;
		len=0;
/* Depending of the stepsize determines how sparse the matrix wll be 
   as all the values we skip are imagined to be zero. 
   Therefor if you ake the matrix larger to the size of 100000 and beyond 
   you need to make sure to increase stepsize
   IMPORTANT: You also need to change the allocation length for the variabe mem in main
*/
	  for (i=0; i<n; i++){
	  	vec[i]=i;
	    for(j=0;j<=n-100;j+=100){ //// Stepsize determines how sparse the matrix wll be as all the values 
		    random = rand() % 100;
		    	val[k] = random;
		    	col[k] = j;
		    	len++;
		    	if (i==l){
		    		row_offset[i]=k;
		    		l++;
		    	}
		    	k++;
		    }
	}

	row_offset[n]=len;

	}


// Function to easily print matrix (mostly for debbugging)
void print_matrix(int** M,int row,int column ){
	int i,j;
	  for (i = 0; i<row; i++){
	    for(j=0;j<column;j++){
	    	printf("%d ",M[i][j]);

	    	if (M[i][j]<10)
	    		printf(" ");
	    }
	    printf("\n");
		}
	printf("\n");
}


// Function to easily print arrays (mostly for debbugging)
void print_array(int* arr, int len){
	int i;
  for (i = 0; i<len; i++){
    	printf("%d ",arr[i]);
    	}
    printf("\n");
}


// Normal vector matrix multiplication
void normal_multi(int* ref_res, int** matrix, int* vec, int n)
{
int i,j;
for (i=0; i<n; i++){
        for (j=0; j<n; j++){
           ref_res[i] += matrix[i][j] * vec[j];
        }
    }
}


void check_result(int n, int* res, int* ref){
	// Funtion to check that two vectors are the same
	int i;
	int count_diff =0;

		for (i=0; i<n; i++){
			if(ref[i]!=res[i]){
				count_diff++;
			}
		  }

	if (count_diff==0){
		printf("Result check sucessful. Result is correct!\n"); }
	else{
		printf("Error! Results are not correct \n"); }
}



int main(int argc, char const *argv[])
{

/// Initialize varaiables 
double startTime, endTime, elapsedTime;
int i,j,k,l, f,n, random, nThreads;
  if(argc != 3) {
    printf("Please give 2 argument: the matrix size n and number off threads \n");
    return -1;
  }

  n = atoi(argv[1]);
  nThreads= atoi(argv[2]);
  long mem =n/100; /// You need to change the divisor in case you wish to change stepsize

/// Allocate mamories for our sparse matrix, vector and result vectors
int* vec = (int *)malloc(n*sizeof(int));
int* res = (int *)malloc(n*sizeof(int));
int* row_offset = (int *)malloc((n+1)*sizeof(int));
int* val = (int *)malloc((n*mem)*sizeof(int));
int* col = (int *)malloc((n*mem)*sizeof(int));
if (val == NULL ){
	printf("To large memory to allocate\n");
	return 0;
}
if (col == NULL){
	printf("To large memory to allocate\n");
	return 0;
}
//printf("%ld\n", (n*n/10)*sizeof(int));
// We call a function to make our csr vectors
make_csr(n ,val, col, row_offset, vec);



///// Here we do the multiplication with the CSR system 
startTime = get_wall_seconds();
for(f=0; f<4; f++){
#pragma omp parallel for num_threads(nThreads) firstprivate(j) schedule(static)
	for (i=0; i<n; ++i) {
		res[i] = 0;
		for (j=row_offset[i]; j<row_offset[i+1]; ++j){
				res[i] += val[j]*vec[col[j]];
			}
		}
	}
elapsedTime = get_wall_seconds()-startTime;
printf("Elapsed time with CSR matrix-vector multiplication was %f\n", elapsedTime);



// Free all allocated memory

  free(row_offset);
  free(val);
  free(col);
  free(vec);
  free(res);

	return 0;
}