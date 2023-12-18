dt = 1e-1;
dx = 1e-1;
tmax = 100;
X=100;

epsilon = 1e-3;

[xvec, tvec, umat] = solve_and_check(100,tmax,dx,dt,epsilon, 1,0,1);

% From plotting this solution, the wave exists by t=40, so we use compute
% the propagation speed from this point
tmin = 40;
midpoint_x = floor(length(xvec)/2);

first_near_0s=[];

for idx=1:60
    t = tmin+idx;
    t_idx = t./dt;
    uvec = umat(t_idx,midpoint_x:end);
    first_near_0 = get_first_close_index(0, epsilon, uvec);
    first_near_0s = [first_near_0s first_near_0];
end

for idx = 2:length(first_near_0s)
    prop_speed(idx-1) = first_near_0s(idx) - first_near_0s(idx-1);
end

% Prop speed appears constant, so we compute it using a large single time
% interval

long_term_propagation_speed = (first_near_0s(end) - first_near_0s(1))./length(first_near_0s)