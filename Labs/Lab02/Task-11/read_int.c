#include <stdio.h>
#include <stdlib.h>
#include <math.h>


int main()
{
int i = 0;
char str;
int *arr=(int *)malloc(i*sizeof(int)); 
int j;
int suces;
int sum=0;


scanf("%c", &str); 
while(((47 < str && str < 58) || str == 32)){

    if((47 < str && str < 58)){
    i= i+1;
    arr=(int*)realloc(arr, i*sizeof(int)); 
    arr[i-1] = str-'0';
    scanf("%c", &str);

    while(str != 32 && (47 < str && str < 58)){
    arr[i-1] = 10*arr[i-1]+ (str-'0');
    scanf("%c", &str);
    }

    }
    else if(str == 32){
    scanf("%c", &str); 
    }
}

for(j=0; j<i; j++){
sum =sum + arr[j];
printf("%d\n",arr[j] );

}
printf("%d\n",sum );
}