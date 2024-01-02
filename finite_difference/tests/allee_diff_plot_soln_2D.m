dt=1e-3;
dx=1e-1;
tmax = 100;
X=100;

epsilon = 1e-3;

alpha = 1;
beta=0.06;
K=1;

[x, tvec, u] = source_diffusion_solver(X, tmax, dx, dt, @(x) ic_gauss(x, 1e-3), @(u)  alpha*u*(u-beta)*(1-u/K));
close all
fig=figure();
hold on
leg=[];
for t=[0 20]
    t_idx = t/dt + 1;
    plot(x, u(t_idx, :))
    leg = [leg "\(t="+t+"\)"];
end
title("Solution of the allee diffusion equation with gaussian initial condition")
fontsize(fig, 18, 'points')
legend(leg, 'Interpreter','latex')
xlabel("x")
ylabel("u")
hold off