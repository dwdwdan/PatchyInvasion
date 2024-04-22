

for idx=1:10
    load("regime" + idx + ".mat")
    mid_idx = ceil(length(y)/2);

    fig = figure();
    hold on
    for t_idx = length(t)
        plot(x,u(:,mid_idx, t_idx), 'DisplayName',"t = " + t(t_idx))
    end
    title("m = " + m)
    ylim([0 1.1])
    xlabel("x")
    ylabel("u")
    if idx>5
        xlim([-350 350])
    end

    fig.PaperUnits = "inches";
    fig.PaperSize = [2 2];
    fig.PaperPositionMode = "manual";
    fig.PaperPosition = [0 0 2 2];
    saveas(fig, "2d_main_model_xu" + idx + ".pdf", 'pdf')
    close
end