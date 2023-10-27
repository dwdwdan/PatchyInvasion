function ax_top = setup_figure(tmax, dt, fsize)

fig = figure();
ax = axes();
hold(ax);
xlabel("Time")
ax.XLim=[0 tmax];
ax.YTick=[];
fontsize(ax, fsize, "points");


ax_top = axes();
hold(ax_top);
ax_top.XAxisLocation = 'top';
ax_top.XLim = [0 tmax/dt];
xlabel("Number of Time Steps");
ylabel("Population")


linkprop([ax ax_top], {'Units', 'Position', 'ActivePositionProperty'});

end