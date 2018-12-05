function myProcess(F, name, NO, N, S, l, Kx, Ky, b, Kx2, Ky2, x, y)

name
H = Kx / 5 * NO/ (0.22 * l);
B = Ky / 5 * 20000 * 0.00002 /(S * N);

%Hc = x/2 * H / Kx * Kx2
%Bs = y/2 * B / Ky * Ky2

%dHc = Hc * sqrt((0.5/x)^2+0.04^2+ 0.01^2)
%dBs = Bs * sqrt((0.5/y)^2+4*0.01^2)

F.x = F.x./2.*H;
F.y = F.y./2.*B;
F.dy = F.dy./2.*B;
F.dx = F.dx./2.*H;

if( b == 0)
    mFitType = fittype('a * x','independent','x');
    f = fit(F.x(1:3),F.y(1:3), mFitType, 'StartPoint',[1]);
else
    mFitType = fittype('a * x + c','independent','x');
    f = fit(F.x(1:4),F.y(1:4), mFitType, 'StartPoint',[1,1]);
end

errorbar(F.x,F.y,F.dy,F.dy,F.dx,F.dx, 'LineStyle', 'none', 'CapSize', 3);
hold on
xlim([0,(25*H)]);
%yticks(0:(5*B):(4*B));
ylim([0,20*B]);
plot(f);
make_fancy("H [A/m]","B [T]","");
print('Plot' + name,'-dpng', '-r300');
hold off

vpa(coeffvalues(f))
vpa(confint(f,0.67))

