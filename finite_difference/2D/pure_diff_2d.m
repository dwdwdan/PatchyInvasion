function [x, y, t, u]  = pure_diff_2d(L, dl, dt, t, diff_coeff, t0, ic)

tmax = t(end);
t_idx = (t - t0)./dt+1;

x = -L:dl:L;
y = x;

alpha = diff_coeff*dt/(dl*dl);
assert(alpha <= 0.25, "Not Stable")
% Source for 0.25: https://math.mit.edu/research/highschool/rsi/documents/2017Lee.pdf

% Initialise u to be a zero matrix
u = zeros(length(x), length(y), length(t));

if isstring(ic) && ic=="gauss"
    ic = ic_gauss(x, y);
end

u_old = ic;

for idx = 1:length(tmax)
    u_new = zeros(length(x), length(y));
    for x_idx = 2:length(x) - 1
        for y_idx = 2:length(y) - 1
            u_new(x_idx, y_idx) = u_old(x_idx, y_idx) + ...
                                    +alpha*(u_old(x_idx+1, y_idx) ...
                                    + u_old(x_idx-1, y_idx) ...
                                    + u_old(x_idx, y_idx+1) ...
                                    + u_old(x_idx, y_idx-1) ...
                                    -4*u_old(x_idx, y_idx));
        end
    end
    u_old = u_new;
    if ismember(idx, t_idx)
        u(:,:, idx) = u_new;
    end
end
end