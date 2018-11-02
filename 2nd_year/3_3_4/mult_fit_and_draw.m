function [out, uncert] = mult_fit_and_draw(x,y)
f = fit(x,y,'poly1');
plot(f);
tcoeffs = coeffvalues(f);
out = tcoeffs(1);
tuncert = confint(f,0.67);
uncert(1) = tuncert(1,1);
uncert(2) = tuncert(2,1);
