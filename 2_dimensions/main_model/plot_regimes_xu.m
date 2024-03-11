fig = figure();
tiledlayout(2, 3)

for idx=[1 2 3 4 6 9]
    load("regime" + idx + ".mat")
    mid_idx = ceil(length(y)/2);

    nexttile
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
end