#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int binom(int n,int k){
if (n==k) return 1;
if (k==0) return 1;
return binom(n-1,k-1) + binom(n-1, k);
}
int main(int argc, char *argv[]){
        char *a = argv[1];
        int row = atoi(a);
        int k;
        int n;

for(n=0; n<row; n++){
        for(k=0; k<=n; k++){
        if (n==k){
                printf("%d\n",binom(n,k));
        }
        else{
        printf("%d ",binom(n,k));
        }
}
}
}
