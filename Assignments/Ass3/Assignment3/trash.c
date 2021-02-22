#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h> 
#include "graphics/graphics.h"
#include <X11/Xlib.h>
#include <unistd.h>
#include <X11/Xutil.h>
    
    /*
    * File is read as:
    particle n position x
    particle n position y
    particle n mass
    particle n velocity x
    particle n velocity y
    particle n brightness
    length N*6
    */

    


int main(int argc, char* argv[]) {


    if (argc != 6) {

        printf("FIVE ARGUMENTS tard \n");
        exit(0);
    }


    //N * 6 * sizeof(double)
    int N = atoi(argv[1]);


    int nsteps = atoi(argv[3]);
    double delta_t = atof(argv[4]);
    int graphics = atoi(argv[5]);
    char* filename = argv[2];


    FILE* fp = fopen(filename, "r");


    struct particle
    {
        double F_x;
        double F_y;
        double p_x;
        double p_y;
        double v_x;
        double v_y;
        double a_x;
        double a_y;
        double m;
    };

    struct particle particles[N];

    double init[N * 6];
    /*
    * File is read as:
    particle n position x
    particle n position y
    particle n mass
    particle n velocity x
    particle n velocity y
    particle n brightness
    length N*6
    */


    fread(init, sizeof(init), 1, fp);

    fclose(fp);

    int G = 100 / N;

    const float circleRadius = 0.1, circleColor = 0;
    const int windowWidth = 800;

    double r;
    double r_x;
    double r_y;
    int e = 10 ^ -3;
    int i, j, n;
    double sum_y;
    double sum_x;
    float L = 1, W = 1;

    for (i = 0; i < N - 1; i++) {
        particles[i].p_x = init[i * 6];
        particles[i].p_y = init[i * 6 + 1];
        particles[i].v_x = init[i * 6 + 3];
        particles[i].v_y = init[i * 6 + 4];
        particles[i].m = init[i * 6 + 2];
        
    }


    //Loops all particles over nsteps
    for (n = 0; n < nsteps; n++) {
        //Loops for particle i
        
        for (i = 0; i < N - 1; i++) {

            //Loop over how particle j affects particle i
            for (j = 0; j < N - 1; j++) {
                if (j != i) {
                    r_x = (particles[i].p_x - particles[j].p_x);
                    r_y = (particles[i].p_y - particles[j].p_y);
                    r = sqrt(pow(r_x, 2) + pow(r_y, 2));
                    sum_x += particles[j].m * r_x / (r + e);
                    sum_y += particles[j].m * r_y / (r + e);

                }



            }
            

            particles[i].F_x = -G * init[i * 6 + 2] * sum_x;
            particles[i].F_y = -G * init[i * 6 + 2] * sum_y;
            particles[i].a_x = particles[i].F_x / init[i * 6 + 2];
            particles[i].a_y = particles[i].F_y / init[i * 6 + 2];
            sum_x = 0;
            sum_y = 0;

            particles[i].v_x = particles[i].v_x + delta_t * particles[i].a_x;
            particles[i].v_y = particles[i].v_y + delta_t * particles[i].a_y;
            particles[i].p_x = particles[i].p_x + delta_t * particles[i].v_x;
            particles[i].p_y = particles[i].p_y + delta_t * particles[i].v_y;
            
            
        
            



        }
        
        printf("%f \n", particles[5].p_y);


    }

    //FlushDisplay();
    //CloseDisplay();


}



