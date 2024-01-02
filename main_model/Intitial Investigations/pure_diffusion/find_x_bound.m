dt = 1e-1;
dx = 1e-1;
epsilon = 1e-3;

tmaxs = linspace(3*dt, 200, 20);
x_bounds = [];
last_X=2;
for tmax = tmaxs
    for x_bound=last_X-1:1:1e10
        [~, ~, ~, left_good, right_good] = solve_and_check(x_bound, tmax, dx, dt, epsilon, "step");
        if left_good && right_good
            fprintf("For tmax=%g, X=%g\n", tmax,x_bound)
            last_X = x_bound;
            break
        end

    end
    x_bounds = [x_bounds x_bound];
end

%% Plotting
fig = figure();
plot(tmaxs,x_bounds)
xlabel("Maximum Time")
ylabel("X bound required")
title("Minimum Required X for a given maximum time")
fontsize(fig, 18, 'points')

