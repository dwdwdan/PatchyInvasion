clear
syms u v t

P = u*(1-v);
Q = v*(1-u);
rhs = [P; Q];

% Find the steady states
[ueq, veq] = solve(rhs == [0;0]);

% Compute the jacobian of the system
J = jacobian(rhs);

[eig_vecs, eig_vals] = eig(J);

% At steady state (0,0)
eig_val1 = diag(subs(eig_vals, [u, v], [ueq(1), veq(1)]));
% The eigenvalues are equal and positive, so we do not need to compute
% eigenvectors

% At steady state (1,1)
eig_val2 = diag(subs(eig_vals, [u, v], [ueq(2), veq(2)]));
eig_vec2 = double(subs(eig_vecs, [u, v], [ueq(2), veq(2)]));
% The eigenvectors are given by the columns of eig_vec2