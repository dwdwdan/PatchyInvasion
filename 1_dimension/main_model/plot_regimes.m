gamma = 10;
beta = 0.1;


dt=1e-2;
dx=1;
tmax = 100;
X=200;
epsilon = 1e-3;
xs = [];
ts = [];
us = [];
vs = [];

ms = [2 0.6 0.54 0.5 0.49 0.1];
parfor idx = 1:length(ms)
    m = ms(idx);
    [x, t, u, v] = solver_1d(X, tmax, dx, dt, @(x) ic_gauss(x, epsilon, 0,1), @(x) ic_gauss(x,epsilon, 0, 1), epsilon, gamma, m, beta);
    xs(:,idx) = x;
    ts(:,idx) = t;
    us(:,:,idx) = u;
    vs(:,:,idx) = v;
end
%%
save("solutions_regimes.mat")
%%

regime_labels = ["I", "II", "III", "IV", "V", "VI"];
for idx = 1:size(us, 3)
    fig=figure('Units','inches');
    plot(xs(:, idx),us(end, :,idx))
    shading interp
    title("m = " + ms(idx))
    yline(1, '--')
    xlabel("x")
    ylabel("u")
    ylim([0 1.1])

    fig.PaperUnits = "inches";
    fig.PaperSize = [2 2];
    fig.PaperPositionMode = "manual";
    fig.PaperPosition = [0 0 2 2];
    saveas(fig, "main_model_1d_regimes" + idx + ".pdf", 'pdf')
    close
end