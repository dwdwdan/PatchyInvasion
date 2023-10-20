function [steady_state, stability] = check_stability (alpha, beta, K, c, steady_state, tol, tmax, perturbation)

    stability = true;
    tol = K*tol;

    upper_bound = steady_state + tol;
    lower_bound = steady_state - tol;
    dt = tmax/100;
    t=0:dt:tmax;

    allee_diff = @(t,u) alpha*u * (u-beta) * (1-u/K) + c;
    [t, u_num] = ode45(allee_diff, t, steady_state+perturbation);
    if max(u_num) > upper_bound
        stability = false;
    else
        [t, u_num] = ode45(allee_diff, t, steady_state-perturbation);
        if min(u_num) < lower_bound
            stability = false;
        end
    end
end

