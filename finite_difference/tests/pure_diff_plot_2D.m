X = 25;
tmax=20;
dt=1e-3;
dx=1e-1;

[x, t ,u] = pure_diffusion_solver(X, tmax, dx, dt, @(x) ic_gauss(x, 1e-3), 0, 0);

close all
fig=figure();
hold on
leg=[];
for t=[0 5 10 15 20]
    t_idx = t/dt + 1;
    plot(x, u(t_idx, :))
    leg = [leg "\(t="+t+"\)"];
end
title("Solution of the diffusion equation with gaussian initial condition")
fontsize(fig, 18, 'points')
legend(leg, 'Interpreter','latex')
xlabel("x")
ylabel("u")
hold off