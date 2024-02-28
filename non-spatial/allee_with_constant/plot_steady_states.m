clear
close all


alpha = 0.01;
beta = 200;
K = 1000;
cs = [-300:300 89:0.1:94];
us = [];
fig=figure();
hold on

for i=1:length(cs)
    c=cs(i);
    roots = get_steady_state(alpha, beta, K, c);
    for root=roots
        [ss, stab] = check_stability(alpha, beta, K, c, root, 1e-2, 700, 1e-3);
        if stab
            plot(c,ss,'g.')
        else
            plot(c, ss, 'r.')
        end
    end
end
xlabel("c");
ylabel("Steady States")
title("Bifurcation Diagram")
yline(0, '--')
yline(K, '--')
yline(beta, '--')
red_point = plot(NaN, NaN, 'r');
grn_point = plot(NaN, NaN, 'g');
legend([red_point grn_point], {'Unstable Steady States', 'Stable Steady States'}, 'Location','east')
hold off


