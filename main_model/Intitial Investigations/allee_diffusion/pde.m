function [c, f, s] = pde(x, t, u, dudx, alpha, beta, K)
c = 1;
f = dudx;
s = alpha*u*(u-beta)*(1-(u/K));
end

