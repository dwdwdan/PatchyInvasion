load("solution.mat");

close all
fig=figure();
hold on
leg=[];
for t=[0 20 40 60 80 100]
    t_idx = t/dt + 1;
    plot(xvec, umat(t_idx, :))
    leg = [leg "\(t="+t+"\)"];
end
title("Solution of the allee diffusion equation with gaussian initial condition")
fontsize(fig, 18, 'points')
legend(leg, 'Interpreter','latex')
xlabel("x")
ylabel("u")
hold off