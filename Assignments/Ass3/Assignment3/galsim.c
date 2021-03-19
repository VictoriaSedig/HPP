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
        exit(0);    }
// Defininf constants
    const int N = atoi(argv[1]);
    const int nsteps = atoi(argv[3]);
    const double delta_t = atof(argv[4]);
    const int graphics = atoi(argv[5]);

    char* filename = argv[2];
    FILE* fp = fopen(filename, "r");

    struct particle
    {
        
        double p_x;
        double p_y;
        double m;
        double v_x;
        double v_y;
        double b;
        double a_x;
        double a_y;
        double F_x;
        double F_y;
    };



    struct particle * particles = calloc(N, sizeof(*particles));
   if (particles == NULL) {
        printf("Not enough memory for all particles\n");
        return 0;
    } 

   // struct particle particles[N];

    double init[N * 6];



    const int G = 100 / N;
    const float circleRadius = 0.005, circleColor = 0;
    const int windowWidth = 800;
    double r;
    double r_x;
    double r_y;
    const int e = 10 ^ -3;
    int i, n;
    register int j;
    double sum_y;
    double sum_x;
    double temp_F_x;
    double temp_F_y;
    //const float L = 1, W = 1;
    struct particle particles_i;

    if(graphics ==1){
    InitializeGraphics(argv[5], windowWidth, windowWidth);
    SetCAxes(0, 1);}


    //Loops all particles over nsteps

    for (i = 0; i < N ; i++) {
        fread(init, 6*sizeof(double), 1, fp);
        particles[i].p_x = init[0];
        particles[i].p_y = init[1];
        particles[i].v_x = init[3];
        particles[i].v_y = init[4];
        particles[i].m = init[2];
        particles[i].b = init[5];


    }



    fclose(fp);
    //Loops all particles over nsteps
  /*  for (n = 0; n < nsteps; n++) {
        //Loops for particle i

        //for (int i = 0; i < N; i++) { // we need to clear the previous values in the force indexes to not fuck up the next timestep.
          //  particles[i].a_x = 0;
           // particles[i].a_y = 0;
        //}
        for (i = 0; i < N ; i++) {
            particles_i = particles[i];
            //Loop over how particle j affects particle i





            for (j = 0; j < N ; j++) {
                    r_x = (particles_i.p_x - particles[j].p_x);
                    r_y = (particles_i.p_y - particles[j].p_y);
                    r = sqrt(pow(r_x, 2) + pow(r_y, 2));
                    sum_x += r_x / (r + e);
                    sum_y += r_y / (r + e);
                
                    temp_F_x = -G  * sum_x;
                    temp_F_y = -G  * sum_y;
                    particles_i.a_x = particles_i.a_x + temp_F_x * particles[j].m;
                    particles_i.a_y = particles_i.a_y + temp_F_y * particles[j].m;
                    particles[j].a_x = particles[j].a_x - temp_F_x * particles[i].m;
                    particles[j].a_y = particles[j].a_y - temp_F_x * particles[i].m;
                        



            }

           
            sum_x = 0;
            sum_y = 0;

        }

        for (int k = 0; k < N; k++) {
            particles[k].v_x = particles[k].v_x + delta_t * particles[k].a_x;
            particles[k].v_y = particles[k].v_y + delta_t * particles[k].a_y;
            particles[k].p_x = particles[k].p_x + delta_t * particles[k].v_x;
            particles[k].p_y = particles[k].p_y + delta_t * particles[k].v_y;
        
        }

        //printf("%f\n",particles[5].p_x );
            if(graphics==1){
                ClearScreen();
            for(int f=0; f<N; f++){
                DrawCircle(particles[f].p_x, particles[f].p_y, 1, 1, circleRadius, circleColor);
            }
        
        }
            if(graphics==1){
            Refresh();
            usleep(3000);
        }

    }
    */



     //Loops all particles over nsteps
    for (n = 0; n < nsteps; n++) {
        //Loops for particle i
        for (i = 0; i < N ; i++) {
            particles_i = particles[i];
            //Loop over how particle j affects particle i
            for (j = 0; j < i ; j++) {
                    r_x = (particles_i.p_x - particles[j].p_x);
                    r_y = (particles_i.p_y - particles[j].p_y);
                    r = sqrt(pow(r_x, 2) + pow(r_y, 2));
                    sum_x += particles[j].m * r_x / (r + e);
                    sum_y += particles[j].m * r_y / (r + e);
                
            }

            particles_i.F_x = -G * particles_i.m * sum_x;
            particles_i.F_y = -G * particles_i.m * sum_y;
            particles_i.a_x = particles_i.F_x / particles_i.m;
            particles_i.a_y = particles_i.F_y / particles_i.m;
            sum_x = 0;
            sum_y = 0;

        }

        for (int k = 0; k < N; k++) {
            particles[k].v_x = particles[k].v_x + delta_t * particles[k].a_x;
            particles[k].v_y = particles[k].v_y + delta_t * particles[k].a_y;
            particles[k].p_x = particles[k].p_x + delta_t * particles[k].v_x;
            particles[k].p_y = particles[k].p_y + delta_t * particles[k].v_y;
        
        }

        //printf("%f\n",particles[5].p_x );
            if(graphics==1){
                ClearScreen();
            for(int f=0; f<N; f++){
                DrawCircle(particles[f].p_x, particles[f].p_y, 1, 1, circleRadius, circleColor);
            }
        
        }
            if(graphics==1){
            Refresh();
            usleep(3000);
        }

    }




    fp = fopen("result.gal", "w");

    for (i = 0; i < N; i++) { 

        fwrite(&particles[i], sizeof(double), 6, fp);
}

   

    fclose(fp);
    free(particles);

   // FlushDisplay();
  // CloseDisplay();

}







