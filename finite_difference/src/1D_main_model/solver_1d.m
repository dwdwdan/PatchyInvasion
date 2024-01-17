function [x, t, u, v] = solver_1d(X, tmax, dx, dt, u0, v0, epsilon)

% Vectors x and t represent the values of x and t at the relevant indices
x = -X:dx:X;
t = 0:dt:tmax;

alpha = dt/(dx*dx);
delta = dt*dx*dx;

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
    fprintf("j=%d/%d\n", j, length(t)-1);

    % If the maximum of both is small, we know both populations are
    % extinct, so we can stop computing here.
    if max(u(:,j))<epsilon && max(v(:,j))<epsilon
        break
    end

    for i=2:(length(x)-2)

        % Compute the source terms
        [F, G] = rhs(u(i,j), v(i,j));
        u(i,j+1) = u(i,j) + alpha*(u(i+1,j) - 2*u(i,j) + u(i-1,j)) + delta*F;
        v(i,j+1) = v(i,j) + alpha*(v(i+1,j) - 2*v(i,j) + v(i-1,j)) + delta*G;
    end
end
u=u';
v=v';
end