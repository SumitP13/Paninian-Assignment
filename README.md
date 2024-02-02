# Paninion-Assignment


* The provided sequential C++ code(FDS_sequential.cpp) simulates the movement of particles in a dynamic system, demonstrating basic particle dynamics through a numerical simulation. It defines a Particle structure with attributes representing the position (x, y) and velocity (vx, vy) of each particle. The 'initializeParticles' function initializes the particles with random positions and velocities. The updateParticles function simulates the movement of particles over time, applying small forces to modify their positions and velocities. The main function creates an array of particles, runs the simulation for a specified number of time steps, and stores the final particle positions in a text file named "particle_positions.txt."
<hr>

## To run sequential code : 
  1. clone the repository by <b><u>"git clone 'repo link' "</u></b>
  2. change working directory by using command <b><u> "cd PathDirec"</u></b> to the path where we cloned our github project.
  3. compile the code by using <b><u>"g++ filename.cpp(FDS_sequential.cpp) -o filename(FDS_sequential)"</b></u>
  4. to run code <b><u>"./FDS_sequential"</b></u> 
  5. "particles.positions.txt" will get generated as an O/P file.

<hr>

* To Make it parallel I included CUDA-specific syntax, such as kernel launch configuration (<<<...>>>) and the __global__ specifier for CUDA kernels and the CUDA code involves GPU memory management functions (cudaMalloc, cudaMemcpy, cudaFree) for data transfer between CPU and GPU.

* The CUDA-accelerated code introduces a boost in performance by tapping into the parallel processing capabilities of a GPU. This parallelism can greatly enhance the speed of certain computational tasks. Noteworthy changes include the incorporation of a CUDA kernel, responsible for parallel execution, efficient GPU memory management using functions like cudaMalloc, cudaMemcpy, and cudaFree, and the adoption of specific CUDA syntax. This transformation enables the simulation to happen simultaneously across multiple threads on the GPU, leading to quicker and more efficient updates of particle positions.

<hr>

## To run Parallel code :
  1. clone the repository by <b><u>"git clone 'repo link' "</b></u>
  2. change working directory by using command <b><u>"cd PathDirec"  </b></u>to the path where we cloned our github project.
  3. check if nvidia cuda toolkit is installed on your pc or not by using <b><u>"nvcc --version"</b></u> command bcoz we need Nvidia toolkit to run our CUDA(parallel) code.
  4. if toolkit is not installed
       - use command <b><u>"sudo apt install nvidia-cuda-toolkit"</b></u>
       - to check if toolkit is properly installed <b><u>"nvcc --version"</b></u>
  5. to compile code use command <b><u>"nvcc -o FDS_Cuda FDS_Cuda.cu"</b></u>
  6. to run code use <b><u>"./FDS_Cuda"</b></u> it will update our O/P in "particles_positions.txt".

<hr>

* To visualize our simulator of fluid dynamics we need to integrate CUDA with openGL graphics libraries or we can also use python for that.

<hr>

#### In the given fluid dynamics simulation code, one aspect that could potentially be enhanced with machine learning is the prediction of particle trajectories over time. Traditional fluid dynamics simulations use deterministic rules to update particle positions, but machine learning could be employed to learn and predict more complex and accurate particle movements, especially in scenarios involving turbulence.


## Conceptual Outline:
### Data Sources:

* <u>Simulation Data</u>: Use the existing fluid dynamics simulation data as the training dataset. This includes particle positions, velocities, and forces at different time steps.
* <u>External Factors</u>: Incorporate external factors such as temperature, pressure, and other environmental conditions if they impact particle movement.

### Machine Learning Models:

* <u>Recurrent Neural Networks (RNNs)</u>: RNNs can capture temporal dependencies in the particle movements, making them suitable for predicting trajectories in a time-dependent system.

### Expected Improvements:

* <u>Enhanced Prediction Accuracy</u>: Machine learning models can capture non-linear dependencies and turbulent behaviors that may be challenging for deterministic rules.
* <u>Improved Efficiency</u>: ML-based predictions may reduce the need for fine-grained simulations, leading to computational efficiency gains.