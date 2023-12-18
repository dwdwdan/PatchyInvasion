function [x, t, u] = solve_and_check(x_bound, t_max, dx, dt, epsilon, alpha, beta, K)
    %% Solve the pde
    x = -x_bound:dx:x_bound;
    t = 0:dt:t_max;
    
    specific_pde = @(x,t,u, dudx) pde(x,t,u, dudx, alpha, beta, K);

    m=0;
    u = pdepe(m, specific_pde, @(x) ic_gauss(x, epsilon), @bc, x, t);

    %% Check if u(-X) < epsilon and u(X) < epsilon
    if max(u(:,1)) > epsilon
        warning("Value at left boundary is greater than 0")
    end
    if max(u(:, end)) > epsilon
        warning("Value at right boundary is greater than 0")
    end
end

