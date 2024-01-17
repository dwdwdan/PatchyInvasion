function [urhs, vrhs] = rhs(u,v)
%U_LHS Summary of this function goes here
%   Detailed explanation goes here
global gamma beta m

urhs = gamma * u * (u-beta) * (1-u) - u*v;
vrhs = u*v - m*v;
end

