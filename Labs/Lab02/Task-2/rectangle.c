#include <stdio.h>
int main(){
int a;
int b;
int i;
int j;
int k;
//// Assuming a,b>2
printf("Enter a: ");
scanf("%d", &a);
printf("Enter b: ");
scanf("%d", &b);

// The first line
for(i=0; i<b;i++ ){
	printf("*");
}
printf("\n");

// The part inbetween
for(j=0; j<(a-2); j++){

	printf("*");
	for(k=0; k<(b-2); k++){
	printf(".");
	}
	printf("*\n")
}

// The last line
for(i=0; i<b;i++ ){
	printf("*");
}
}
