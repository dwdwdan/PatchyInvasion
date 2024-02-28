function [x, t, u, left_good, right_good] = diff_soln_1d(x_bound, t_max, dx, dt, epsilon, ic_type)
    %% Solve the pde
    x = -x_bound:dx:x_bound;
    t = 0:dt:t_max;
    
    m=0;
    if ic_type == "gauss"
        u = pdepe(m, @pde, @(x) ic_gauss(x, epsilon), @bc, x, t);
    elseif ic_type == "step"
        u = pdepe(m, @pde, @ic_step, @bc, x, t);
    else
        error("Unknown BC type %s", ic_type)
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

