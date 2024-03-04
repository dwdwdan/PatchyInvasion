function [x, y, t, u]  = pure_diff_2d(L, dl, dt, t, t0, ic)

tmax = t(end);
t_idx = round((t - t0)./dt+1,0);
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
save_idx = 1;
for idx = 1:t_idx_max
    fprintf("t index: %d/%d\n", idx, t_idx_max)
    u_new = zeros(length(x), length(y));
    for x_idx = 2:length(x) - 1
        for y_idx = 2:length(y) - 1
            u_new(x_idx, y_idx) = u_old(x_idx, y_idx) + ...
                                    +a*(u_old(x_idx+1, y_idx) ...
                                    + u_old(x_idx-1, y_idx) ...
                                    + u_old(x_idx, y_idx+1) ...
                                    + u_old(x_idx, y_idx-1) ...
                                    -4*u_old(x_idx, y_idx));
        end
    end
    u_old = u_new;
    if ismember(idx, t_idx)
        u(:,:, save_idx) = u_new;
        save_idx = save_idx + 1;
    end
end
end