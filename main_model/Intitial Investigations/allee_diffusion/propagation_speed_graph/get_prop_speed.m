function [ts, propspeeds] = get_prop_speed(tvec, xvec, umat, dt, ucomp)
xcomps = [];
propspeeds = [];
for idx=1:length(tvec)
    uvec = umat(idx,:);
    xcomp = get_first_less_than(uvec, xvec, ucomp, 1e-3);
    xcomps = [xcomps xcomp];
end

for idx = 1:length(xcomps)-1
    if xcomps(idx+1) == Inf
        continue
    end
    propspeed = (xcomps(idx+1) - xcomps(idx))/dt;
    propspeeds(idx) = propspeed;
end
ts = tvec(1:end-1);
end

