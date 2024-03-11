alpha = 10;
beta = 0.01;
K = 1;

L = 50;
dl = 0.1;
dt = 0.002;
mid_idx = ceil(L/dl);

[x, y, t, u] = diff_reaction_2d(L, dl, dt, [0 1 3.5 5 7 10 13], 0, "gauss", alpha, beta, K);

%%
fig=figure();
hold on
for idx=1:size(u, 3)
plot(y, u(:, mid_idx, idx), 'DisplayName',"t = " + t(idx))


end

xlabel("x")
ylabel("u")
title("Solution at y = 0")
ylim([0 1.2])
legend
hold off