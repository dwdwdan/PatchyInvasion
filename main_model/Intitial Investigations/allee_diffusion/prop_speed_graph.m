clear all

load("solution.mat");

u_comp = 0.1;
x_comps = [];
prop_speeds = [];
for idx=1:length(tvec)
    uvec = umat(idx,:);
    x_comp = get_first_less_than(uvec, xvec, u_comp);
    x_comps = [x_comps x_comp];
end

for idx = 1:length(x_comps)-1
    prop_speed = (x_comps(idx+1) - x_comps(idx))/dt;
    prop_speeds(idx) = prop_speed;
end

%%
close all

ts=tvec(1:end-1);

fig = figure();
plot(ts, smoothdata(prop_speeds, "gaussian",10));
ylim([0 1])
fontsize(fig, 18, 'points')
xlabel("Time")
ylabel("Propagation Speed")
title("Propagation Speed over time")


%%

function x = get_first_less_than(uvec, xvec, u_comp)
    midpoint_idx = floor(length(uvec)/2);
    uvec = uvec(midpoint_idx:end);
    xvec = xvec(midpoint_idx:end);
    x=Inf;
    for i=1:length(uvec)
        if uvec(i)<u_comp
            x=xvec(i);
            return
        end
    end
end