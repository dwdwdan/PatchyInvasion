gamma = 10;

dt=1e-2;
dx=1;
tmax = 100;
X=200;
epsilon = 1e-3;

u0 = @(x) ic_gauss(x, epsilon, 0,1);
v0 = u0;

ms = 0:0.01:1.5;
betas = 0:0.01:0.25;

regimes=[];

num_betas = length(betas);
tic
parfor m_idx=1:length(ms)
    for beta_idx=1:num_betas
        m = ms(m_idx);
        beta = betas(beta_idx);
        
        [~,~,u,~] = solver_1d(X, tmax, dx, dt, u0, v0, epsilon, gamma, m, beta);
        
        regime = determine_regime(u(end,:), 1e-3);
        regimes(m_idx, beta_idx) = regime;
    end
end
toc
%% Plot with new system
fig=figure();
hold on

for m_idx=1:length(ms)
    for beta_idx=1:length(betas)
        switch regimes(m_idx, beta_idx)
            case -1
                % Extinction
                plot(ms(m_idx), betas(beta_idx), 'ko')
            case -2
                % Propagating Wave
                plot(ms(m_idx), betas(beta_idx), 'ro')
            case 1
                plot(ms(m_idx), betas(beta_idx), 'g*')
            case 2
                plot(ms(m_idx), betas(beta_idx), 'b*')
            case 3
                plot(ms(m_idx), betas(beta_idx), 'r*')
            case 4
                plot(ms(m_idx), betas(beta_idx), 'r*')
            case 5
                plot(ms(m_idx), betas(beta_idx), 'r*')
            otherwise
                error("Regime %g not coloured", regimes(m_idx, beta_idx))
        end
    end
end

xlabel("m")
ylabel("beta")
title("Regime Classification depending on m and beta")
xlim([min(ms), max(ms)])
ylim([min(betas), max(betas)])

hold off
