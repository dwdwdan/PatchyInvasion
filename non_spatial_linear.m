% This script solves the non-spatial ODEs with a linear growth function

clear

%% Function Parameters
alpha = 1;              
u0 = 1;                 % Initial Population
tmax = 5;              % Time at end of interest
num_timesteps = 100;     % Number of timesteps to use

dt=tmax/num_timesteps;  % Time step

%% ODE Functions
lin_diff = @(t, u) alpha*u;
lin_soln = @(t) u0 .* exp(alpha .* t);

%% Solving the ODEs
[t, u_num] = ode45(lin_diff, 0:dt:tmax, 1);
u_an = lin_soln(t);

% Compute error in infinity norm and 2-norm
[err_infty, err_two] = compute_error(u_num, u_an);

fig=figure();

plot(t, u_num);
title("Numerical Solution to the Exponential Model")
xlabel("Time")
ylabel("Population")
fontsize(fig, 18, "points")