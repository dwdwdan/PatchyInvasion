clear
close all

% Compute Allee Errors
alpha = 0.01;
beta = 200;
K = 1000;
tmax = 6;              % Time at end of interest
u0 = 201;
dts=logspace(-4,0,50);  % Time step

err_twos = [];
err_inftys = [];
for dt = dts
    [err_two, err_infty] = allee_error(u0, alpha, beta, K, tmax, dt);
    err_twos = [err_twos err_two];
    err_inftys = [err_inftys err_infty];
    assert(length(err_inftys)==length(err_twos))
end
fig=figure();

yyaxis left
loglog(dts, err_inftys)
ylabel("Infinity Norm")
yyaxis right
loglog(dts, err_twos)
ylabel("2 Norm")

xlabel("Length of timestep")
title("Plot of error norms for differing timestep lengths")
fontsize(fig, 24,"points");