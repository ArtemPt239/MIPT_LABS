function data = myImport(path, worksheet, varNames)
%% Import the data
[~, ~, raw] = xlsread(path, worksheet);
raw = raw(2:end,:);

%% Create output variable
data1 = reshape([raw{:}],size(raw));

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
clearvars data1 raw;