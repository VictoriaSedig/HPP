#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(){
    FILE *fp;
    fp = fopen("little_bin_file","r");
    int bufferi;
    double bufferd;
    char bufferc;
    float bufferf;

	fread(&bufferi, sizeof(int), 1, fp);
	fread(&bufferd,  sizeof(double), 1, fp);
	fread(&bufferc, sizeof(char), 1 , fp);
	fread(&bufferf, sizeof(float), 1, fp);


  	printf("%d %lf %c %f \n ",bufferi, bufferd, bufferc, bufferf);


	fclose(fp);
}