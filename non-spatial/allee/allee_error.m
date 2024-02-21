function [err_infty, err_two] = allee_error(u0, alpha, beta, K, tmax, dt)

allee_diff = @(t,u) alpha*u * (u-beta) * (1-u/K);

t_num = 0:dt:tmax;

u_num = ode5(allee_diff, t_num, u0);

[t_ana, u_ana] = analytic(alpha, beta, K, u0, u_num);

t_num = t_num(t_ana<Inf);
t_ana = t_ana(t_ana<Inf);

e = abs(t_num - t_ana');
err_infty = max(e);
err_two = norm(e);

