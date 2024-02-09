dt=1e-3;
dx=1;
tmax = 50;
X=100;
epsilon = 1e-3;

u0 = @(x) ic_gauss(x, epsilon, 0,1);
v0 = u0;

gamma = 10;

ms = 0.7:0.05:0.9;
betas = 0:0.05:0.2;

params = combvec(ms, betas);

for param=params
    m = param(1);
    beta = param(2);

    [x, ~, u, ~] = solver_1d(X, tmax, dx, dt, u0, v0, epsilon, gamma, m, beta);

    central = u(end, round(length(x)/2));

    fprintf("m = %g\tbeta = %g\terr = %g\n", m, beta, abs(central-m))
end