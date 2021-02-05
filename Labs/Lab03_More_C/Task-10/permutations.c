#include <stdio.h>
#include <string.h>
#include <math.h>
#include <time.h>

/*
Find all permutations of a string.

Code: http://www.geeksforgeeks.org/write-a-c-program-to-print-all-permutations-of-a-given-string/
*/

unsigned long count = 0; // count permutations

/* Swap values pointed by x and y */
void swap(char *x, char *y)
{
   char tmp;

   tmp = *x;
   *x  = *y;
   *y  = tmp;
}


/* Function to print permutations of string
 * This function takes three parameters:
 * 1. String
 * 2. Starting index of the string
 * 3. Ending index of the string. */
void permute(char *a, int l, int r)
{
   if (l == r)
   {
      //printf("%s\n", a);
      count++;
      return;
   }

   for (int i = l; i <= r; i++)
   {
      swap((a + l), (a + i));
      permute(a, l + 1, r);
      swap((a + l), (a + i)); //backtrack
   }
}


int main(int argc, char const *argv[])
{
   struct timespec start, stop;
   clock_gettime(CLOCK_REALTIME, &start) ;

   if (argc != 2)
   {
      printf("Usage: %s string\n", argv[0]);
      return -1;
   }
   char str[100];
   strcpy(str, argv[1]);
   printf("Permutations of %s are:\n", str);
   int n = strlen(str);
   permute(str, 0, n - 1);
   printf("In total %ld permutations\n", count);
   clock_gettime(CLOCK_REALTIME, &stop) ;
   printf("Gettime %f\n", stop.tv_sec-start.tv_sec+(stop.tv_nsec-start.tv_nsec)/pow(10,9));
   return 0;


}





/*
A char is one byte.
We always output integer, 4 bytes. 
AUX 4 bytes
N number of chars:
N+8 -> N+C -> O(N)
Linear independence


T = n + 0.000212

T = 2n + 0.000212

T = 3n + 0.000205

T = 4n + 0.000201

T = 5n + 0.000196

T = 6n + 0.000275

T = 7n + 0.000662

T = 8n + 0.002591

T = 9n + 0.018668

T = 10n + 0.126558

T = 11n + 1.155912

T = 12n + 14.471534

T = 13n + 185.967400

Time complexity  O(exp(N)) ##### O(N*N!)



*/
