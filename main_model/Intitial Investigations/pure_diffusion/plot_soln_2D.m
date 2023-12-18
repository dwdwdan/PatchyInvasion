dt = 1e-1;
dx = 1e-1;
tmax = 20;

epsilon = 1e-3;

[x, tvec, u, left_good, right_good] = solve_and_check(20,tmax,dx,dt,epsilon, "gauss");

if ~left_good || ~right_good
    error("Solution Invalid")
end

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