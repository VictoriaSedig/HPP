#include <stdio.h>
#include <stdlib.h>
#include <math.h>


// Reading and opening file
int main(){
    FILE *fp;
    fp = fopen("little_bin_file","r");
    // Defining a buffer for each variable
    int bufferi;
    double bufferd;
    char bufferc;
    float bufferf;

    // Reading in the variables into the buffer
	fread(&bufferi, sizeof(int), 1, fp);
	fread(&bufferd,  sizeof(double), 1, fp);
	fread(&bufferc, sizeof(char), 1 , fp);
	fread(&bufferf, sizeof(float), 1, fp);

    // Printing the saved variables
  	printf("%d %lf %c %f \n ",bufferi, bufferd, bufferc, bufferf);

    // Close document
	fclose(fp);
}