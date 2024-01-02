function [x, t, u] = source_diffusion_solver(X, tmax, dx, dt, u0, F)

alpha = dt/(dx*dx);
assert(alpha<0.5, "alpha is too large. The solution will not converge")

% Vectors x and t represent the values of x and t at the relevant indices
x = -X:dx:X;
t = 0:dt:tmax;

% Initialise u to be a zero matrix
u = zeros(length(x), length(t));

% Apply the initial Condition
u(:,1) = u0(x);

% We don't need to explictly apply the boundary conditions because we have
% set u to be the zero matrix, but we do anyway for completeness
u(1,:) = 0;
u(end, :) = 0;

for j=1:length(t)-1
    for i=2:(length(x)-2)
        u(i,j+1) = u(i,j) + alpha*(u(i+1,j) - 2*u(i,j) + u(i-1,j)) + dt*dx*dx*F(u(i,j));
    end
end
u=u';
end
