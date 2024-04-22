

for idx=1:10
    load("regime" + idx + ".mat")

    fig = figure();
    imagesc(x, y, u(:,:, end))
    title("m = " + m)
    clim([0 1])
    if idx>5 && idx<10
        xlim([-300 300])
        ylim([-300 300])
    end

    colorbar

    fig.PaperUnits = "inches";
    fig.PaperSize = [2.5 2];
    fig.PaperPositionMode = "manual";
    fig.PaperPosition = [0 0 2.5 2];
    saveas(fig, "2d_main_model_xy" + idx + ".pdf", 'pdf')
    close
end