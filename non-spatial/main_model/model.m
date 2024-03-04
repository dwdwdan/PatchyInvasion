function [du, dv] = model(u, v, gamma, beta, m)
du = gamma * u * (u-beta) * (1-u) - u*v;
dv = u*v - m*v;
end

