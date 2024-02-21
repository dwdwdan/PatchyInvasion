function [x, t, u, v] = solver_1d(X, tmax, dx, dt, u0, v0, epsilon, gamma, m, beta)

alpha = dt/(dx*dx);
assert(alpha<0.5, "alpha is too large. The solution will not converge")

% Vectors x and t represent the values of x and t at the relevant indices
x = -X:dx:X;
t = 0:dt:tmax;

alpha = dt/(dx*dx);

% Initialise u to be a zero matrix
u = zeros(length(x), length(t));
v = zeros(length(x), length(t));

% Apply the initial Condition
u(:,1) = u0(x);
v(:,1) = v0(x);

% We don't need to explictly apply the boundary conditions because we have
% set u to be the zero matrix, but we do anyway for completeness
u(1,:) = 0;
v(1,:) = 0;

u(end, :) = 0;
v(end, :) = 0;

for j=1:length(t)-1
    % If the maximum of both is small, we know both populations are
    % extinct, so we can stop computing here.
    if max(u(:,j))<epsilon && max(v(:,j))<epsilon
        break
    end

    newu=zeros(length(x)-2,1);
    newv=zeros(length(x)-2,1);
    for i=2:(length(x)-2)
        [F, G] = rhs(u(i,j),v(i,j),gamma, m, beta);
        newu(i) = u(i,j) + alpha*(u(i+1,j) - 2*u(i,j) + u(i-1,j)) + dt*F;
        newv(i) = v(i,j) + alpha*(v(i+1,j) - 2*v(i,j) + v(i-1,j)) + dt*G;
    end
    u(2:length(x)-2, j+1) = newu(2:length(x)-2);
    v(2:length(x)-2, j+1) = newv(2:length(x)-2);
end
u=u';
v=v';
end