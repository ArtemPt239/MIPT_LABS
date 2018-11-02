Import_data
%% Sort data
dataR0 = sortrows(dataR0);
dataR100 = sortrows(dataR100);

%% Processing
dataR0.f_norm = dataR0.fHz ./ 1574;
dataR100.f_norm = dataR100.fHz ./ 1577;
dataR0.U_norm = dataR0.UmV ./ 1000;
dataR100.U_norm = dataR100.UmV ./ 100;
dataR0.errU_norm = dataR0.errUmV ./ dataR0.UmV .* dataR0.U_norm;
dataR100.errU_norm = dataR100.errUmV ./ dataR100.UmV .* dataR100.U_norm;

hold on

Emax = 1;
myFunc = @(a,b,c,d,x) a .* x .^ (3/2) ./ sqrt(b + (x - c).^2) + d;
fR0 = fit(dataR0.f_norm, dataR0.U_norm, myFunc, 'StartPoint', [1, 0.002, 1, 0], 'Lower', [0,0,0,-inf]);
fR100 = fit(dataR100.f_norm, dataR100.U_norm, myFunc, 'StartPoint', [1, 0.004, 1, 0], 'Lower', [0,0,0,-inf]);
%fR0 = lorentzfit(dataR0.fHz, dataR0.UmV, [],[],'3c');

errorbar(dataR0.f_norm, dataR0.U_norm, dataR0.errU_norm,'LineStyle', 'none');
errorbar(dataR100.f_norm, dataR100.U_norm, dataR100.errU_norm,'LineStyle', 'none');

p1 = plot(fR0, '--b');
p2 = plot(fR100, '-r');

make_fancy('f / f_0 [Hz]','U / U_0 [mV]', 'Amplitude-frequence characteristic');
legend([p1, p2], 'R = 0 Ohm', 'R = 100 Ohm');
print('Plot', '-dpng', '-r300');
hold off

%% Finding Q

find_Q4(myFunc, fR0, 0.9, 1.1)
find_Q4(myFunc, fR100, 0.9, 1.1)




 
