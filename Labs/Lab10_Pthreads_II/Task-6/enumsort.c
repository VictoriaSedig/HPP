/**********************************************************************
 * Enumeration sort
 *
 **********************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <sys/time.h>
#include <math.h>


#define NUM_THREADS	5
#define len 100000

static double get_wall_seconds() {
  struct timeval tv;
  gettimeofday(&tv, NULL);
  double seconds = tv.tv_sec + (double)tv.tv_usec / 1000000;
  return seconds;
}

double indata[len], outdata[len];

void *findrank(void *arg)
{
	int rank,i;
	long thread=(long)arg;
  int start = round(len/NUM_THREADS)*(thread);
  int stop = round(len/NUM_THREADS)*(thread+1);
 if (thread == NUM_THREADS){
    stop = len; }

	
 for(int j=start;j<stop;j++){
  rank=0;
	for (i=0;i<len;i++){
		if (indata[i]<indata[j]){
      rank++;
    }
	outdata[rank]=indata[j];}
}
  pthread_exit(NULL);

}


int main(int argc, char *argv[]) {
	
  pthread_t threads[NUM_THREADS];
  pthread_attr_t attr;
  int i, t;
  long el;
  void *status;
  
  pthread_attr_init(&attr);
  pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_JOINABLE);	

  // Generate random numbers
  for (i=0;i<len;i++){
      indata[i]=drand48();
      outdata[i]=-1.0;
  }

  // Enumeration sort
  double startTime = get_wall_seconds();

	for(t=0; t<NUM_THREADS; t++) {
		el=t;
		  pthread_create(&threads[t], &attr, findrank, (void *)el); }


  
  //for (j=0;j<len;j+=NUM_THREADS){		
		for(t=0; t<NUM_THREADS; t++) {
			pthread_join(threads[t], &status);
    }
  //  }
  
  double timeTaken = get_wall_seconds() - startTime;
  printf("Time: %f  NUM_THREADS: %d\n", timeTaken, NUM_THREADS);

  // Check results, -1 implies data same as the previous element
    for (i=0; i<len-1; i++)
      if (outdata[i]>outdata[i+1] && outdata[i+1]>-1)
	printf("ERROR: %f,%f\n", outdata[i],outdata[i+1]);

  return 0;
}
