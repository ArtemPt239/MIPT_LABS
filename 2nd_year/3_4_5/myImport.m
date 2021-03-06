function data = myImport(path, worksheet, varNames)
%% Import the data
[num, ~, ~] = xlsread(path, worksheet);
%num = num(2:end,:);

%% Create output variable
%data1 = reshape([num{:}],size(num));
data1 = num;
%% Create table
data = table();
%% Allocate imported array to column variable names
for i = 1:length(varNames)
    name = cellstr("var" + i);
    temp = table (data1(:,i),'VariableNames',name);
    data = [ data temp ];
end
data.Properties.VariableNames = varNames;

%% Clear temporary variables
%clearvars data1 raw;