#include<bits/stdc++.h>
using namespace std;

const int numParticles = 1000;
const float timeStep = 0.1f;

struct Particle {
    float x, y, vx, vy;
};

void updateParticles(Particle* particles, int numParticles, float timeStep) {
    for (int id = 0; id < numParticles; ++id) {
        // updating the particle pos. by using velocit
        particles[id].x += particles[id].vx * timeStep;
        particles[id].y += particles[id].vy * timeStep;

        // applying small forces on particles.
        particles[id].vx += 0.1f * sinf(particles[id].y);
        particles[id].vy -= 0.1f * cosf(particles[id].x);
    }
}

int main() {
    Particle* particles = new Particle[numParticles]; //memory alloc. for particles

    // Initialize particle positions and velocities
    for (int i = 0; i < numParticles; ++i) {
        particles[i].x = static_cast<float>(rand()) / RAND_MAX;
        particles[i].y = static_cast<float>(rand()) / RAND_MAX;
        particles[i].vx = 0.1f * (static_cast<float>(rand()) / RAND_MAX - 0.5f);
        particles[i].vy = 0.1f * (static_cast<float>(rand()) / RAND_MAX - 0.5f);
    }

    // Run the simulation for a number of time steps so that it will update particle pos every time
    for (int step = 0; step < 1000; ++step) {
        updateParticles(particles, numParticles, timeStep);
    }

    // to store output i.e positions of particle
    ofstream outputFile("particle_positions.txt");

    // Write particle positions to the file
    for (int i = 0; i < numParticles; ++i) {
        outputFile << particles[i].x << " " << particles[i].y << endl;
    }

    delete[] particles; //memory clean up 

    outputFile.close(); // closing O/P file after writing particle positions in it. 

    return 0;
}


