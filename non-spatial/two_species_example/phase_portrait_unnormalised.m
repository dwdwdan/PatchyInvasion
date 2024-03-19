clear
close all

u_min = -1;
u_max = 2;
v_min = -1;
v_max = 2;
detail = 20;

f = @(t,W) [W(1)*(1-W(2)); W(2)*(1-W(1))];
u_dom = linspace(u_min, u_max, detail);
v_dom = linspace(v_min, v_max, detail);

[x,y] = meshgrid(u_dom,v_dom);

u = zeros(size(x));
v = zeros(size(y));

t=0;
for i=1:numel(x)
    Wprime = f(t, [x(i), y(i)]);
    u(i) = Wprime(1);
    v(i) = Wprime(2);
end
fig=figure();
quiver(x,y,u,v,'k', 'Alignment','center');
axis tight equal
hold on
yline(0, 'r--')
yline(1, 'b--')
xline(0, 'b--')
xline(1, 'r--')



u0s = [0.009 0.01 0.01 0.01 -0.01 -0.01 2.1 2];
v0s = [0.01 0.009 0.01 -0.01 0.01 -0.01 2 2.1];

for i=1:length(u0s)
    u0 = u0s(i);
    v0 = v0s(i);
    [ts,ys] = ode45(f, [0,10], [u0 v0]);
    plot(ys(:,1), ys(:,2));
end

plot(0,0, 'r.', 'MarkerSize',20)
plot(1,1, 'b.', 'MarkerSize',20)

xlim([u_min u_max])
ylim([v_min v_max])
xlabel('u')
ylabel('v')
title("Phase Portrait")
hold off