alpha = 10;
beta = 0.01;
K = 1;

L = 30;
dl = 0.1;
mid_idx = round(L/dl,0);

[x, y, t, u] = diff_reaction_2d(L, dl, 1e-3, [0 1 3.5 5 7 10 13], 0, "gauss", alpha, beta, K);

%%
fig=figure();
hold on
for idx=1:size(u, 3)
plot(y, u(mid_idx, :, idx), 'DisplayName',"t = " + t(idx))


end

xlabel("y")
ylabel("u")
title("Solution to the diffusion reaction equation at x = 0")
ylim([0 1])
legend
hold off