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
    rhs_norm = sqrt(du^2 + dv^2);
    du = du./rhs_norm;
    dv = dv./rhs_norm;
    dus(i) = du;
    dvs(i) = dv;
end

fig=figure();
quiver(us,vs,dus,dvs,'k', 'AutoScaleFactor',0.5, 'Alignment','center');
axis tight equal
hold on

plot(m, gamma*(m-beta)*(1-m), 'b.', 'MarkerSize',20)

plot(0,0, 'b.', 'MarkerSize',20)
plot(1,0, 'b.', 'MarkerSize',20)
plot(beta, 0, 'b.', 'MarkerSize',20)

xline(0)
yline(0)

xlabel('u')
ylabel('v')
xlim([u_min, u_max])
ylim([v_min, v_max])
title("Phase Portrait of the non-spatial problem, with normalised vectors")
fontsize(fig, 18, 'points')
