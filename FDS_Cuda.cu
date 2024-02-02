// %%cu
#include<bits/stdc++.h>
#include <cuda_runtime.h>
using namespace std;

const int numParticles = 1000;
const float timeStep = 0.1f;

struct Particle {
    float x, y, vx, vy;
};

// CUDA kernel for updating particle positions
__global__ void updateParticlesCUDA(Particle* particles, int numParticles, float timeStep) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    if (id < numParticles) {
        // updating the particle pos. by using velocity  if id is less tha numParticles
        particles[id].x += particles[id].vx * timeStep;
        particles[id].y += particles[id].vy * timeStep;

        particles[id].vx += 0.1f * sinf(particles[id].y);
        particles[id].vy -= 0.1f * cosf(particles[id].x);
    }
}

void initializeParticles(Particle* particles, int numParticles) {
    for (int i = 0; i < numParticles; ++i) {
        particles[i].x = static_cast<float>(rand()) / RAND_MAX;
        particles[i].y = static_cast<float>(rand()) / RAND_MAX;
        particles[i].vx = 0.1f * (static_cast<float>(rand()) / RAND_MAX - 0.5f);
        particles[i].vy = 0.1f * (static_cast<float>(rand()) / RAND_MAX - 0.5f);
    }
}

void writeParticlePositions(const Particle* particles, int numParticles, const string& filename) {
    ofstream outputFile(filename);

    for (int i = 0; i < numParticles; ++i) {
        outputFile << particles[i].x << " " << particles[i].y << '\n';
    }

    outputFile.close();
}

int main() {
    Particle* particles = new Particle[numParticles];
    Particle* d_particles;

    // Allocate device memory for particles
    cudaMalloc((void**)&d_particles, numParticles * sizeof(Particle));

    // Initialize particles
    initializeParticles(particles, numParticles);

    // Copy particle data from host to device
    cudaMemcpy(d_particles, particles, numParticles * sizeof(Particle), cudaMemcpyHostToDevice);

    // Configure CUDA kernel launch parameters
    int threadsPerBlock = 256;
    int blocksPerGrid = (numParticles + threadsPerBlock - 1) / threadsPerBlock;

    // Run the simulation on the GPU for a number of time steps
    for (int step = 0; step < 1000; ++step) {
        updateParticlesCUDA<<<blocksPerGrid, threadsPerBlock>>>(d_particles, numParticles, timeStep);
        cudaDeviceSynchronize(); // Ensure all CUDA operations are completed
    }

    // Copy particle data from device to host
    cudaMemcpy(particles, d_particles, numParticles * sizeof(Particle), cudaMemcpyDeviceToHost);

    // Store particle positions in the output file
    writeParticlePositions(particles, numParticles, "particle_positions.txt");

    // Free device memory
    cudaFree(d_particles);

    delete[] particles;

    return 0;
}
