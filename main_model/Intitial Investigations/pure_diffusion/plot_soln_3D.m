dt = 1e-1;
dx = 1e-1;

epsilon = 1e-1;

[x, t, u, left_good, right_good] = solve_and_check(5,10,dx,dt,epsilon, "gauss");

fig=figure();
surf(x, t, u)
xlabel("x")
ylabel("t")
zlabel("u")
title("Solution of the diffusion equation with gaussian initial condition")
fontsize(fig, 18, 'points')