#include <stdio.h>
#include <stdlib.h>

int main(){
int n=5;
//int **A = (int **)malloc(n*sizeof(int *));
int A[n][n]; 


for(int i =0; i<n; i++){
//A[i] = (int *)malloc(n*sizeof(int));
for(int j =0; j<n; j++){

	if(i==j){
	A[i][j]= 0;
	}
	else if(j<i){
	A[i][j]= -1;
	}
	else{A[i][j]= 1;
	}
}
}


for(int i =0; i<n; i++){
for(int j =0; j<n; j++){

printf("%2d ", A[i][j]);
if(j==n-1){

	printf("\n");

}

}
}
}
