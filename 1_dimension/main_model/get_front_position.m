function x_val = get_front_position(u, x, ucomp, tol)

for i=1:length(u)
    if abs(u(i) - ucomp)<tol
        x_val=x(i);
        return
    end
end
if exist('x_val','var') == 0
    x_val=NaN;
end
end