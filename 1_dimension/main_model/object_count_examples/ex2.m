syms x

g(x) = piecewise(x<-5, 0.1, 0);

fig=figure();

fplot(g, [-10 0], 'r')
ylim([0 1])

xlabel("x")
ylabel("g(x)")
title("Plot of g(x)")