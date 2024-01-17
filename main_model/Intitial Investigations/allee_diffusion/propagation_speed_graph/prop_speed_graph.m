clear all

load("../solution.mat");
close all
fig=figure();
hold on
leg=[];
for u_comp=[1e-3 0.1 0.3 0.5 1-1e-2]
    [ts, prop_speeds] = get_prop_speed(tvec, xvec, umat, dt, u_comp);
    smoothed_prop_speeds = smoothdata(prop_speeds, "gaussian", 10);
    plot(ts, smoothed_prop_speeds);
    leg = [leg "u^* = "+u_comp];
end
ylim([0 1])
fontsize(fig, 18, 'points')
yline(0.6222, "--")
leg = [leg "c = 0.6222"];
legend(leg)
xlabel("Time")
ylabel("Propagation Speed")
title("Propagation Speed over time")
hold off