// Loop unrolling ̈́








/*








bad 
time ./a.out 1000 input_data/ellipse_N_01000.gal 100 0.00001 0

real    0m6.095s
user    0m6.033s
sys 0m0.020s

opti
time ./a.out 1000 input_data/ellipse_N_01000.gal 100 0.00001 0

real    0m5.887s
user    0m5.847s
sys 0m0.012s





*/



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
/*
int main(int argc, char* argv[]) {

    if (argc != 6) {
        printf("FIVE ARGUMENTS tard \n");
        exit(0);    }
// Defininf constants
    const int N = atoi(argv[1]);
    const int nsteps = atoi(argv[3]);
    const double delta_t = atof(argv[4]);
    const int graphics = atoi(argv[5]);

    const char* filename = argv[2];
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



    struct particle * particles = calloc(N, sizeof(*particles));
   if (particles == NULL) {
        printf("Not enough memory for all particles\n");
        return 0;
    } 

   // struct particle particles[N];

    double init[N * 6];



    const int G = 100 / N;
    const float circleRadius = 0.005, circleColor = 0;
    const int windowWidth = 800;
    double r;
    double r_x;
    double r_y;
    const int e = 10 ^ -3;
    int i, n;
    register int j;
    double sum_y;
    double sum_x;
    //const float L = 1, W = 1;
    struct particle particles_i;

    if(graphics ==1){
    InitializeGraphics(argv[5], windowWidth, windowWidth);
    SetCAxes(0, 1);}


    //Loops all particles over nsteps

    for (i = 0; i < N ; i++) {
        fread(init, 6*sizeof(double), 1, fp);
        particles[i].p_x = init[0];
        particles[i].p_y = init[1];
        particles[i].v_x = init[3];
        particles[i].v_y = init[4];
        particles[i].m = init[2];
    }


    fclose(fp);
    //Loops all particles over nsteps
    for (n = 0; n < nsteps; n++) {
        //Loops for particle i
        for (i = 0; i < N ; i++) {
            particles_i = particles[i];
            //Loop over how particle j affects particle i
            for (j = 0; j < i ; j++) {
                    r_x = (particles_i.p_x - particles[j].p_x);
                    r_y = (particles_i.p_y - particles[j].p_y);
                    r = sqrt(pow(r_x, 2) + pow(r_y, 2));
                    sum_x += particles[j].m * r_x / (r + e);
                    sum_y += particles[j].m * r_y / (r + e);
                
            }

            particles_i.F_x = -G * particles_i.m * sum_x;
            particles_i.F_y = -G * particles_i.m * sum_y;
            particles_i.a_x = particles_i.F_x / particles_i.m;
            particles_i.a_y = particles_i.F_y / particles_i.m;
            sum_x = 0;
            sum_y = 0;

        }

        for (int k = 0; k < N; k++) {
            particles[k].v_x = particles[k].v_x + delta_t * particles[k].a_x;
            particles[k].v_y = particles[k].v_y + delta_t * particles[k].a_y;
            particles[k].p_x = particles[k].p_x + delta_t * particles[k].v_x;
            particles[k].p_y = particles[k].p_y + delta_t * particles[k].v_y;
        
        }

        //printf("%f\n",particles[5].p_x );
            if(graphics==1){
                ClearScreen();
            for(int f=0; f<N; f++){
                DrawCircle(particles[f].p_x, particles[f].p_y, 1, 1, circleRadius, circleColor);
            }
        
        }
            if(graphics==1){
            Refresh();
            usleep(3000);
        }

    }


    fp = fopen("result.gal", "w");

    for (i = 0; i < N; i++) { 

        fwrite(&particles[i], sizeof(double), 6, fp);
}

   

    fclose(fp);
    free(particles);

   // FlushDisplay();
  // CloseDisplay();

}







// Loop unrolling ̈́



*/




/*








bad 
time ./a.out 1000 input_data/ellipse_N_01000.gal 100 0.00001 0

real    0m6.095s
user    0m6.033s
sys 0m0.020s

opti
time ./a.out 1000 input_data/ellipse_N_01000.gal 100 0.00001 0

real    0m5.887s
user    0m5.847s
sys 0m0.012s





*/
