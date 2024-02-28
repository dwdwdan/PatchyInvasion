clear
close all

u0 = 10;
v0 = 1;
tmax = 10;

f = @(t,W) [W(1)*(1-W(2)); W(2)*(1-W(1))];

[ts, ws] = ode45(f, [0, tmax], [u0;v0]);

%% Cleaning
% We assume that any population less that 10^-6 is 0, in order to remove
% artifacts of the numerical method

for idx = 1:size(ws, 1)
    if ws(idx, 2) < 1e-6
        ws(idx, 2) = 0;
    end
    if ws(idx, 1) < 1e-6
        ws(idx, 1) = 0;
    end
end

%% Plotting

fig=figure();
semilogy(ts, ws(:, 1));
hold on
plot(ts, ws(:, 2));
legend(["u","v"]);
xlabel("Time");
ylabel("Population")
title("Population dynamics over time")
yticks([1e-10 1e-8 1e-6 1e-4 1e-2 1 1e2 1e4 1e6])