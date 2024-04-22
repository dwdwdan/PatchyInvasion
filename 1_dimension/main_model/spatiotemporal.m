gamma = 10;
beta = 0.15;
tol = 1e-3;

dt=0.1;
dx=1;
tmax = 500;
X=1000;
epsilon = 1e-3;

u0 = @(x) ic_gauss(x, epsilon, 0,1);
v0 = u0;

ts = 1:1:tmax;

ms = [1 0.53 0.14 0.1];
parfor m_idx=1:length(ms)
    m=ms(m_idx);
    [x, t, u, ~] = solver_1d(X, tmax, dx, dt, u0, v0, epsilon, gamma, m, beta);

    binary_u = u >= tol;




    object_counts = NaN(length(ts), 1);
    for idx=1:length(ts)
        t_idx=ts(idx)/dt;
        [~, count] = bwlabel(binary_u(t_idx, :));
        object_counts(idx) = count;
    end
    all_object_counts(:, m_idx) = object_counts;
end

%% Plot

xlims = [50 250 50 75];
for m_idx = 1:length(ms)
    fig=figure();

    plot(ts,all_object_counts(:, m_idx),'-', 'MarkerSize',4)
    title("m="+ms(m_idx))
    xlabel("t")
    ylabel("n(t)")
    ylim([0 max(all_object_counts(:,m_idx))+1])
    xlim([0 xlims(m_idx)])

    fig.PaperUnits = "inches";
    fig.PaperSize = [3 1.5];
    fig.PaperPositionMode = "manual";
    fig.PaperPosition = [0 0 3 1.5];
    %saveas(fig, "main_model_1d_spatiotemporal" + m_idx + ".pdf", 'pdf')
    %close
end
