dt = 1e-1;
dx = 1e-3;
tmax = 100;
X=100;

epsilon = 1e-3;

[xvec, tvec, umat] = solve_and_check(100,tmax,dx,dt,epsilon, 1,0.06,1);

save("solution.mat")