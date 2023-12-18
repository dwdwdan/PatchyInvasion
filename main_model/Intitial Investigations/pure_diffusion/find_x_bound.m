dt = 1e-1;
dx = 1e-1;
epsilon = 1e-1;

tmaxs = linspace(0.3, 30, 20);
x_bounds = [];
for tmax = tmaxs
    for x_bound=1:0.1:20
        [~, ~, u, left_good, right_good] = solve_and_check(x_bound, tmax, dx, dt, epsilon, "step");
        if left_good && right_good
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
ylim([0 5])
fontsize(fig, 18, 'points')

