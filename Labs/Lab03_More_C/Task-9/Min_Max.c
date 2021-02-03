#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/time.h>
#include <time.h>
#include <math.h>


enum { NS_PER_SECOND = 1000000000 };

double** allocate_matrix(int n);
void deallocate_matrix(double** theMatrix, int n);
void fill_matrix(double** theMatrix, int n);
void print_matrix(double** theMatrix, int n);
double get_min_value(double** theMatrix, int n);
double get_max_value(double** theMatrix, int n);
double get_wall_seconds();



int main()
{
  struct timespec start, stop;
  //double accum;


  double sec1;
  double sec2;
  int n;
  printf("\nEnter the dimension for a square matrix:");
  scanf("%d",&n);
  printf("n = %d\n", n);
  sec1 = get_wall_seconds();
  clock_gettime(CLOCK_REALTIME, &start) ;

  double** matrixA = allocate_matrix(n);
  double** matrixB = allocate_matrix(n);
  sec2= get_wall_seconds();
  clock_gettime(CLOCK_REALTIME, &stop) ;

  printf("Allocating matrix twice takes Secs: %lf \n", sec2-sec1);
  printf("Gettime %f\n", stop.tv_sec-start.tv_sec+(stop.tv_nsec-start.tv_nsec)/pow(10,9));

  clock_gettime(CLOCK_REALTIME, &start) ;
  sec1 = get_wall_seconds();
  fill_matrix(matrixA, n);
  sec2= get_wall_seconds();
  clock_gettime(CLOCK_REALTIME, &stop) ;


  printf("Fill matrix takes Secs: %lf \n", sec2-sec1);
  printf("Gettime %f\n", stop.tv_sec-start.tv_sec+(stop.tv_nsec-start.tv_nsec)/pow(10,9));

  sec1= get_wall_seconds();
  clock_gettime(CLOCK_REALTIME, &start) ;

  double minValue = get_min_value(matrixA, n);
  double maxValue = get_max_value(matrixA, n);
  sec2 = get_wall_seconds();
  clock_gettime(CLOCK_REALTIME, &stop) ;

  printf("Get min and max value takes Secs: %lf \n", sec2-sec1);
  printf("Gettime %f\n", stop.tv_sec-start.tv_sec+(stop.tv_nsec-start.tv_nsec)/pow(10,9));

  //print_matrix(matrixA, n);
  printf("Min value: %14.9f  Max value: %14.9f\n", minValue, maxValue);
  sec1= get_wall_seconds();
  clock_gettime(CLOCK_REALTIME, &start) ;

  deallocate_matrix(matrixA, n);
  deallocate_matrix(matrixB,n);
  sec2 = get_wall_seconds();
  clock_gettime(CLOCK_REALTIME, &stop) ;

  printf("Dellocate matrix takes Secs: %lf \n", sec2-sec1);
  printf("Gettime %f\n", stop.tv_sec-start.tv_sec+(stop.tv_nsec-start.tv_nsec)/pow(10,9));

  return 0;
}


double** allocate_matrix(int n)
{
  double** theMatrix;
  int i;
  theMatrix = calloc(n , sizeof(double *));
  for(i = 0; i < n; i++)
    theMatrix[i] = calloc(n , sizeof(double));
  return theMatrix;
}

void deallocate_matrix(double** theMatrix, int n)
{
  int i;
  for(i = 0; i < n; i++)
    free(theMatrix[i]);
  free(theMatrix);
}

void fill_matrix(double** theMatrix, int n)
{
  int j, i;
  for(j = 0; j < n; j++)
    for(i = 0 ; i < n ; i++)
      theMatrix[i][j] = 10 * (double)rand() / RAND_MAX;
}

void print_matrix(double** theMatrix, int n)
{
  int i, j;
  for(i = 0 ; i < n; i++)
    {
      for(j = 0 ; j < n ; j++)
	printf("%2.3f " , theMatrix[i][j]);
      putchar('\n');
    }
}

double get_max_value(double** theMatrix, int n)
{
  int i, j;
  double max = 0.0;
  max = theMatrix[0][0];
  for(j = 0; j < n ; j++)
    for(i = 0 ;i < n; i++)
      if(max < theMatrix[i][j])
	max = theMatrix[i][j];
  return max;
}

double get_min_value(double** theMatrix, int n)
{
  int i, j;
  double min = 0.0;
  min = theMatrix[0][0];
  for(j = 0; j < n; j++)
    for(i = 0; i < n; i++)
      if(min > theMatrix[i][j])
	min = theMatrix[i][j];
  return min;
}

double get_wall_seconds(){
struct timeval tv;
gettimeofday(&tv, NULL);
double seconds = tv.tv_sec + (double)tv.tv_usec/1000000;
//printf("The seconds: %lf \n",seconds );
return seconds;
}






/*
1

100:
real  0m34.762s
user  0m0.003s
sys 0m0.000s

500:
real  0m2.699s
user  0m0.023s
sys 0m0.008s


1000:
real  0m3.470s
user  0m0.092s
sys 0m0.013s


5000:
real  0m6.748s
user  0m2.321s
sys 0m0.140s


10000:
real  0m29.225s
user  0m23.586s
sys 0m0.476s


2

100
real  0m3.009s
user  0m0.003s
sys 0m0.000s

500
real  0m1.815s
user  0m0.026s
sys 0m0.008s


1000
real  0m2.714s
user  0m0.086s
sys 0m0.017s


5000
real  0m11.228s
user  0m2.316s
sys 0m0.235s


10000
real  0m27.571s
user  0m23.525s
sys 0m0.819s


*/