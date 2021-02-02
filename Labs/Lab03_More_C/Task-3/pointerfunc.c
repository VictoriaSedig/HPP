#include <stdio.h>
#include <stdlib.h>


void print_int_1(int x) {
printf("Here is the number: %d\n", x);
}
void print_int_2(int x) {
printf("Wow, %d is really an impressive number!\n", x);
}


int main(int argc, char const *argv[])
{
    void (*fun_ptr)(int);
    fun_ptr = &print_int_1; 
	(*fun_ptr)(10);
	fun_ptr = &print_int_2; 
	(*fun_ptr)(8);
	
}


