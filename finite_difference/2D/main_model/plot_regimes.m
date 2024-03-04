fig = figure();
tiledlayout(3,3)

for idx=[10 1:8]
    load("regime" + idx + ".mat")

    nexttile
    imagesc(x, y, u(:,:, end))
    colorbar
    title("m = " + m)
    xlabel("x")
    ylabel("y")
end