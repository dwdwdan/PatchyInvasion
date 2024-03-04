gamma = 10;
beta = 0.1;
ucomp = 1e-3;

dt=1e-3;
dx=1;
tmax = 50;
X=100;
epsilon = 1e-3;

u0 = @(x) ic_gauss(x, epsilon, 0,1);
v0 = u0;




xcomps = [];
propspeeds = [];

speed_dt = 1;

ts_to_measure_pos = 0:speed_dt:tmax;

ms = [2 0.5 0.1];
fig=figure();
hold on
for m_idx=1:length(ms)
    m=ms(m_idx);

    [x, t, u, ~] = solver_1d(X, tmax, dx, dt, u0, v0, epsilon, gamma, m, beta);

    xcomps = [];
    for idx=1:length(ts_to_measure_pos)
        t_now = ts_to_measure_pos(idx);
        t_idx = round(t_now/dt + 1,0);
        uvec = u(t_idx,:);
        xcomp = -get_front_position(uvec, x, ucomp, 1e-3);
        xcomps = [xcomps xcomp];
    end
    
    propspeeds=[];
    for idx = 1:length(xcomps)-1
        if xcomps(idx+1) == Inf
            continue
        end
        propspeed = (xcomps(idx+1) - xcomps(idx))/speed_dt;
        propspeeds(idx) = propspeed;
    end

    smoothed_propspeeds = smoothdata(propspeeds, 'gaussian', 10);
    plot(smoothed_propspeeds)
end
xlim([0 40])
ylim([0 7])
xlabel("Time")
ylabel("Propagation Speed")
legend(["m=2", "m=0.5", "m=0.1"])
hold off