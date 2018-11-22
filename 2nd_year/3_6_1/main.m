%% Import
A = myImport('C:\local\Mipt\Lab\2nd_year\3_6_1\data.xlsx','A',{'del', 'tau','peaks','fdel','nu','onetau','dnu'});
B = myImport('C:\local\Mipt\Lab\2nd_year\3_6_1\data.xlsx','B',{'del','n','fdel','fpovt','nu','dnu'});
C = myImport('C:\local\Mipt\Lab\2nd_year\3_6_1\data.xlsx','C',{'N', 'a', 'aextra','amax','amin','aextraa','daextraa','m','dm'});
%% Process A
errorbar(A.onetau,A.nu,A.dnu,A.dnu,'LineStyle','none','CapSize', 3);
hold on
make_fancy('1 / \tau [msec^{-1}]','\Delta\nu [kHz]', '');
xlim([0 45]);
print('PlotA','-dpng', '-r300');
hold off

%% Process B
errorbar(B.fpovt, B.nu, B.dnu, B.dnu,'LineStyle','none','CapSize', 3);
hold on
make_fancy('f_{повт}, [kHz]','\delta\nu [kHz]', '');
xlim([0,10]);
ylim([0,10]);
print('PlotB','-dpng', '-r300');
hold off

%% Process C
errorbar(C.m,C.aextraa,C.daextraa,C.daextraa,C.dm,C.dm, 'LineStyle','none','CapSize', 3);
hold on
scatter(C.m,C.aextraa);
make_fancy('m','a_{бок} / a_{осн}', '');
print('PlotC','-dpng', '-r300');
hold off




