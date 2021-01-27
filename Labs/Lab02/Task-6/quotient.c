#include <stdio.h>
#include <stdlib.h>
#include <math.h>



int main(){

int a;
int b;
int qua;
int rem;

printf("Enter dividend: ");
scanf("%d", &a);

printf("Enter divisor: ");
scanf("%d", &b);

qua = abs(a/b);

rem= a%qua;

printf("Dividend: %d \n Divisor: %d \n Quotient: %d \n Remainder: %d", a, b, qua, rem);

}
