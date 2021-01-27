#include <stdio.h>
#include <stdlib.h>
#include <math.h>



int main(){

int a;
int save;

printf("Enter a: ");
scanf("%d", &a);
save = a;

while(a>=10){

a = a/10;
}

if(a%2==0){
	printf("The first integer in %d is even", save);
}
else{
	printf("The first integer in %d is odd", save);


}

}