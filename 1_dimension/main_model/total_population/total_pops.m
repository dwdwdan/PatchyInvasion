ms = [0.6];
beta = 0.1;
gamma = 10;

for m=ms
    [M, t] = get_total_population(m, beta, gamma);
    fig=figure();
    pause(1)
    plot(t, M)
    title("m = " + m)
    xlabel("t")
    ylabel("M")
    if m>0.1
        ylim([0 800])
    end
    pause(1)
    fig.Units = "inches";
    fig.Position = [1 1 2 2];
    pause(1)
    exportgraphics(fig, "total_pop"+m+".pdf")
    pause(1)
    close
end