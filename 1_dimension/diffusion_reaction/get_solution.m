clear all

dt = 1e-1;
dx = 1e-3;
tmax = 100;
X=60;

epsilon = 1e-3;

alpha = 1;
beta = 0.06;
K=1;

[xvec, tvec, umat] = diff_reac_soln_1d(100,tmax,dx,dt,epsilon, alpha, beta, K);

save("solution.mat")