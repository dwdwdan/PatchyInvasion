clear
close all

alpha = 0.01;
beta = 200;
K = 1000;
epsilon = 1;
cs = 200:1:250;
u0 = 400;
tmax = 10;
dt = 1e-4;

t=0:dt:tmax;

fig=figure();
conv_times=[];
for i=1:length(cs)
    c=cs(i)
    allee_diff = @(t,u) alpha*u * (u-beta) * (1-u/K) + c;
    [t, u] = ode45(allee_diff, t, u0);

    % Get a list of steady states for this equation
    ss = get_steady_state(alpha, beta, K, c);
    % The last steady state corresponds to the highest one, which we know
    % is the carrying capacity steady state
    carrying_capacity = ss(end)

    T = get_first_close_index(carrying_capacity, epsilon, u);
    conv_times = [conv_times T];
end

plot(cs, conv_times);
xlabel("c")
ylabel("Number of steps to converge to carrying capacity steady state")
title("Plot of c vs number of timesteps to converge")
fontsize(fig, 18, "points")