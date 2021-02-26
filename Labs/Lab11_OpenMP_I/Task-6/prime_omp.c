#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
	#include <omp.h>
#endif
#include <math.h>

int the_thread_func(int M, int N){
  int start;
  int stop;
  int i;
  int j;
  int count=0;
  int primes=0;

  printf("Im Pid %d starting \n", omp_get_thread_num());
	/*if(omp_get_thread_num()==0){
	start = 3;
	stop = round(M/N);
	}
	else if(omp_get_thread_num()==N-1){
	stop = M;
	start = omp_get_thread_num()*round(M/N);
	}  
	else{
		start = omp_get_thread_num()*round(M/N);
		stop = (omp_get_thread_num()+1)*round(M/N);
	}*/
   start = 3 + omp_get_thread_num();
   stop = M;
	printf("%d %d \n",start, stop );
	//if(start<3){start=3;}
		for (i = start; i < stop; i+=N)
		{
			for (int j = 2; j < i; j++)
				{
					if(i%j==0){
						count +=1;
					}
				}
			if(count == 0){
			primes+=1;
			}
			count = 0;
		}
		printf("%d\n",primes );
		return primes;
	}

int main(int argc, char const *argv[])
{


  int M, N;
  M= atoi(argv[1]);
  N= atoi(argv[2]);


  int arr[N];
  int i;
  for(int j=0; j<N; j++){
	//printf("%d\n", arr[j]);
	arr[j]=0;
}
#pragma omp parallel num_threads(N)
  {
  //	for(i=0;i<N;i++){
    //if(omp_get_thread_num() == i){
      arr[omp_get_thread_num()] = the_thread_func(M,N);
        //    arr[i] = the_thread_func(M,N);

    //	}
	//}
	printf("Pid %d is done \n",omp_get_thread_num() );
}

int sum=0; 
for(int j=0; j<N; j++){
	//printf("%d\n", arr[j]);
	sum += arr[j];
}
	printf("Number of primes is %d\n", sum + 1);


  return 0;
}
