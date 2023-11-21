function [du, dv] = model(u, v, gamma, beta, m)
%MODEL Summary of this function goes here
%   Detailed explanation goes here
du = gamma * u * (u-beta) * (1-u) - u*v;
dv = u*v - m*v;
end

