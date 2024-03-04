function [x, y, t, u]  = diff_reaction_2d(L, dl, dt, t, t0, ic, alpha, beta, K)

tmax = t(end);
t_idx = (t - t0)./dt+1;
t_idx_max = tmax./dt + 1;

x = -L:dl:L;
y = x;

a = dt/(dl*dl);
assert(a <= 0.25, "Not Stable")
% Source for 0.25: https://math.mit.edu/research/highschool/rsi/documents/2017Lee.pdf



% Initialise u to be a zero matrix
u = zeros(length(x), length(y), length(t));

if isstring(ic) && ic=="gauss"
    ic = ic_gauss(x, y);
end

u_old = ic;

u_idx=1;
for idx = 1:t_idx_max
    fprintf("t index: %d/%d\n", idx, t_idx_max)
    u_new = zeros(length(x), length(y));
    for x_idx = 2:length(x) - 1
        for y_idx = 2:length(y) - 1
            F = alpha*u_old(x_idx, y_idx)*(1 - u_old(x_idx, y_idx)/K)*(u_old(x_idx, y_idx)-beta);
                        u_new(x_idx, y_idx) = u_old(x_idx, y_idx) + ...
                                    +a*(u_old(x_idx+1, y_idx) ...
                                    + u_old(x_idx-1, y_idx) ...
                                    + u_old(x_idx, y_idx+1) ...
                                    + u_old(x_idx, y_idx-1) ...
                                    -4*u_old(x_idx, y_idx)) ...
                                    + dt*F;
        end
    end
    u_old = u_new;
    if idx==t_idx(u_idx)
        u(:,:, u_idx) = u_new;
        u_idx = u_idx+1;
    end
end
end

