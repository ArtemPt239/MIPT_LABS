%% Import the data
[~, ~, raw] = xlsread('C:\local\Mipt\Lab\2nd_year\3_5_1\data.xlsx','Sheet1');
raw = raw(2:end,:);
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};

%% Exclude rows with non-numeric cells
I = ~all(cellfun(@(x) (isnumeric(x) || islogical(x)) && ~isnan(x),raw),2); % Find rows with non-numeric cells
raw(I,:) = [];

%% Create output variable
data1 = reshape([raw{:}],size(raw));

%% Create table
vac0 = table;

%% Allocate imported array to column variable names
vac0.V_1 = data1(:,1);
vac0.del = data1(:,2);
vac0.I_p = data1(:,3);

%% Clear temporary variables
clearvars data1 raw I

%% Import the data
[~, ~, raw] = xlsread('C:\local\Mipt\Lab\2nd_year\3_5_1\data.xlsx','VAC of zond 5 mA');
raw = raw(2:end,:);
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};

%% Exclude rows with non-numeric cells
I = ~all(cellfun(@(x) (isnumeric(x) || islogical(x)) && ~isnan(x),raw),2); % Find rows with non-numeric cells
raw(I,:) = [];

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Create table
vac5 = table;

%% Allocate imported array to column variable names
vac5.U_2 = data(:,1);
vac5.I_2 = data(:,2);
vac5.dU_2 = data(:,3);
vac5.dI_2 = data(:,4);

%% Clear temporary variables
clearvars data raw I;

%% Import the data
[~, ~, raw] = xlsread('C:\local\Mipt\Lab\2nd_year\3_5_1\data.xlsx','VAC of zond 3 mA');
raw = raw(2:end,:);
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};

%% Exclude rows with non-numeric cells
I = ~all(cellfun(@(x) (isnumeric(x) || islogical(x)) && ~isnan(x),raw),2); % Find rows with non-numeric cells
raw(I,:) = [];

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Create table
vac3 = table;

%% Allocate imported array to column variable names
vac3.U_2 = data(:,1);
vac3.I_2 = data(:,2);
vac3.dU_2 = data(:,3);
vac3.dI_2 = data(:,4);

%% Clear temporary variables
clearvars data raw I;

%%
scatter(vac0.V_1, vac0.I_p);
hold on
xlabel("V_1 [V]");
ylabel("I_p [mA]");
hold off
%%
myProcess(vac5,"5")
%%
myProcess(vac3,"3")