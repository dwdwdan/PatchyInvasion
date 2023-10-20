function idx = get_first_close_index(K, epsilon, u)
    idx = inf;
    for i=1:length(u)
        if abs(u(i) - K) < epsilon
            idx = i;
            break
        end
    end

end