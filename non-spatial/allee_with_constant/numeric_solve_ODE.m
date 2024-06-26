% This script solves the non-spatial ODEs considering the Strong Allee Effect.
clear
close all

%% Function Parameters
K = 1000;               % Carrying Capacity
alpha = 0.01;
beta = 200;
tmax = 10;              % Time at end of interest
num_timesteps = 100;     % Number of timesteps to use
epsilon = 1;

dt=tmax/num_timesteps;  % Time step


cs = [-200 0 75 100];
u0s = [0:50:300 300:200:1500];
convergence_times = [];
for c = cs
    fig = figure('Units','inches', 'Position',[1 1 2 2]);
    nexttile
    allee_diff = @(t,u) alpha*u * (u-beta) * (1-u/K) + c;
    hold on
    for u0 = u0s
        [t, u_num] = ode45(allee_diff, 0:dt:tmax, u0);
        plot(t, u_num);
        title("c = " + c)
        xlabel("Time")
        ylabel("Population")
        ylim([0 1500]);
        yticks(0:200:1500)
        steady_states = get_steady_state(alpha, beta, K, c);
        for ss = steady_states
            yline(ss, '--')
        end
    end
    hold off

    exportgraphics(fig, "allee_const_soln"+c+".pdf")
    close

end
