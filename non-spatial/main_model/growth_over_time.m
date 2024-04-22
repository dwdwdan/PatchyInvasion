clear
close all

tmax = 15;

gamma = 5;
beta = 0.5;
m = 0.9;

u0s = [1.5 1.5 1.5 0.6];
v0s = [0.4 0.5 0.1 0.1];

for idx = 1:length(u0s)
    fig = figure('Units','inches', 'Position',[1 1 2 2]);

    [ts, ws] = ode45(@(t, W) f(W, gamma, beta, m), [0, tmax], [u0s(idx);v0s(idx)]);
    
    plot(ts, ws(:, 1));
    hold on
    plot(ts, ws(:, 2));
    xlabel("Time");
    ylabel("Population")
    title("\(u_0 = " + u0s(idx) + "\), \(v_0 = "+v0s(idx) + "\)", 'Interpreter','latex')
    ylim([0 1.2])
    yline(0.9, "--")
    yline(0.2, "--")
    legend(["u","v", "", ""], 'Location','east');

    exportgraphics(fig, "main_model_non_spatial_over_time"+idx+".pdf")
    close
end

function W = f(W, gamma, beta, m)
    [u, v] = model(W(1), W(2), gamma, beta, m);
    W = [u;v];
end