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
            case 0
                plot(ms(m_idx), betas(beta_idx), 'b*')
            case 1
                plot(ms(m_idx), betas(beta_idx), 'ro')
	    case -1
                plot(ms(m_idx), betas(beta_idx), 'k.')
        end
    end
end

xlabel("m")
ylabel("beta")
xlim([min(ms), max(ms)])
ylim([min(betas), max(betas)])

hold off
