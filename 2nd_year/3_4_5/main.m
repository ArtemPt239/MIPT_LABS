cd 'C:\local\Mipt\Lab\2nd_year\3_4_5'
%%
F = myImport('C:\local\Mipt\Lab\2nd_year\3_4_5\data.xlsx','Ferrit',{'y', 'x','dy', 'dx'});
P = myImport('C:\local\Mipt\Lab\2nd_year\3_4_5\data.xlsx','Permalloy',{'y', 'x','dy', 'dx'});
K = myImport('C:\local\Mipt\Lab\2nd_year\3_4_5\data.xlsx','Kremnistoe_zheleso',{'y', 'x','dy', 'dx'});


%% myProcess(F, name,      NO, N,     S,   l,           Kx, Ky, b    , Kx2  Ky2, x ,y)
myProcess(F,"Ferrit",     42, 400, 0.0003, 0.25,      0.05, 0.02, 0, 0.01,0.02,30.5,36);
myProcess(P, "Permalloy", 20, 300, 0.000076, 0.133,  0.02, 0.05,  1, 0.01,0.05,36.5,17);
myProcess(K, "Krem_Ferr", 25, 250, 0.0002, 0.11      ,0.1, 0.05,  0, 0.02,0.05,32  ,22);
