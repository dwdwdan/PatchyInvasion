% This script solves the non-spatial ODEs with a logistic growth function
clear
close all

%% Function Parameters
K = 1000;               % Carrying Capacity
alpha = 1;
tmax = 17;              % Time at end of interest
num_timesteps = 100;     % Number of timesteps to use
epsilon=1;

dt=tmax/num_timesteps;  % Time step
fig=figure();
u0s = [1];

hold on
for u0 = u0s
    [t, u_num, u_ana, err_infty, err_two, convergence_time] = numeric_soln(alpha, u0, K, dt, tmax, epsilon);
    plot(t,u_num);
end
yline(K, '--')
%legend({'u_0 = 1', 'u_0 = 50', 'u_0 = 500', 'u_0 = 900', 'u_0 = 1500'})



title("Numerical Solution of the Logistic Model")
xlabel("Time")
ylabel("Population")
xlim([0 tmax])
hold off