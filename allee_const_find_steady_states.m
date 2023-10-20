clear
close all


alpha = 0.01;
beta = 200;
K = 1000;
cs = [-300:300 89:0.1:94];
us = [];
x0s = 0:100:1500;


for i=1:length(cs)
    c=cs(i);
    roots=[];
    allee_diff = @(u) alpha*u * (u-beta) * (1-u/K) + c;
    for x0 = x0s
        u = fzero(allee_diff, x0);
        roots=[roots u];
    end
    roots = uniquetol(roots, 1e-3);
    for root=roots
        plot(c,root,'k.')
    end
    hold on
end
hold off
xlabel("c");
ylabel("Steady States")
title("Numerical Estimates for steady states depending on c")
yline(0, '--')
yline(K, '--')
yline(beta, '--')