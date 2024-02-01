function regime = determine_regime(u, tol)
    % u is a vector

    len = length(u);
    mid_idx = len/2;
    central_region_width = len/8;
    central_region = floor(mid_idx-central_region_width/2):ceil(mid_idx+central_region_width/2);

    if max(u) <= tol
        % Extinction
        regime = -1;
    elseif min(u(central_region)) >= 1-tol
        % Travelling wave
        regime = -2;
    else
        % Unclassified so use the object count
        binary_u = u>=tol;
        [~, count] = bwlabel(binary_u);
        regime=count;
    end

end

