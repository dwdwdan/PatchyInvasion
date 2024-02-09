function x = get_first_less_than(uvec, xvec, u_comp, tol)
    midpoint_idx = floor(length(uvec)/2);
    uvec = uvec(midpoint_idx:end);
    xvec = xvec(midpoint_idx:end);
    for i=1:length(uvec)
        if abs(uvec(i) - u_comp)<tol
            x=xvec(i);
            return
        end
    end
    if exist('x','var') == 0
        x=NaN;
    end
end
