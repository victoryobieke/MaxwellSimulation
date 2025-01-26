README for Maxwell's Equations Simulation Code



This repository contains MATLAB code for simulating Maxwell's equations using a finite difference time domain (FDTD) approach with the Yee scheme. The code evaluates the accuracy and convergence properties of the method while incorporating a small perturbation to the initial conditions.

Overview

Maxwell's equations describe the behavior of electromagnetic fields. This code solves the one-dimensional Maxwell curl equations with periodic boundary conditions. It implements a staggered grid approach, with electric and magnetic fields defined on primary and dual grids, respectively.

Key Features:

Staggered Grid Implementation: Primary grid for the electric field (E) and a dual grid for the magnetic field (H).

Initial Conditions: Includes a perturbation to test the scheme's stability and accuracy.

Periodic Boundary Conditions: Ensures consistency across grid boundaries.

Error Analysis: Computes the numerical error and convergence rate using exact solutions.

Energy Norm: Tracks the energy conservation properties of the numerical scheme.

Files

Main script to run the simulation, visualize results, and compute error analysis.

Simulation Parameters

Temporal Interval: [0, T] with T = 20 * \pi

Spatial Interval: [0, 2 * \pi]

CFL Condition: CFL number = 1 (or other specified values for testing stability).

Grid Sizes: Multiple grid resolutions tested: M = [8, 16, 32, 64, 128, 256, 512].

Code Structure

Discretization Parameters

Defines the time and spatial intervals.

Constructs primary and dual grids for E and H fields.

Initial Conditions

Perturbed sinusoidal initial conditions for E and sinusoidal for H.

Error Norms

Computes the discrete energy norm:

Numerical Scheme

Updates E and H fields based on the Maxwell curl equations.

Enforces periodic boundary conditions.

Error Analysis

Compares numerical and exact solutions to compute errors.

Calculates the convergence rate:

