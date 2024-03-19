close all

J4 = subs(J, [u v], [m gamma*(m-beta)*(1-m)]);

tr = trace(J4);
determ = det(J4);

F(beta) = tr^2 - 4*determ;

beta_solns = solve(F == 0, beta);
fig = figure();
beta_solns_gamma = subs(beta_solns, gamma, 2);
hold on

fplot(beta_solns_gamma(1), [0 2])
fplot(beta_solns_gamma(2), [0 2])

yline(1, 'k')
xline(1, 'k')

legend(["\(\beta_1(m)\)", "\(\beta_2(m)\)"], 'interpreter', 'latex')

xlim([0 2])
ylim([0 2])
xlabel("m")
ylabel("\(\beta\)", 'Interpreter','latex')
title("\((m, \beta)\) plane", 'Interpreter', 'latex')
hold off
