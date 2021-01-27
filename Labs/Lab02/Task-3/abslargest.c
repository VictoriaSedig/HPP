#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(){
float  a;
float  b;
float  c;

printf("Enter a: ");
scanf("%f", &a);
printf("Enter b: ");
scanf("%f", &b);
printf("Enter c: ");
scanf("%f", &c);

a = fabs(a);
b = fabs(b);
c = fabs(c);

printf("Largest value is:\n");
if(a>=b && a>=c){
printf("%f", a);
}
else if(b>=a && b>=c){
printf("%f", b);
}
else {
printf("%f",c);
}


}
