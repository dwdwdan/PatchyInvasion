clear
close all


f = @(t,W) [W(1)*(1-W(2)); W(2)*(1-W(1))];
u_dom = linspace(-0.5, 1.5, 20);
v_dom = linspace(-0.5, 1.5,20);

[x,y] = meshgrid(u_dom,v_dom);

u = zeros(size(x));
v = zeros(size(y));

t=0;
for i=1:numel(x)
    Wprime = f(t, [x(i), y(i)]);
    Wprime = Wprime/norm(Wprime);
    u(i) = Wprime(1);
    v(i) = Wprime(2);
end
fig=figure();
quiver(x,y,u,v,'k', 'AutoScaleFactor',0.5, 'Alignment','center');
axis tight equal
hold on
yline(0, 'r--')
yline(1, 'b--')
xline(0, 'b--')
xline(1, 'r--')
xlabel('u')
ylabel('v')
title("Phase Portrait of the simple 2 species model, with normalised vector length")
fontsize(fig, 18, 'points')