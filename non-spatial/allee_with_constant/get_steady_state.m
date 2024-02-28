function [roots] = get_steady_state (alpha, beta, K, c)
    x0s = 0:100:1500;
    roots=[];
    allee_diff = @(u) alpha*u * (u-beta) * (1-u/K) + c;
    for x0 = x0s
        u = fzero(allee_diff, x0);
        roots=[roots u];
    end
    roots = uniquetol(roots, 1e-3);
end

