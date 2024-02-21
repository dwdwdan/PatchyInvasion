alpha = 10;
beta = 0.01;
K = 1;

[x, y, t, u] = diff_reaction_2d(100, 1, 1e-3, 40, 0, "gauss", alpha, beta, K);

%%
fig=figure();

pcolor(x, y, u(:,:, end))
clim([0 1])

shading flat
xlabel("x")
ylabel("y")
title("Solution at t = 40")
axis square
