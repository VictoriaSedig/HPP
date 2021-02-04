#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>



int main(){


struct timespec start, stop;

int n1,n2;
int m1,m2;
int i,j;
//int A[n][n]; 

printf("Put the size you want of the first matrix\n");
scanf("%d %d", &n1, &m1);
printf("Put the size you want of the second matrix\n");
scanf("%d %d", &n2, &m2);

clock_gettime(CLOCK_REALTIME, &start) ;	

if(m1!=n2){
	printf("Error the dimensions to do the multiplication is not right.\n");
}

int A[n1][m1]; 
int B[n2][m2]; 
int Res[n1][m2];

for(i =0; i<n1; i++){
for(j =0; j<m1; j++){
A[i][j]= rand() % 4;
}
}

for(int k =0; k<n2; k++){
for(int l =0; l<m2; l++){
B[k][l]= rand() % 4;	
}
}

for(int f =0; f<n1; f++){
for(int g =0; g<m2; g++){
Res[f][g] = 0;	
}
}
//for(int p =0; p<n2; p++){
for(int f =0; f<n1; f++){
for(int p =0; p<m2; p++){
for(int g =0; g<n2; g++){
Res[f][p] += A[f][g] *B[g][p] ;	
}
}
}

 clock_gettime(CLOCK_REALTIME, &stop) ;
 printf("Gettime %f\n", stop.tv_sec-start.tv_sec+(stop.tv_nsec-start.tv_nsec)/pow(10,9));


/*
//printf("zer %d \n", 0*0);
for(i =0; i<n1; i++){
for(j =0; j<m1; j++){

printf("%2d ", A[i][j]);
if(j==m1-1){

	printf("\n");

}

}
}


for(i =0; i<n2; i++){
for(j =0; j<m2; j++){

printf("%2d ", B[i][j]);
if(j==m2-1){

	printf("\n");

}

}
}









for(i =0; i<n1; i++){
for(j =0; j<m2; j++){

printf("%2d ", Res[i][j]);
if(j==m2-1){

	printf("\n");

}

}
}


*/

}
