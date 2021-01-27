#include <stdio.h>
#include <stdlib.h>
#include <math.h>



int main(){

int a;
int rest;
int pol;
int save; 

printf("Enter a: \n");
scanf("%d", &a);
save = a;
pol = 0;
while(a>0){

///a= a/10;
///printf("%d \n", abs(d));
rest = a % 10;

pol = pol *10 + rest;

a = a/10;

//printf("%d\n",pol );

}

if (save==pol){
printf("Yes it is palindrome");
}
else{
	printf("No it is not palidrome");
}
}