int main(int argc, char* argv[]) {

    if (argc != 6) {
        printf("FIVE ARGUMENTS tard \n");
        exit(0);    }

    //N * 6 * sizeof(double)
    int N = atoi(argv[1]);
    int nsteps = atoi(argv[3]);
    double delta_t = atof(argv[4]);
    int graphics = atoi(argv[5]);
    char* filename = argv[2];

    FILE* fp = fopen(filename, "r");

    struct particle
    {
        double F_x[nsteps];
        double F_y[nsteps];
        double p_x[nsteps];
        double p_y[nsteps];
        double v_x[nsteps];
        double v_y[nsteps];
        double a_x[nsteps];
        double a_y[nsteps];
        double m[nsteps];
    };

    struct particle particles[N];

    double init[N * 6];


    fread(init, sizeof(init), 1, fp);
    fclose(fp);

    int G = 100 / N;

    const float circleRadius = 0.005, circleColor = 0;
    const int windowWidth = 800;

    double r;
    double r_x;
    double r_y;
    int e = 10 ^ -3;
    int i, j, n;
    double sum_y;
    double sum_x;
    float L = 1, W = 1;

    InitializeGraphics(argv[5], windowWidth, windowWidth);
    SetCAxes(0, 1);


    for (i = 0; i < N - 1; i++) {
        particles[i].p_x[0] = init[i * 6];
        particles[i].p_y[0] = init[i * 6 + 1];
        particles[i].v_x[0] = init[i * 6 + 3];
        particles[i].v_y[0] = init[i * 6 + 4];
        particles[i].m[0] = init[i * 6 + 2];
            }

    //Loops all particles over nsteps
    for (n = 0; n < nsteps; n++) {
        //Loops for particle i
        //usleep(3000000);
        //printf("Hello I do go here\n" );
        for (i = 0; i < N ; i++) { 
            //Loop over how particle j affects particle i
            for (j = 0; j < N ; j++) {
                if (j != i) {
                    r_x = (particles[i].p_x[n] - particles[j].p_x[n]);
                    r_y = (particles[i].p_y[n] - particles[j].p_y[n]);
                    r = sqrt(pow(r_x, 2) + pow(r_y, 2));
                    sum_x += particles[j].m[n] * r_x / (r + e);
                    sum_y += particles[j].m[n] * r_y / (r + e);

                }
            }

            particles[i].F_x[n] = -G * init[i * 6 + 2] * sum_x;
            particles[i].F_y[n] = -G * init[i * 6 + 2] * sum_y;
            particles[i].a_x[n] = particles[i].F_x[n] / init[i * 6 + 2];
            particles[i].a_y[n] = particles[i].F_y[n] / init[i * 6 + 2];
            sum_x = 0;
            sum_y = 0;

            particles[i].v_x[n + 1] = particles[i].v_x[n] + delta_t * particles[i].a_x[n];
            particles[i].v_y[n + 1] = particles[i].v_y[n] + delta_t * particles[i].a_y[n];
            particles[i].p_x[n + 1] = particles[i].p_x[n] + delta_t * particles[i].v_x[n + 1];
            particles[i].p_y[n + 1] = particles[i].p_y[n] + delta_t * particles[i].v_y[n + 1];
            
            
            //printf("%f", particles[5].p_y[n]);
       

        }
        ClearScreen();

        for(i=0; i<N; i++){
        DrawCircle(particles[i].p_x[n], particles[i].p_y[n], L, W, circleRadius*particles[i].m[n], circleColor);

        }


          //Sleep a short while to avoid screen flickering. 
           // printf("%f \n", particles[5].p_y[n]);
            //keep_within_box(&particles[5].p_x[n],&particles[5].p_y[n]);
            //DrawCircle(1,1, L, W, circleRadius, circleColor);
            Refresh();
            usleep(30000);

    }
    // FlushDisplay();
  //  FlushDisplay();
  //  CloseDisplay();

}




