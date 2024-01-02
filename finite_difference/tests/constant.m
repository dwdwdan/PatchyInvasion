for c=-10:0.1:10
    [x, t, u] = pure_diffusion_solver(10,10,0.1,1e-3, @(x) c, c, c);
    max_range = max(range(u, 2));
    assert(max_range<1e-3, "Constant IC does not lead to constant solution")
end
fprintf("Constant Function Test Passed")