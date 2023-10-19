% This script solves the non-spatial ODEs considering the Strong Allee Effect.
clear
close all

%% Function Parameters
K = 1000;               % Carrying Capacity
alpha = 0.01;
beta = 200;
tmax = 6;              % Time at end of interest
num_timesteps = 100;     % Number of timesteps to use
epsilon = 1;


dt=tmax/num_timesteps;  % Time step

u0s = [1 50 195 205 300 600 900 1200];
convergence_times = [];
ax = setup_figure(tmax, dt);

allee_diff = @(t,u) alpha*u * (u-beta) * (1-u/K);

for u0 = u0s
    [t, u_num] = ode45(allee_diff, 0:dt:tmax, u0);
    plot(ax, u_num);
end
legend({'u_0 = 1', 'u_0 = 50', 'u_0 = 195', 'u_0 = 205', ...
    'u_0 = 300', 'u_0 = 600', 'u_0 = 900', 'u_0 = 1200'})


% Axis Title
title("Numerical Solution to the Allee Model with different starting " + ...
    "populations")
hold off
