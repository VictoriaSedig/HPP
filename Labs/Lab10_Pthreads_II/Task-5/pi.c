/**********************************************************************
 * This program calculates pi using C
 *
 **********************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <pthread.h>

typedef struct args {
  int start;
  int stop; 
  double sum;
  double d;

} *args_t;

void* the_thread_func(void* arg) {
  double x;

  args_t stuff = arg;
  int start = stuff->start;
  int stop = stuff->stop;
  double d = stuff -> d;
  double count =0.0;
  for (int i = start; i <= stop; i++) { 
    x = d*(i - 0.5);
    count += d*4.0/(1.0 + x*x);
  }
  stuff->sum=count;
  return NULL;
}

int main(int argc, char *argv[]) {

  
  const int intervals = 500000000;
  double pi, dx;

  dx  = 1.0/intervals;
  pi = 0.0;
  int p= 4;
  pthread_t thr[p];

  args_t arraystuff[p];


  int length = round(intervals/p);



  for(int i=0;i<p-1;i++) {
    arraystuff[i] = (args_t)malloc(sizeof(int)*3);
    arraystuff[i] ->start=i*length; 
    arraystuff[i] ->stop = length*i+length;
    arraystuff[i] ->d = dx;
    pthread_create( &thr[i], NULL , the_thread_func ,(void*) arraystuff[i]);
  }

    int starte = (p-1)*length;

    arraystuff[p-1] = (args_t)malloc(sizeof(int)*3);
    arraystuff[p-1]->start = starte; 
    arraystuff[p-1]->stop = intervals;
    arraystuff[p-1] ->d = dx;

    pthread_create( &thr[p-1], NULL , the_thread_func ,(void*) arraystuff[p-1]);
  





  for(int i=0;i<p;i++) {
    pthread_join(thr[i], NULL);

    pi += arraystuff[i]->sum;
  }




/*
  for (i = 1; i <= intervals; i++) { 
    x = dx*(i - 0.5);
    sum += dx*4.0/(1.0 + x*x);
  }
*/
  printf("PI is approx. %.16f\n",  pi);

  return 0;
}
