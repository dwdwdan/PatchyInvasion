function [infty, two] = compute_error(numerical, analytical)
    % Compute the error in infinity norm and 2 norm
    %  
    % Inputs:   numerical:  the numerical solution of the ODE
    %           analytical: the analytical solution of the ODE evaluated
    %                       at t_i
    %
    % Outputs:  infty:      The error in the infinity norm
    %           two         The error in the euclidean 2-norm
    
    e = abs(numerical - analytical);
    infty = max(e);
    two = norm(e,2);
end