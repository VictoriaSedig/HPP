#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>



void* second_thread_func(void* arg) {
  
  int *ind;
  ind = (int*)arg;
  printf("Hello Im secondthreadfunc pid %d \n", *ind);


  return NULL;
}


void* thread_func(void* arg) {
  
  int *index;
  index = (int*)arg; 
  printf("index is threadfunc %d\n", *index);
  int* arr;
  arr = (int*)malloc(2*sizeof(int));



   

  pthread_t threads[2];

  for(int j=0;j<2;j++) {
      arr[j] = j+1;
     pthread_create( &threads[j], NULL , second_thread_func ,(void*) &arr[j]);
  }


  for(int k=0;k<2;k++) {
    pthread_join(threads[k], NULL);
  }

  printf("Hello Im threadfunc pid %d \n", *index);

 free(arr);

  return NULL;
}

int main(int argc, char const *argv[])
{

  int* arr;
  arr = (int*)malloc(2*sizeof(int));  

  //int index = 2;
  printf("This is the main() function starting.\n");


	pthread_t thr[2];


	for(int i=0;i<2;i++) {
    arr[i]=i+1;
	   pthread_create( &thr[i], NULL , thread_func ,(void*) &arr[i]);
	}


	for(int i=0;i<2;i++) {
		pthread_join(thr[i], NULL);
	}
  printf("This is the main() function done.\n");

  free(arr);
  return 0;
}
