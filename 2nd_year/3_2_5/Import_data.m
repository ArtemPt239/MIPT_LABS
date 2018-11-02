
%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: C:\local\Mipt\Lab\2nd_year\3_2_5\data.xlsx
%    Worksheet: R=100_Ohm
%
% To extend the code for use with different selected data or a different
% spreadsheet, generate a function instead of a script.

% Auto-generated by MATLAB on 2018/10/02 13:31:02

%% Import the data
[~, ~, raw] = xlsread('C:\local\Mipt\Lab\2nd_year\3_2_5\data.xlsx','R=100_Ohm');
raw = raw(2:end,:);
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};

%% Exclude rows with non-numeric cells
I = ~all(cellfun(@(x) (isnumeric(x) || islogical(x)) && ~isnan(x),raw),2); % Find rows with non-numeric cells
raw(I,:) = [];

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Create table
dataR100 = table;

%% Allocate imported array to column variable names
dataR100.fHz = data(:,1);
dataR100.UmV = data(:,2);
dataR100.errUmV = data(:,3);

%% Clear temporary variables
clearvars data raw I;
%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: C:\local\Mipt\Lab\2nd_year\3_2_5\data.xlsx
%    Worksheet: R=0_Ohm
%
% To extend the code for use with different selected data or a different
% spreadsheet, generate a function instead of a script.

% Auto-generated by MATLAB on 2018/10/02 13:33:00

%% Import the data
[~, ~, raw] = xlsread('C:\local\Mipt\Lab\2nd_year\3_2_5\data.xlsx','R=0_Ohm');
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};

%% Exclude rows with non-numeric cells
I = ~all(cellfun(@(x) (isnumeric(x) || islogical(x)) && ~isnan(x),raw),2); % Find rows with non-numeric cells
raw(I,:) = [];

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Create table
dataR0 = table;

%% Allocate imported array to column variable names
dataR0.fHz = data(:,1);
dataR0.UmV = data(:,2);
dataR0.errUmV = data(:,3);

%% Clear temporary variables
clearvars data raw I;

%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: C:\local\Mipt\Lab\2nd_year\3_2_5\data.xlsx
%    Worksheet: Ampl_R=0
%
% To extend the code for use with different selected data or a different
% spreadsheet, generate a function instead of a script.

% Auto-generated by MATLAB on 2018/10/02 13:37:06

%% Import the data
[~, ~, raw] = xlsread('C:\local\Mipt\Lab\2nd_year\3_2_5\data.xlsx','Ampl_R=0');
raw = raw(2:end,:);
stringVectors = string(raw(:,4));
stringVectors(ismissing(stringVectors)) = '';
raw = raw(:,[1,2,3,5]);

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Create table
dataA0 = table;

%% Allocate imported array to column variable names
dataA0.num = data(:,1);
dataA0.Upoints = data(:,2);
dataA0.err_Upoints = data(:,3);
dataA0.State = categorical(stringVectors(:,1));
dataA0.U_0points5p1v = data(:,4);

%% Clear temporary variables
clearvars data raw stringVectors;

%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: C:\local\Mipt\Lab\2nd_year\3_2_5\data.xlsx
%    Worksheet: Ampl_R=100
%
% To extend the code for use with different selected data or a different
% spreadsheet, generate a function instead of a script.

% Auto-generated by MATLAB on 2018/10/02 13:37:47

%% Import the data
[~, ~, raw] = xlsread('C:\local\Mipt\Lab\2nd_year\3_2_5\data.xlsx','Ampl_R=100');
raw = raw(2:end,:);
stringVectors = string(raw(:,4));
stringVectors(ismissing(stringVectors)) = '';
raw = raw(:,[1,2,3,5]);

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Create table
dataA100 = table;

%% Allocate imported array to column variable names
dataA100.num = data(:,1);
dataA100.Upoints = data(:,2);
dataA100.err_Upoints = data(:,3);
dataA100.State = categorical(stringVectors(:,1));
dataA100.U_0points5p02v = data(:,4);

%% Clear temporary variables
clearvars data raw stringVectors;