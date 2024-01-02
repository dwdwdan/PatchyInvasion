dt = 1e-1;
dx = 1e-1;
tmax = 100;
X=100;

epsilon = 1e-3;

[xvec, tvec, umat] = solve_and_check(100,tmax,dx,dt,epsilon, 1,0.06,1);

% From plotting this solution, the wave exists by t=40, so we use compute
% the propagation speed from this point
tmin = 40;
tmin_idx = tmin/dt;
t_idxs=tmin_idx:5:length(tvec);
ts=t_idxs.*dt;

midpoint_x = floor(length(xvec)/2);

first_near_0s=[];

for t_idx=t_idxs
    uvec = umat(t_idx,midpoint_x:end);
    first_near_0 = get_first_close_index(0, epsilon, uvec)*dt;
    first_near_0s = [first_near_0s first_near_0];
end

prop_speed=[];
for idx = 2:length(first_near_0s)
    prop_speed(idx-1) = (first_near_0s(idx) - first_near_0s(idx-1))./(ts(idx) - ts(idx-1));
end

% Prop speed appears constant, so we compute it using a large single time
% interval

long_term_propagation_speed = (first_near_0s(end) - first_near_0s(1))./(ts(end)-ts(1))