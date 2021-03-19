#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "graphics/graphics.h"

typedef double vector_t __attribute__((vector_size(2*sizeof(double))));

typedef struct star {
    vector_t pos;
    double mass;
    vector_t vel;
    double bright;
    vector_t acc;
} star_t;


int main(int argc, char *argv[]) {
    if (argc != 6) {
        printf("Please run the program in the fillowing way:\n");
        printf("./galsim N filename nsteps delta_t graphics\n");
        printf("where the input arguments have the following meaning: \n");
        printf("N is the number of stars/particles to simulate.\n");
        printf("filename is the filename of the file to read the initial configuration from.\n");
        printf("nsteps is the number of timesteps.\n");
        printf("delta_t is the timestep dt.\n");
        printf("graphics is 1 or 0 meaning graphics on/off.\n");
        return 0;
    }


    const int N = atoi(argv[1]);    // Store argv values  in corresponding variables so
    const char *filename = argv[2]; // that we dont have to convert them everytime we use them
    const int nsteps = atoi(argv[3]);
    const double delta_t = atof(argv[4]);
    const int graphics = atoi(argv[5]);

    star_t * particles = calloc(N, sizeof(*particles));
    if (particles == NULL) {
        printf("Not enough memory for all particles\n");
        return 0;
    }
    //star_t particles[N];
    const vector_t zerovector = {0,0};
    //zerovector[0] = 0;
    //zerovector[1] = 0;

    const double negG = -100./N; // gravitational constant
    //double epsilon = 0.001; // smoothing constant in denominator

    FILE *fp;
    fp = fopen(filename, "r");
    if (fp == NULL) {
        printf("File not found!");
        return 0;
    }



    double buffer[6]; // file readning buffer variable
    for (int i = 0; i < N; i++) { // rewrite this so we don't repeat the fread lines, it is a bad habit to repeat code like that
        star_t temp;

        fread(&buffer, sizeof(double), 6, fp);
        temp.pos[0] = buffer[0];
        temp.pos[1] = buffer[1];
        temp.mass = buffer[2];
        temp.vel[0] = buffer[3];
        temp.vel[1] = buffer[4];
        temp.bright = buffer[5];
        temp.acc = zerovector;
        particles[i] = temp;
        /*
        printf("Pos_x: %lf\n", buffer[0]);
        printf("Pos_y: %lf\n", buffer[1]);
        printf("Vel_x: %lf\n", buffer[3]);
        printf("Vel_y: %lf\n", buffer[4]);
        */
    }

        fclose(fp);

    if (graphics) {
        InitializeGraphics(argv[0], 800, 800); // initialize graphixs window
        SetCAxes(0,1);
        ClearScreen();
        for (int i = 0; i < N; i++) {
            DrawCircle(particles[i].pos[0], particles[i].pos[1], 1, 1, 0.005 * particles[i].mass, 0); // display the initial points
        }
        Refresh();
        usleep(3000);
    }

    // add graphics thing when running program
    // loop things below here to step in time

    for (int step = 0; step < nsteps; step++) { // time stepping

        for (int i = 0; i < N; i++) { // we need to clear the previous values in the force indexes to not fuck up the next timestep.
            particles[i].acc = zerovector;
        }

        for (int i = 0; i < N; i++) {
            for (int j = 0; j < i; j++) {
                vector_t diff = particles[i].pos - particles[j].pos;
                vector_t denomdiff = diff * diff;

                double denom = sqrt(denomdiff[0] + denomdiff[1]) + 0.001; // denominator is distance + epsilon for smoothing
                double nondirectedForce = negG / (denom * denom * denom); // the "undirected" part of the force

                vector_t acc_temp = nondirectedForce * diff;

                particles[i].acc = particles[i].acc + acc_temp * particles[j].mass;
                particles[j].acc = particles[j].acc - acc_temp * particles[i].mass;
            }
        }

        // add euler stepping here for all points
        for (int i = 0; i < N; i++) {
            particles[i].vel = particles[i].vel + delta_t * particles[i].acc;
            particles[i].pos = particles[i].pos + delta_t * particles[i].vel;
        }

        // update graphics here??
        if (graphics) {
            ClearScreen();
            for (int i = 0; i < N; i++) {
                DrawCircle(particles[i].pos[0], particles[i].pos[1], 1, 1, 0.005 * particles[i].mass, 0); // display the position of the points for the current timesteps
            }
            Refresh();
            usleep(1);
        }
    }

    fp = fopen("result.gal", "w");

    for (int i = 0; i < N; i++) { // result output to result.gal binary file
        //fwrite(&particles[i], sizeof(double), 6, fp); // can this work?

        fwrite(&particles[i], sizeof(double), 4, fp);
        fwrite(&particles[i].vel[1], sizeof(double), 2, fp);

        /*
        fwrite(&particles[i].pos[0], sizeof(particles[i].pos[0]), 1, fp);
        fwrite(&particles[i].pos[1], sizeof(particles[i].pos[1]), 1, fp);
        fwrite(&particles[i].mass, sizeof(particles[i].mass), 1, fp);
        fwrite(&particles[i].vel[0], sizeof(particles[i].vel[0]), 1, fp);
        fwrite(&particles[i].vel[1], sizeof(particles[i].vel[0]), 1, fp);
        fwrite(&particles[i].bright, sizeof(particles[i].bright), 1, fp);
        */
    }

    fclose(fp);
    free(particles);

    if (graphics) {
        FlushDisplay();
        CloseDisplay();
    }
    return 0;
}