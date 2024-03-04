tmax = 20;
dt = 0.1;

[xvec, tvec, umat, left_good, right_good] = diff_soln_1d(20, tmax, 0.1,dt, 1e-3, "gauss");

if ~left_good || ~right_good
    error("Not 0 at endpoints")
end

ts = 1:tmax/dt;
areas=[];
for t=ts
    uvec = umat(t, :);
    areas = [areas trapz(xvec, uvec)];
end
range(areas)