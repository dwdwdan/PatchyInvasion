dt = 1e-1;
dx = 1e-1;
epsilon = 1e-3;

tmaxs = linspace(3*dt, 200, 30);
x_bounds = [];
last_X=2;
parfor tmax_idx = 1:length(tmaxs)
    tmax = tmaxs(tmax_idx);
    for x_bound=1e-1:1e-1:1e10
        [~, ~, ~, left_good, right_good] = diff_soln_1d(x_bound, tmax, dx, dt, epsilon, "gauss");
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
xlabel("T")
ylabel("X^*")
title("Minimum X for given T")


