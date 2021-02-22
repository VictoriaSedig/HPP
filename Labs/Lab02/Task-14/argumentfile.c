#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]){
    int n;
    FILE *fp = fopen("/input_data/"+argv[1],"r");
    fscanf(fp, "%d", &n);
    char *thing = (char*)malloc(50*sizeof(char));
    char *amount = (char*)malloc(50* sizeof(char));

    for (int i = 0; i < n; i++) {
        fscanf(fp, "%s %s", thing, amount);
        printf("%s %s \n", thing, amount);
    }
    return 0;
}