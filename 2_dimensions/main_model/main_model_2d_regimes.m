clear

tmax = 600;
L = 600;
dl = 1;
dt = 0.1;

ic_lu = 4;
ic_lv = 1;
ic_kappa = 0.5;

gamma=6;
beta=0.21;

ms = [1 0.6 0.59 0.57 0.53 0.38675 0.386 0.379 0.374 0.7];

for m_idx=1:length(ms)
    m = ms(m_idx);
    fprintf("Solving m = " + m + "\n")
    [x, y, t, u, v] = main_model_2d(L, dl, dt, 0:50:600, gamma, beta, m, ic_kappa, ic_lu, ic_lv);
    save("regime" + m_idx + ".mat")
end

