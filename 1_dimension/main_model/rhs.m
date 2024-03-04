function [urhs, vrhs] = rhs(u,v, gamma, m ,beta)

urhs = gamma * u * (u-beta) * (1-u) - u*v;
vrhs = u*v - m*v;
end

