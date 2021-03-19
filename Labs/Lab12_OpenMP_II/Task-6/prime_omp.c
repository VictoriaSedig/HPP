#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
	#include <omp.h>
#endif
#include <math.h>


int main(int argc, char const *argv[])
{


  int M, N;
  M= atoi(argv[1]);
  N= atoi(argv[2]);



  int i;
  int j;
  int count=0;
  int primes=0;
  int sum =0;


#pragma omp parallel for num_threads(N) firstprivate(count,j) reduction(+:primes) schedule(guided,4)

      for (i = 3; i < M; i++)
		{
			count = 0;

			for (j = 2; j < i; j++)
				{
					if(i%j==0){
						count +=1;
					}
				}
			if(count == 0){
			primes=primes+1;
			}
		}


	printf("Number of primes is %d\n", primes+1);


  return 0;
}
