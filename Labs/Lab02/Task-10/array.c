#include <stdio.h>
#include <stdlib.h>
#include <math.h>


void print_array(int* array, int n){
int j;
for(j = 0; j < n; j++){
  printf("%d ", array[j]);
}
  

}


int main()
{
int *arr;
int n;
printf("Write length of array:");
scanf("%d", &n);
arr = (int *)malloc(n*sizeof(int));
for(int i=0; i<n; ++i) arr[i] = rand() % 100; // random number from 0 to 99
print_array(arr, n);
return 0;
}
