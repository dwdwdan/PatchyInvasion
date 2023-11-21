clear
syms u v t gamma beta m
assume(gamma, "real")
assume(beta, "real")
assume(m, "real")

u_rhs = gamma*u*(u-beta)*(1-u) - u*v;
v_rhs = u*v - m*v;

hor_iso_u = solve(u_rhs == 0, u);
hor_iso_v = solve(u_rhs == 0, v);

vert_iso_u = solve(v_rhs == 0, u);
vert_iso_v = solve(v_rhs == 0, v);

equilibria = solve(u_rhs == 0, v_rhs == 0);

u_eqs = equilibria.u;
v_eqs = equilibria.v;

eqs = [u_eqs v_eqs];

J = jacobian([u_rhs; v_rhs], [u v]);

eigs = [];
for eq=eqs'
    eig_val = eig(subs(J, [u v], [eq(1), eq(2)]));
    eigs = [eigs eig_val];
end
