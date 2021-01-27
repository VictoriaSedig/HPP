#include <stdio.h>
#include <stdlib.h>
#include <math.h>


void swap_nums(int* x, int* y){

int save = *x;
*x= *y;
*y=save;


}

void swap_pointers(char** s1, char** s2){

char* sav = *s1;
*s1= *s2;
*s2=sav;


}


int main()
{
int a,b;
char *s1,*s2;
a = 3; b=4;
swap_nums(&a,&b);
printf("a=%d, b=%d\n", a, b);
s1 = "second"; s2 = "first";
swap_pointers(&s1,&s2);
printf("s1=%s, s2=%s\n", s1, s2);
return 0;
}

