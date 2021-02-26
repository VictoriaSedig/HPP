#include <stdio.h>
#include <omp.h>

void thread_func() {
	int thr_pid=omp_get_thread_num();
	int num_of_thr=omp_get_num_threads();

  printf("This is pid %d and there are %d num of threads!\n", thr_pid, num_of_thr);
}

int main(int argc, char** argv) {

#pragma omp parallel num_threads(8)
  {
    thread_func();
  }

  return 0;
}
