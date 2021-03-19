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


void make_sparse(int n, int** A, int* vec){
	int i,j, random;
	len=0;
	// Make a sparse matrix and vector
	  for (i = 0; i<n; i++){
	  	A[i] = (int *)malloc(n*sizeof(int));
	  	vec[i]=i;

	    for(j=0;j<n;j++){
		    random = rand() % 100; // 100x100 100, 500x500 = 250000 / 1000
		    if(random < 4){ /// You can decide here how large percetage of zeros there shoudld be
		    	A[i][j] = random; 
		    	len++; }
		    else{
		    	A[i][j] = 0;
		    }
	    }
	}
}


void make_csr(int n, int** A, int* val, int* col, int* row_offset){
// Make the CSR vectors 
	int i, j;
	int k=0;
	int l = 0;
  for (i=0; i<n; i++){
    for(j=0;j<n;j++){
	    if(A[i][j]!=0){
	    	val[k] = A[i][j];
	    	col[k] = j;
	    	if (i==l){
	    		row_offset[i]=k;
	    		l++;
	    	}
	    	k++;
	    }
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
int i,j,k,l,f, n, random, nThreads;
  if(argc != 3) {
    printf("Please give 2 argument: the matrix size n and number off threads \n");
    return -1;
  }

  n = atoi(argv[1]);
  nThreads= atoi(argv[2]);

/// Allocate mamories for our sparse matrix, vector and result vectors
int** A = (int **)malloc(n*sizeof(int*));
int* vec = (int *)malloc(n*sizeof(int));
int* res = (int *)malloc(n*sizeof(int));
int* ref_res = (int *)malloc(n*sizeof(int));

// We call a function to make our sparse 
	make_sparse(n, A, vec); 

int* val = (int *)malloc(len*sizeof(int));
int* col = (int *)malloc(len*sizeof(int));
int* row_offset = (int *)malloc((n+1)*sizeof(int));

	make_csr(n , A, val, col, row_offset);


///// Here we do the multiplication with the CSR format. Based on https://www.it.uu.se/education/phd_studies/phd_courses/pasc/lecture-1 

startTime = get_wall_seconds();
for(f=0; f<4; f++){
#pragma omp parallel for num_threads(nThreads) firstprivate(j) schedule(static,4)
		for (i=0; i<n; ++i) {
			res[i] = 0;
			for (j=row_offset[i]; j<row_offset[i+1]; ++j){
					res[i] += val[j]*vec[col[j]];
				}
			}
		}
elapsedTime = get_wall_seconds()-startTime;

printf("Elapsed time with CSR matrix-vector multiplication was %f\n", elapsedTime);



//// Here we do the multiplication traditionally
startTime = get_wall_seconds();
for(f=0; f<4; f++){
#pragma omp parallel for num_threads(nThreads) firstprivate(j) schedule(guided)
		for (i=0; i<n; i++){
			ref_res[i]=0;
		        for (j=0; j<n; j++){
		           ref_res[i] += A[i][j] * vec[j];
		        }
		    }
		}
elapsedTime = get_wall_seconds()-startTime;

printf("Elapsed time with normal matrix-vector multiplication was %f\n", elapsedTime);

// We compare the two results as an extra insurance the results are correct 
check_result(n, res, ref_res);

// Free all allocated memory
  for (i = 0; i<n; i++)
    free(A[i]);
  free(A);
  free(row_offset);
  free(val);
  free(col);
  free(ref_res);
  free(vec);
  free(res);

	return 0;
}





