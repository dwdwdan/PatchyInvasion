function [t, u_num, u_ana, err_infty, err_two, convergence_time] = logistic_ODE(alpha, u0, K, dt, tmax, epsilon)

t = 0:dt:tmax;

%% ODE Functions
% RHS of ODE
log_diff = @(t, u) alpha*u * (1-u/K);

% Analytic solution of ODE
log_soln = @(t) K.*u0 ./ (u0 + (K-u0).*exp(-alpha .* t));

%% Solving the ODE
% Solve the ODE numerically
u_num = ode5(log_diff, t, u0)';

% Compute analytic values at t_i
u_ana = log_soln(t);

% Compute error in both infinity norm and euclidean 2-norm
[err_infty, err_two] = compute_error(u_num, u_ana);

convergence_time = get_first_close_index(K, epsilon, u_num);

end