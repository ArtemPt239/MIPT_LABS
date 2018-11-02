
%% Import the data
[~, ~, raw] = xlsread('C:\local\Mipt\Lab\2nd_year\3_4_2\data.xlsx','Sheet1');
raw = raw(2:end,:);

%% Create output variable
data1 = reshape([raw{:}],size(raw));

%% Create table
data = table;

%% Allocate imported array to column variable names
data.Tcelsium = data1(:,1);
data.dTcelsium = data1(:,2);
data.tmksec = data1(:,3);
data.dtmksec = data1(:,4);
data.deltaUmV = data1(:,5);
data.ddeltaUmV = data1(:,6);
data.f = data1(:,7);
data.df = data1(:,8);
data.T = data1(:,9);
data.dT = data1(:,10);

%% Clear temporary variables
clearvars data1 raw;

fig = figure;
hold on
errorbar(data.T,data.f,data.df,data.df,data.dT,data.dT, 'LineStyle','none','CapSize',1);
fitT = data.T(5:end);
fitf = data.f(5:end);
[mfit, mgof] = fit(fitT, fitf,'Poly1');
plot(mfit);
ylim([0,1]);
make_fancy("T_{real} [celsium]","1/(t^2-t_0^2) [1/\mus^2]"," ");   
legend('Location','northwest');
print('Plot1','-dpng', '-r300');
mcoef = coeffvalues(mfit)
muncert = confint(mfit,0.682)
formula(mfit)
hold off