function make_fancy(x_name, y_name, my_title)
% Create xlabel
xlabel(x_name);

% Create title
title(my_title);

% Create ylabel
ylabel(y_name);

box on

axes1 = gca;
% Set the remaining axes properties
set(axes1,'XGrid','on','YGrid','on');
