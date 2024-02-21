function [t, u] = analytic(alpha, beta, K, u0, u)
    % Compute analytic solution to the Allee ODE
    %
    % Inputs:   alpha:  The parameter alpha from the model
    %           beta:   The unstable steady state from the model
    %           K:      The carrying capacity of the model
    %           u0:     The initial condition
    %           u:      A vector of u values to compute time for
    %
    % Outputs:  t:      The time vector corresponding to u
    %           u:      A vector for u consisting of only the u's entered
    %                   with a positive time value


if u0>max(u) || u0<min(u)
    warning("u0 is not in u. This could lead to an empty return " + ...
        "if u never reaches these values")
end

c = Z_star(u0);

t = (Z_star(u) - c)./alpha;
t = t(imag(t)==0);
t = t(t>=0);
u = u(t>=0);

    function out = Z_star(u)
        term1 = (beta-K).*log(abs(u));
        term2 = K.*log(abs(u-beta));
        term3 = -beta .* log(abs(u-K));
        out = term1 + term2 + term3;
        out = out./(beta.*(K-beta));
    end
end
