
[x, y, t, u] = pure_diff_2d(40, 0.1, 0.0025, [0 1 2 5 10], 0, "gauss");

fig=figure();
hold on
for idx=1:length(t)
    plot(x, u(:,ceil(length(y)/2), idx), 'DisplayName',"t = " + t(idx))
end
hold off
ylim([0 1])
xlim([-15 15])
title("2D Diffusion Equation at y = 0")
xlabel("x")
ylabel("u")
legend()