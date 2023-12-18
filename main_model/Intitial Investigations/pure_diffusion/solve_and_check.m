function [x, t, u, left_good, right_good] = solve_and_check(x_bound, t_max, dx, dt, epsilon, type)
    %% Solve the pde
    x = -x_bound:dx:x_bound;
    t = 0:dt:t_max;
    
    m=0;
    if type == "gauss"
        u = pdepe(m, @pde, @(x) ic_gauss(x, epsilon), @bc, x, t);
    elseif type == "step"
        u = pdepe(m, @pde, @ic_step, @bc, x, t);
    else
        error("Unknown BC type %s", type)
    end

    %% Check if u(-X) < epsilon and u(X) < epsilon
    left_good = true;
    right_good = true;
    if max(u(:,1)) > epsilon
        %warning("Value at left boundary is greater than 0")
        left_good = false;
    end
    if max(u(:, end)) > epsilon
        %warning("Value at right boundary is greater than 0")
        right_good = true;
    end
end

