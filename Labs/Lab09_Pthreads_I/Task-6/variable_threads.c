#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <pthread.h>

typedef struct args {
  int start;
  int stop; 
  int primes;
} *args_t;

void* the_thread_func(void* arg) {
  
  args_t stuff = arg;
  int start = stuff->start;
  int stop = stuff->stop;

  int count =0;
  int thrdprime =0;
	for (int i = start ; i < stop; i++)
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
	stuff->primes=thrdprime;
  return NULL;
}

int main(int argc, char const *argv[])
{
  int M, N, starte, stope;
  int primes =0;
  M= atoi(argv[1]);
  N = atoi(argv[2]);
  int rounde = round(M/N);
  pthread_t thr[N];
  args_t arraystuff[N];


  for(int i=0;i<N-1;i++) {
    arraystuff[i] = (args_t)malloc(sizeof(int)*3);
    arraystuff[i] ->start=rounde*i; 
    arraystuff[i] ->stop = rounde*i+rounde;
    pthread_create( &thr[i], NULL , the_thread_func ,(void*) arraystuff[i]);
  }
    
    starte = (N-1)*rounde;

    arraystuff[N-1] = (args_t)malloc(sizeof(int)*3);
    arraystuff[N-1]->start = starte; 
    arraystuff[N-1]->stop = M;
    pthread_create( &thr[N-1], NULL , the_thread_func ,(void*) arraystuff[N-1]);
  



  for(int i=0;i<N;i++) {
    pthread_join(thr[i], NULL);

    primes += arraystuff[i]->primes;
  }

  printf("#primes : %d\n", primes-2);

  return 0;
}
