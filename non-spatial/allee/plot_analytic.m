K = 1000;
alpha = 0.01;
beta = 200;

u0s = [50 195 205 300 600 900 1200];

fig = figure();
hold on

for u0 = u0s
    u=generate_u(u0, beta, K);
    [t, u_ana] = analytic(alpha, beta, K, u0, u);
    plot(t, u_ana)
end
hold off
yline(beta, '--')
yline(K, '--')
legend({'u_0 = 50', 'u_0 = 195', 'u_0 = 205', ...
    'u_0 = 300', 'u_0 = 600', 'u_0 = 900', 'u_0 = 1200', '',''})
xlabel("Time")
ylabel("Population")
title("Analytic Solution to the Allee Model")




function u = generate_u(u0, beta, K)
    if u0<0
            u = u0:0;
        else
            if u0<beta
                u=0:u0;
            else
                if u0<K
                    u=u0:K;
                else
                    u=K:u0;
                end
            end
    end
end
