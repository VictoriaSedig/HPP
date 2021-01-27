#include <stdio.h>
#include <stdlib.h>
#include <math.h>


int main(){

int i = 8;
double d = 8.8;
char c[] = "Hello";

int* pointer_i = &i;
double* pointer_d = &d;
char* pointer_c = c;



printf("The int %d has adress %p and memory size %ld in bytes.\n",i, pointer_i, sizeof(i));
printf("The double %f has adress %p and memory size %ld in bytes.\n",d, pointer_d, sizeof(d));
printf("The char %s has adress %p and memory size %ld in bytes.\n",c, pointer_c, sizeof(c));



}

