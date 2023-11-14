clear all
syms u v t gamma beta m

u_rhs = gamma*u*(u-beta)*(1-u) - u*v;
v_rhs = u*v - m*v;

hor_iso_u = solve(u_rhs == 0, u);
hor_iso_v = solve(u_rhs == 0, v);

vert_iso_u = solve(v_rhs == 0, u);
vert_iso_v = solve(v_rhs == 0, v);

steady_states = solve(u_rhs == 0, v_rhs == 0);

