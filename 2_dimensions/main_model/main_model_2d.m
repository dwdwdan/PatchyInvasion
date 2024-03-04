function [x, y, t, u_solns, v_solns]  = main_model_2d(L, dl, dt, t, gamma, beta, m, ic_kappa, ic_lu, ic_lv)

tmax = t(end);
t_idx = round(t./dt+1,0);
t_idx_max = tmax./dt + 1;

x = -L:dl:L;
y = x;

a = dt/(dl*dl);
assert(a <= 0.25, "Not Stable")
% Source for 0.25:
% https://math.mit.edu/research/highschool/rsi/documents/2017Lee.pdf

assert(ic_lv<ic_lu, "initial support of v is bigger than for u")
assert(ic_kappa<=1, "Kappa must be <= 1")



% Initialise u and v to be a zero matrix
u_solns = zeros(length(x), length(y), length(t));
v_solns = zeros(length(x), length(y), length(t));

[gridx, gridy] = meshgrid(x, y);

vic = ones(length(x), length(y));

vic(abs(gridx)>=ic_lv) = 0;
vic(abs(gridy)>=ic_lv) = 0;

vic = vic*ic_kappa;


uic = 1-vic;

uic(abs(gridx)>=ic_lu) = 0;
uic(abs(gridy)>=ic_lu) = 0;


u_old = uic;
v_old = vic;

u_idx=1;
for idx = 1:t_idx_max
    u_new = zeros(length(x), length(y));
    v_new = zeros(length(x), length(y));
    for x_idx = 2:length(x) - 1
        if max(u_old(x_idx-1:x_idx+1, :), [], "all") == 0 && max(v_old(x_idx-1:x_idx+1,:),[], "all") == 0
            continue
        end
        for y_idx = 2:length(y) - 1

            u = u_old(x_idx, y_idx);
            v = v_old(x_idx, y_idx);

            F = gamma*u*(u-beta)*(1-u) - u*v;
            G = u*v - m*v;

            u_new(x_idx, y_idx) = u_old(x_idx, y_idx) + ...
                                  +a*(u_old(x_idx+1, y_idx) ...
                                  + u_old(x_idx-1, y_idx) ...
                                  + u_old(x_idx, y_idx+1) ...
                                  + u_old(x_idx, y_idx-1) ...
                                  -4*u_old(x_idx, y_idx)) ...
                                  + dt*F;

            v_new(x_idx, y_idx) = v_old(x_idx, y_idx) + ...
                                  +a*(v_old(x_idx+1, y_idx) ...
                                  + v_old(x_idx-1, y_idx) ...
                                  + v_old(x_idx, y_idx+1) ...
                                  + v_old(x_idx, y_idx-1) ...
                                  -4*v_old(x_idx, y_idx)) ...
                                  + dt*G;
        end
    end

    if max(u_old, [], 'all') < 1e-3 && max(v_old, [], 'all') < 1e-3
        fprintf("Both Populations Extinct\n")
        break
    end

    u_old = u_new;
    v_old = v_new;
    if idx==t_idx(u_idx)
        u_solns(:,:, u_idx) = u_new;
        v_solns(:,:, u_idx) = v_new;
        u_idx = u_idx+1;
    end
end
end


