#include <stdio.h>
#include <omp.h>
#include <stdlib.h>




int main(int argc, char const *argv[])
{
	printf("Set %d \n", omp_get_nested());
	omp_set_nested(1);
	printf("Set %d\n", omp_get_nested());

	#pragma omp parallel
	{ 
		printf("There are now %d # of threads in outer\n", omp_get_num_threads());
		
	#pragma omp parallel 
		{
		printf("There are now %d # of threads in inner\n", omp_get_num_threads());
		printf("Pid %d \n", omp_get_thread_num());

	}
	}

	return 0;
}