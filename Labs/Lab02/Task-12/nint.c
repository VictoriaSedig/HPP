#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main()
{
int *arr=(int *)malloc(1*sizeof(int)); 
int *prime=(int *)malloc(1*sizeof(int)); 
int n;
int integer;
int flag=0;
int l =0;

printf("Type n: ");
scanf("%d", &n);
arr=(int*)realloc(arr, n*sizeof(int)); 

for (int i = 0; i < n; ++i){
printf("Type integer: ");
scanf("%d:\n",&integer);
arr[i] = integer;
}

for(int j=0; j<n; j++){

for (int k = 2; k < arr[j]-1; ++k){
    if (arr[j] % k == 0) {
        flag += 1;
        }
}
if (flag != 0){
    l += 1;
    prime=(int*)realloc(prime, l*sizeof(int)); 
    prime[l-1] = arr[j];
    }

flag=0;
}

for(int h=0; h<l; h++){
printf("%d, ",prime[h] );
    }
printf("\n The size of the array is %ld bytes and %d integers long\n", sizeof(prime), l);
}