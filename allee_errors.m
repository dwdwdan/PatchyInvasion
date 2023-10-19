% Compute Allee Errors
u0 = 1;
alpha = 0.01;
beta = 200;
K = 1000;
tmax = 6;              % Time at end of interest
num_timesteps = 100;     % Number of timesteps to use

dt=tmax/num_timesteps;  % Time step

allee_diff = @(t,u) alpha*u * (u-beta) * (1-u/K);

[t_num, u_num] = ode45(allee_diff, 0:dt:tmax, u0);

[t_ana, u_ana] = allee_analytic(alpha, beta, K, u0, u_num);

e = abs(t_num - t_ana);
err_infty = max(e)
err_two = norm(e)

