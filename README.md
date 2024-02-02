# Paninion-Assignment


* At the first tried to approach the problem statement sequentially.

The provided C++ code(FDS_sequential.cpp) simulates the movement of particles in a dynamic system, demonstrating basic particle dynamics through a numerical simulation. It defines a Particle structure with attributes representing the position (x, y) and velocity (vx, vy) of each particle. The 'initializeParticles' function initializes the particles with random positions and velocities. The updateParticles function simulates the movement of particles over time, applying small forces to modify their positions and velocities. The main function creates an array of particles, runs the simulation for a specified number of time steps, and stores the final particle positions in a text file named "particle_positions.txt."

  To run sequential code : 
  1. clone the repository by "git clone 'repo link'"
  2. change working directory by using command "cd PathDirec" to the path where we cloned our github project.
  3. compile the code by using "g++ filename.cpp(FDS_sequential.cpp) -o filename(FDS_sequential)"
  4. to run code "./FDS_sequential" 
  5. "particles.positions.txt" will get generated as an O/P file.

