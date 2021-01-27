#include <stdio.h>
#include <stdlib.h>
#include <math.h>



int main(){

int num;

printf("Enter an integer: ");
scanf("%d", &num);

double number = sqrt(num);
if (number== abs(number)){

	printf("The number you enetred is a perfect squere. %d = %d^2", num, abs(number));
}
else{
	printf("%d is not a perfect squere\n", num);
}



}




