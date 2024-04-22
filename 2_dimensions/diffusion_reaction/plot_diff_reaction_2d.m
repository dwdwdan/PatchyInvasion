alpha = 10;
beta = 0.01;
K = 1;

L = 50;
dl = 0.1;
dt = 0.002;

[x, y, t, u] = diff_reaction_2d(L, dl, dt, 15, 0, "gauss", alpha, beta, K);

%%
fig=figure();

imagesc(x, y, u(:,:, end))
clim([0 1])

xlabel("x")
ylabel("y")
title("Solution at t = 40")
colorbar
