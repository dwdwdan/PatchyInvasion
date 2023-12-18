dt = 1e-1;
dx = 1e-1;
tmax = 100;
X=100;

epsilon = 1e-3;

[x, tvec, u] = solve_and_check(100,tmax,dx,dt,epsilon, 1,0,1);

close all
fig=figure();
hold on
leg=[];
for t=0:20:tmax
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