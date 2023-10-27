clear
close all

% Compute Allee Errors
alpha = 0.01;
beta = 200;
K = 1000;
tmax = 6;              % Time at end of interest
dt=1e-1;  % Time step

u0s = 1:1:1500;
u0s = u0s(u0s~=beta);
u0s = u0s(u0s~=K);

err_twos = [];
err_inftys = [];
for u0 = u0s
    [err_two, err_infty] = allee_error(u0, alpha, beta, K, tmax, dt);
    err_twos = [err_twos err_two];
    err_inftys = [err_inftys err_infty];
    assert(length(err_inftys)==length(err_twos))
end
fig=figure();
yyaxis left
plot(u0s, err_inftys)
ylabel("Infinity Norm")
yyaxis right
plot(u0s, err_twos)
ylabel("2 Norm")

xlabel("u_0")
title("Plot of error norms for differing u_0")
fontsize(fig, 24,"points");