gamma = 10;

dt=1e-2;
dx=1;
tmax = 100;
X=200;
epsilon = 1e-3;

u0 = @(x) ic_gauss(x, epsilon, 0,1);
v0 = u0;

ms = 0:0.015:1.5;
betas = 0:0.01:0.25;

central_region_width = 25;
tol = 1e-3;

regimes=[];

x_length = 2*X/dx;
x_mid_idx = round(x_length/2,0);
central_region_width_idx = central_region_width/dx;



central_region = floor(x_mid_idx-central_region_width_idx):ceil(x_mid_idx+central_region_width_idx);

num_betas = length(betas);
tic
parfor m_idx=1:length(ms)
    for beta_idx=1:num_betas
        m = ms(m_idx);
        beta = betas(beta_idx);
        
        [~,~,u,~] = solver_1d(X, tmax, dx, dt, u0, v0, epsilon, gamma, m, beta);
        

        regime = classify_regime(u(end,:), tol, central_region);
        regimes(m_idx, beta_idx) = regime;
    end
end
toc

save("regimes.mat")
%% Plot the graph
fig=figure();
hold on

for m_idx=1:length(ms)
    for beta_idx=1:length(betas)
        switch regimes(m_idx, beta_idx)
            case -1
                % Extinction
                plot(ms(m_idx), betas(beta_idx), 'k.')
            case -2
                % Propagating Wave
                plot(ms(m_idx), betas(beta_idx), 'ro')
            case 1
                plot(ms(m_idx), betas(beta_idx), 'g*')
            case 2
                plot(ms(m_idx), betas(beta_idx), 'b*')
            case 3
                plot(ms(m_idx), betas(beta_idx), 'k*')
            otherwise
                plot(ms(m_idx), betas(beta_idx), 'r*')
            end
    end
end

qw{1} = plot(nan, 'k.');
qw{2} = plot(nan, 'ro');
qw{3} = plot(nan, 'g*');
qw{4} = plot(nan, 'b*');
qw{5} = plot(nan, 'k*');
qw{6} = plot(nan, 'r*');

legend([qw{:}], {'Extinction', 'Propagating Wave', '1 Object', '2 Objects', ...
    '3 Objects', '4 or More Objects'}, 'Location', 'southeast')

xlabel("\(m\)", 'Interpreter','latex')
ylabel("\(\beta\)", 'Interpreter','latex')
title("Regime Classification depending on \(m\) and \(\beta\)", 'Interpreter','latex')
xlim([min(ms), max(ms)])
ylim([min(betas), max(betas)])

hold off
