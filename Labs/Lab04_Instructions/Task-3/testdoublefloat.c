#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <math.h>


/// Float became inf after 1000000000567641112624826207124609564672.000000
// Double: 9999999999999987386308663010565754864673185357885325953679283014273931461752478616490522233203549510799094951419522807003060396647156828508538524910655017390906952384492998178533583906787668105030864238802456828427540516153779060278892468183122016645826060660896937402633398956376021857262081478099959021568.000000

int main(int argc, char const *argv[])
{


/// Test 1
/*	
double numb = 10; 

	while(1){
		numb = numb*100;
		sleep(1);
		printf("%f\n",numb );

	} */


///// Test 2
/* 
float infnumb = 1000000000567641112624826207124609564672.000000;

printf("%f\n", infnumb );
infnumb = infnumb + 1;
printf("%f\n", infnumb );
// It just prints inf 
infnumb = infnumb/200000000;
printf("%f\n", infnumb ); */ 


//// Test 3

/*
double minus = -20;
minus = sqrt(minus);
printf("%f\n", minus );
minus = pow(minus,2);
printf("%f\n", minus );
minus = minus+1;
printf("%f\n", minus );
*/
// Still -nan


/// Test 4 

/// You will just se zero before C will see it as zero


/*	
float epsilon = 0.00001;

while(1){
epsilon = epsilon*0.5;
printf("%f\n", epsilon);

	if(epsilon+1 == 1){
		printf("Epsilon is now so small that it is basically 0 %f\n", epsilon);
	break;
	}
	
	}	
*/

}