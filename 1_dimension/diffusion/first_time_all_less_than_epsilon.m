dt = 1e-1;
dx = 1e-1;
epsilon = 1e-1;

tmax = 30;
xbound = 5;

[~,t,u,~,~] = solve_and_check(xbound, tmax,dx,dt,epsilon, "step");

maxes = max(u, [], 2);

for idx = 1:length(maxes)
    if maxes(idx) < epsilon
        time_all_less_than_epsilon = t(idx);
        break
    end
end