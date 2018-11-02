function out = myImport(str)
%% Import the data
[~, ~, raw] = xlsread('C:\local\Mipt\Lab\2nd_year\3_5_1\data.xlsx','VAC of zond '+str+' mA');
raw = raw(2:end,:);
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};

%% Exclude rows with non-numeric cells
I = ~all(cellfun(@(x) (isnumeric(x) || islogical(x)) && ~isnan(x),raw),2); % Find rows with non-numeric cells
raw(I,:) = [];

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Create table
out = table;

%% Allocate imported array to column variable names
out.U_2 = data(:,1);
out.I_2 = data(:,2);
out.dU_2 = data(:,3);
out.dI_2 = data(:,4);

%% Clear temporary variables
clearvars data raw I;