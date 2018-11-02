function Q = find_Q4 (func, fit, x0_left, x0_right)

c = coeffvalues(fit);
myFunc = @(x)func(c(1),c(2),c(3),c(4),x) - sqrt(1/2);
x_l = fzero(myFunc, x0_left);
x_r = fzero(myFunc, x0_right);
Q = 1 / (x_r - x_l);