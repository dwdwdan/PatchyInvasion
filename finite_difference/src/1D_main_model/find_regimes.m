clear

global beta gamma m
gamma = 10;
beta = 0.1;


dt=1e-2;
dx=1;
tmax = 100;
X=200;
epsilon = 1e-3;
xs = [];
ts = [];
us = [];
vs = [];

%ms = [0 0.4 0.5 0.6 0.8 1];
ms = 0.45:0.01:0.55;
fig=figure();
for idx = 1:length(ms)
    m = ms(idx);
    [x, t, u, v] = solver_1d(X, tmax, dx, dt, @(x) ic_gauss(x, epsilon, 0,1), @(x) ic_gauss(x,epsilon, 0, 1), epsilon);
    xs(:,idx) = x;
    ts(:,idx) = t;
    us(:,:,idx) = u;
    vs(:,:,idx) = v;
end
%%
save("solutions_patchy.mat")
%%
for idx = 1:size(us,3)
    nexttile
    plot(xs(:, idx),us(end, :,idx))
    shading interp
    title("m = " + ms(idx))
    xlabel("x")
    ylabel("u")
end

%%
for idx = 1:size(us,3)
    nexttile
    pcolor(xs(:,idx), ts(:, idx), us(:,:,idx))
    shading interp
    title(["m = " ms(idx)])
end