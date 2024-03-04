syms x

f(x) = piecewise(x<3, 1, 3<= x <= 5, 0, 5 < x < 10, 1, x >= 10, 0);

fig=figure();

fplot(f, [0 13], 'r')
ylim([0 2])

xlabel("x")
ylabel("f(x)")
title("Plot of f(x)")