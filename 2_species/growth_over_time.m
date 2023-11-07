clear
close all

u0 = 10;
v0 = 1;
tmax = 10;

f = @(t,W) [W(1)*(1-W(2)); W(2)*(1-W(1))];

[ts, ws] = ode45(f, [0, tmax], [u0;v0]);

fig=figure();
semilogy(ts, ws(:, 1));
hold on
plot(ts, ws(:, 2));
legend(["u","v"]);
xlabel("Time");
ylabel("Population")
title("Population dynamics over time")
fontsize(fig, 18, "points")
yticks([1e-10 1e-8 1e-6 1e-4 1e-2 1 1e2 1e4 1e6])