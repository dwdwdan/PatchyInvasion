tmax = 100;
dt = 0.1;

[xvec, tvec, umat] = solve_and_check(100, tmax, 0.1,dt, 1e-3, 1, 0, 1);


t_idxs = 1:300;
areas=[];
for t_idx=t_idxs
    uvec = umat(t_idx, :);
    areas = [areas trapz(xvec, uvec)];
end

ts = t_idxs./tmax;

fig=figure();
plot(ts, areas)
xlabel("Time")
ylabel("Total Population")
title("Growth of the total population over time")
fontsize(fig, 18, 'points')