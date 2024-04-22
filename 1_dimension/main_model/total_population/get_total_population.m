function [M, tvec] = get_total_population(m, beta, gamma)

    dt=1e-2;
    dx=1;
    tmax = 100;
    X=200;
    epsilon = 1e-3;
    
    u0 = @(x) ic_gauss(x, epsilon, 0,1);
    v0 = u0;

    [x,tvec,u,v] = solver_1d(X, tmax, dx, dt, u0, v0, epsilon, gamma, m, beta);
    total_pop = u+v;

    for idx = 1:length(tvec)
        popvec = total_pop(idx, :);
        M(idx) = trapz(x, popvec);
    end

end

