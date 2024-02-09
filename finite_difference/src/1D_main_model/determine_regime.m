function regime = determine_regime(u, tol, central_region)
    % u is a vector
 
    if max(u) < tol
        % Extinction
        regime = -1;
    elseif min(u(central_region)) > 1-tol
        % Travelling wave
        regime = -2;
    else
        % Unclassified so use the object count
        binary_u = u>=tol;
        [~, count] = bwlabel(binary_u);
        regime=count;
    end

end

