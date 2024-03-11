fig = figure();
tiledlayout(3,3)

for idx=1:9
    load("regime" + idx + ".mat")

    nexttile
    imagesc(x, y, u(:,:, end))
    title("m = " + m)
    clim([0 1])
    xlabel("x")
    ylabel("y")
    if idx>5
        xlim([-300 300])
        ylim([-300 300])
    end
end
cb = colorbar();
cb.Layout.Tile = 'east';