#include <stdio.h>
#include <pthread.h>
#include <stdlib.h>


void* the_thread_func(void* arg) {
  /* Do something here? */
  int* arr = (int*)malloc(sizeof(int)*3);
  arr[0]=0;
  arr[1]=1;
  arr[2]=2;
  pthread_exit(arr);

 // return (void*) arr;
}

int main() {
  printf("This is the main() function starting.\n");

  /* Start thread. */
  pthread_t thread;
  printf("the main() function now calling pthread_create().\n");
  if(pthread_create(&thread, NULL, the_thread_func, NULL) != 0) {
    printf("ERROR: pthread_create failed.\n");
    return -1;
  }

  printf("This is the main() function after pthread_create()\n");

  /* Do something here? */
  void* prt;

  /* Wait for thread to finish. */
  printf("the main() function now calling pthread_join().\n");

  if(pthread_join(thread, &prt) != 0) {
    printf("ERROR: pthread_join failed.\n");
    return -1;
  }

  int* stuff = prt;
    printf("This is the %d function after pthread_create()\n", stuff[2]);

  free(prt);
  return 0;
}
