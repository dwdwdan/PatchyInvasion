global beta gamma m
gamma = 10;
beta = 0.01;
m = 0.1;

dt=1e-2;
dx=1;
tmax = 80;
X=200;
epsilon = 1e-3;

[x, t, u, v] = solver_1d(X, tmax, dx, dt, @(x) ic_gauss(x, epsilon, 0,1), @(x) ic_gauss(x,epsilon, 0, 1), epsilon);

close all

%% Plot the solution using a colour map
tiledlayout(2,1)
nexttile;
pcolor(x,t,u)
title("u")
shading interp
clim([0 1]);
xlabel("x")
ylabel("Time")


nexttile;


pcolor(x,t,v)
title("v")
shading interp
xlabel("x")
ylabel("Time")
clim([0 1]);

cb = colorbar;
cb.Layout.Tile = 'east';

%% Plot the graph at certain time intervals
fig=figure();
tiledlayout("flow");

for t=[0 10 20 40 60 80]
    nexttile;
    hold on
    idx = t./dt+1;
    plot(x, u(idx,:))
    plot(x, v(idx,:))
    legend(["u" "v"])
    title("t = "+t)
    hold off
end