int main(int argc, char* argv[]) {


    if (argc != 6) {

        printf("FIVE ARGUMENTS tard \n");
        exit(0);
    }


    //N * 6 * sizeof(double)
    int N = atoi(argv[1]);


    int nsteps = atoi(argv[3]);
    double delta_t = atof(argv[4]);
    int graphics = atoi(argv[5]);
    char* filename = argv[2];


    FILE* fp = fopen(filename, "r");


    struct particle
    {
        double F_x[nsteps];
        double F_y[nsteps];
        double p_x[nsteps];
        double p_y[nsteps];
        double v_x[nsteps];
        double v_y[nsteps];
        double a_x[nsteps];
        double a_y[nsteps];
        double m[nsteps];
    };

    struct particle particles[N];

    double init[N * 6];
    
    * File is read as:
    particle n position x
    particle n position y
    particle n mass
    particle n velocity x
    particle n velocity y
    particle n brightness
    length N*6
    


    fread(init, sizeof(init), 1, fp);

    fclose(fp);

    int G = 100 / N;

    const float circleRadius = 0.005, circleColor = 0;
    const int windowWidth = 800;

    double r;
    double r_x;
    double r_y;
    int e = 10 ^ -3;
    int i, j, n;
    double sum_y;
    double sum_x;
    float L = 1, W = 1;

    for (i = 0; i < N - 1; i++) {
        particles[i].p_x[0] = init[i * 6];
        particles[i].p_y[0] = init[i * 6 + 1];
        particles[i].v_x[0] = init[i * 6 + 3];
        particles[i].v_y[0] = init[i * 6 + 4];
        particles[i].m[0] = init[i * 6 + 2];
        
    }
    InitializeGraphics(argv[5], windowWidth, windowWidth);
    SetCAxes(0, 1);


    //Loops all particles over nsteps
    for (n = 0; n < nsteps; n++) {
        //Loops for particle i
        //usleep(3000000);

        //ClearScreen();

        for (i = 0; i < N - 1; i++) {

            //Loop over how particle j affects particle i
            for (j = 0; j < N - 1; j++) {
                if (j != i) {
                    r_x = (particles[i].p_x[n] - particles[j].p_x[n]);
                    r_y = (particles[i].p_y[n] - particles[j].p_y[n]);
                    r = sqrt(pow(r_x, 2) + pow(r_y, 2));
                    sum_x += particles[j].m[n] * r_x / (r + e);
                    sum_y += particles[j].m[n] * r_y / (r + e);

                }



            }
            

            particles[i].F_x[n] = -G * init[i * 6 + 2] * sum_x;
            particles[i].F_y[n] = -G * init[i * 6 + 2] * sum_y;
            particles[i].a_x[n] = particles[i].F_x[n] / init[i * 6 + 2];
            particles[i].a_y[n] = particles[i].F_y[n] / init[i * 6 + 2];
            sum_x = 0;
            sum_y = 0;

            particles[i].v_x[n + 1] = particles[i].v_x[n] + delta_t * particles[i].a_x[n];
            particles[i].v_y[n + 1] = particles[i].v_y[n] + delta_t * particles[i].a_y[n];
            particles[i].p_x[n + 1] = particles[i].p_x[n] + delta_t * particles[i].v_x[n + 1];
            particles[i].p_y[n + 1] = particles[i].p_y[n] + delta_t * particles[i].v_y[n + 1];

            DrawCircle(particles[i].p_x[n], particles[i].p_y[n], L, W, circleRadius, circleColor);

            Refresh();
            usleep(30000);






        }
        Sleep a short while to avoid screen flickering. 
            printf("%f \n", particles[5].p_y[n]);


    }

  //  FlushDisplay();
  //  CloseDisplay();

} 





int runge_kutta(int *N, int* nsteps, double* delta_t){
int i;
int G;
double m;

for(i=0; i<N; i++)


}





int main(int argc, char *argv[]){
    
    if(argc!= 5){
        printf("Error, wrong amound of input\n");
        exit(0);
    }


    int N = atoi(argv[1]);
    char path[]="/input_data/";
    strcat("/input_data/",argv[2]);
    //FILE *fp = fopen("/input_data/","r"); 
    FILE *fp= fopen("input_data/ellipse_N_00010.gal", "r");
    char *thing = (char*)malloc(100*sizeof(char));
    fscanf(fp, "%s", thing);
    printf("%s \n", thing);


    int nsteps = atoi(argv[3]);
    double delta_t = atof(argv[4]);
    int graphics = atoi(argv[5]);

   // runge_kutta(N, );


    free(thing);


    return 0;
}