#include <stdio.h>
#include <stdlib.h>

#include <pthread.h>

void* the_thread_func(void* arg) {
  
  int *index;
  index = (int*)arg;
  printf("Hello Im pid %d \n", *index);


  return NULL;
}

int main(int argc, char const *argv[])
{



  int index;
  index = atoi(argv[1]);
  printf("%d\n", index);

  printf("This is the main() function starting.\n");

	pthread_t thr[index];
  int pids[index];
	for(int i=0;i<index;i++) {
    pids[i] =i;
	   pthread_create( &thr[i], NULL , the_thread_func ,(void*) &pids[i]);
	}


	for(int i=0;i<index;i++) {
		pthread_join(thr[i], NULL);
	}

  return 0;
}
