dt = 1e-1;
dx = 1e-3;
tmax = 100;
X=100;

epsilon = 1e-3;

alpha = 1;
beta = 0.6;
K=1;

[xvec, tvec, umat] = solve_and_check(100,tmax,dx,dt,epsilon, alpha, beta, K);

save("solution.mat")