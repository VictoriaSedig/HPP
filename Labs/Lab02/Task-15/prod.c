#include <stdio.h>
#include <stdlib.h>

typedef struct product
{
char name[50];
double price;
}
product_t;


int main(){

    product_t arr_of_prod[100];
    int n;
    FILE *fp;
    fp = fopen("../data.txt","r");
    fscanf(fp, "%d", &n);

    for (int i = 0; i < n; i++) {
        fscanf(fp, "%s %lf", arr_of_prod[i].name, &arr_of_prod[i].price);
        printf("%s %lf \n", arr_of_prod[i].name, arr_of_prod[i].price);
    }
    return 0;


}