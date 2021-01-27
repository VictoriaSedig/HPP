#include <stdio.h>
#include <stdlib.h>
#include <math.h>


int main(){
float a;
float b;
char op;

scanf("%f %c %f",&a, &op, &b);

    switch(op)
    {
        case '+':
            printf("%f + %f = %f",a, b, a+b);
            break;

        case '-':
            printf("%f - %f = %f",a, b, a-b);
            break;

        case '*':
            printf("%f * %f = %f",a, b, a*b);
            break;

        case '/':
            printf("%f / %f = %f",a, b, a/b);
            break;

        // operator doesn't match any case constant +, -, *, /
        default:
            printf("Error! operator is not correct");
    }

//printf("%f %c %f", a, op, b);
    ////////Use of switch statement found at:
// https://www.programiz.com/c-programming/c-switch-case-statement
}
