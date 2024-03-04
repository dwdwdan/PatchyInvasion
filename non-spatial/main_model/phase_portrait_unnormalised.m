clear
close all

gamma = 5;
beta = 0.5;
m = 0.9;

u_min = -0.2;
u_max = 1.2;
v_min = -0.2;
v_max = 1.2;
detail = 20;

u_dom = linspace(u_min, u_max, detail);
v_dom = linspace(v_min, v_max, detail);

[us,vs] = meshgrid(u_dom,v_dom);

dus = zeros(size(us));
dvs = zeros(size(vs));

t=0;
for i=1:numel(us)
    [du, dv] = model(us(i), vs(i), gamma, beta, m);
    dus(i) = du;
    dvs(i) = dv;
end

fig=figure();
quiver(us,vs,dus,dvs,'k', 'AutoScaleFactor',2, 'Alignment','center');
axis tight equal
hold on

plot(m, gamma*(m-beta)*(1-m), 'g.', 'MarkerSize',20)

plot(0,0, 'g.', 'MarkerSize',20)
plot(1,0, 'r.', 'MarkerSize',20)
plot(beta, 0, 'r.', 'MarkerSize',20)

xline(0)
yline(0)

u0s = [repmat(1.2, 1, 10)     0.2  0.4 0.6];
v0s = [0:0.2:1 0.5 0.45 0.3 0.1  1.2  1.2 1.2];



for i=1:length(u0s)
    u0 = u0s(i);
    v0 = v0s(i);
    [ts,ys] = ode45(@(t, W) vector_model(t, W, gamma, beta, m), [0,20], [u0 v0]);
    plot(ys(:,1), ys(:,2));
end

xlabel('u')
ylabel('v')
xlim([u_min, u_max])
ylim([v_min, v_max])
title("Phase Portrait")

function W = vector_model(~, W, gamma, beta, m)
    [du, dv] = model(W(1), W(2), gamma, beta, m);
    W = [du; dv];
end