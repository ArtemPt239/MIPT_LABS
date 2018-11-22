A = myImport('C:\local\Mipt\Lab\2nd_year\3_2_6\data.xlsx','A',{'x', 'R','dx', 'I','dI'});
B = myImport('C:\local\Mipt\Lab\2nd_year\3_2_6\data.xlsx','B_Pure',{'x_1', 'x_2','dx', 'R','dR', 'nothing', 'dec','ddec'});
C = myImport('C:\local\Mipt\Lab\2nd_year\3_2_6\data.xlsx','C',{'l_max', 'R','dl', 'dR','oneR', 'doneR'});

%% A
mFittype = fittype({'x','1'});
f = fit(A.x,A.I,mFittype);

%%
errorbar(A.x,A.I,A.dI,A.dI,A.dx,A.dx, 'LineStyle', 'none', 'CapSize', 3);
hold on
%xlim([0,22]);
%ylim([0,50]);
plot(f);
make_fancy("x [cm]","I [nA]","");
print('PlotA','-dpng', '-r300');
hold off
%%
coeffvalues(f)
confint(f,0.67)
%% B
Y = 1./(B.dec.^2);
X = (B.R + 0.475).^2;
dY = Y.*(2*B.ddec./B.dec);
dX = X.*(2*B.dR./B.R);

mFittype = fittype({'x','1'});
fB = fit(X(1:8),Y(1:8),mFittype);
%%
errorbar(X,Y,dY,dY,dX,dX,'LineStyle', 'none', 'CapSize', 3);
hold on
plot(fB);
make_fancy("(R+R_0)^2 [kOhm^2]","1/\theta^2","");
print('PlotB', '-dpng','-r300');
hold off
%%
coeffvalues(fB)
confint(fB,0.67)
%% C
l_max = (19)/exp(-0.307/4);
lev = l_max/exp(1)
dlev = lev*0.3/19
xline = [0, 0.35];
yline = [lev, lev];

mFittype = fittype('a*exp(-b*(x))+c+d/(x+0.01)','independent','x');
fC = fit(C.oneR,C.l_max,mFittype,'StartPoint',[20,1,0,1]);


errorbar(C.oneR,C.l_max,C.dl,C.dl,C.doneR,C.doneR,'LineStyle', 'none', 'CapSize', 2);
hold on
plot(fC);
make_fancy("(R+R_0)^{-1} [kOhm^{-1}]","l_{max} [cm]","");

yline = yline - dlev;
plot(xline,yline);
yline = yline + 2*dlev;
plot(xline,yline);
xlim([0,0.3]);
ylim([0,20]);
s=findobj('tag','legend');
delete(s);
print('PlotC', '-dpng','-r300');
hold off

coeffvalues(fC);
confint(fC,0.67);
