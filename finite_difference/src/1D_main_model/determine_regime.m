function regime = determine_regime(u)
    % u is a vector

    len = length(u);
    mid_idx = len/2;
    central_region_width = len/8;
    central_region = floor(mid_idx-central_region_width/2):ceil(mid_idx+central_region_width/2);

    if max(u) == 0
        regime = 0;
    elseif min(u(central_region)) >= 1-1e-4
        regime = 1;
    else
        regime = -1;
    end

end

