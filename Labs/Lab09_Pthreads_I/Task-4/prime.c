#include <stdio.h>
#include <stdlib.h>

#include <pthread.h>

void* the_thread_func(void* arg) {
  
  int *M1;
  M1 = (int*)arg;
  int count =0;
  int thrdprime =0;
	for (int i = 3; i < *M1; i++)
	{
		for (int j = 2; j < i; j++)
			{
				if(i%j==0){
					count +=1;
				}
			}
		if(count == 0){
		thrdprime+=1;
		}
		count = 0;
	}
	*M1=thrdprime;

  return NULL;
}

int main(int argc, char const *argv[])
{


  int M, M1;
  M= atoi(argv[1]);
  printf("%d\n", M);
  if(M%2==0){
  	M1 = M/2;
  }
  else{
  	M1 = (M+1)/2;
  }




  int count=0;
  int primes=0;
  printf("This is the main() function starting.\n");
  pthread_t thread;



  printf("the main() function now calling pthread_create().\n");
  pthread_create(&thread, NULL, the_thread_func, &M1);
  printf("This is the main() function after pthread_create()\n");



	for (int i = M1; i < M; i++)
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


	printf("Number of primes is %d\n", primes+1);
  	printf("the main() function now calling pthread_join().\n");
  	pthread_join(thread, NULL);



  printf("sum computed by main() : %d\n", primes+1);
  printf("sum computed by thread : %d\n", M1);
  int totalSum = primes+1 + M1;
  printf("totalSum : %d\n", totalSum);

  return 0;
}
