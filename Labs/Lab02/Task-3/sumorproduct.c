#include <stdio.h>

int main(){

int a;
int b;

printf("Enter a: ");
scanf("%d", &a);
printf("Enter b: ");
scanf("%d", &b);



if(a%2 == 0 && b%2 == 0){

	printf("%d\n",a+b);
}
else{

	printf("%d\n", a*b);
}

}