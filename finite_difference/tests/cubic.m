[x, t, u] = pure_diffusion_solver(1,10,0.1,1e-3, @(x) x.^3, -1, 1);

lin_fit = fit(x', u(end,:)', 'poly1');

conf = confint(lin_fit);

assert(range(conf(:,1)==0), "Cubic IC does not lead to linear solution")
fprintf("Cubic Function Test Passed")