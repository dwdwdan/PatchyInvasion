tmax = 100;
dt = 0.1;

[xvec, tvec, umat] = solve_and_check(100, tmax, 0.1,dt, 1e-3, 1, 0.06, 1);


t_idxs = 1:length(tvec);
areas=[];
for t_idx=t_idxs
    uvec = umat(t_idx, :);
    areas = [areas trapz(xvec, uvec)];
end


fig=figure();
plot(tvec, areas)
xlabel("Time")
ylabel("Total Population")
title("Growth of the total population over time")
xlim([0 60])
fontsize(fig, 18, 'points')