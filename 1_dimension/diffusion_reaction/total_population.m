% This code requires a solution to already be loaded. A solution can be
% generated by running the script `get_solution`.

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
