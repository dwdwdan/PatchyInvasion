% This script solves the non-spatial ODEs with a logistic growth function,
% so we can analyse how the timestep length effects the error.
clear
close all

%% Function Parameters
K = 1000;                   % Carrying Capacity
alpha = 1;
u0 = 1;                     % Initial Condition
tmax = 25;                  % Time at end of interest
dts = logspace(-3,0, 100);   % Vector consisting of timesteps to try. We use logspace to get logarithmically space dts
epsilon = 1;                % How close do we need to be to K before we have "converged"

% Create empty vectors for errors and convergence times
err_inftys = [];
err_twos = [];
conv_times = [];
for dt = dts
    [t, u_num, u_ana, err_infty, err_two, convergence_time] = numeric_fixed_step(alpha, u0, K, dt, tmax, epsilon);
    err_inftys = [err_inftys err_infty];        % Append error in infinity norm to err_inftys
    err_twos = [err_twos err_two];              % Append error in 2 norm to err_twos
    conv_times = [conv_times convergence_time]; % Append convergence time to conv_times
end

figure()
loglog(dts, err_inftys)
hold on
loglog(dts, err_twos)
xlabel("Time Step")
ylabel("Error")
title("Errors with different timesteps")
legend("\infty-norm", "2-norm")

figure()
loglog(dts, conv_times)
xlabel("Time Step")
ylabel("Number of Timesteps to converge to K")
title("Convergence time with differing timesteps")

