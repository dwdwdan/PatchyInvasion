function u0 = ic_gauss(x, epsilon)
    u0 = normpdf(x);

    if u0<epsilon
        u0 = 0;
    end
end

