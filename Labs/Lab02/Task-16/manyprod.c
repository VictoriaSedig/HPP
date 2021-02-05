#include <stdio.h>
#include <stdlib.h>

typedef struct product
{
char name[50];
double price;
}
product_t;

int main(){
    int n;
    FILE *fp;
    fp = fopen("../data.txt","r");
    fscanf(fp, "%d", &n);
    struct product* arr_of_prod = malloc(n * sizeof(struct product));


    for (int i = 0; i < n; i++) {
        fscanf(fp, "%s %lf", arr_of_prod[i].name, &arr_of_prod[i].price);
        printf("%s %lf \n", arr_of_prod[i].name, arr_of_prod[i].price);
    }
    return 0;


}
