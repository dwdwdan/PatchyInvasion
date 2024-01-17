function u0 = ic_gauss(x, epsilon, mean, sd)
    u0 = normpdf(x, mean, sd);

    if u0<epsilon
        u0 = 0;
    end
end

