% RT1 Lab1 VB4

close all

clear

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

% Unbegrenzt

% define in workspace so the simulink can use these values
alpha_limit_max = inf;
alpha_limit_min = -inf;

sim('fahrg3');

fig = gcf();

title('Fahrzeug Ohne Begrenzung');

export_figure(fig, 'plots/vb4_unbegrenzt')


%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

% Mit Begrenzung

alpha_limit_max = 30;
alpha_limit_min = 0;

sim('fahrg3');

fig = gcf();

title('Fahrzeug Mit Begrenzung');

export_figure(fig, 'plots/vb4_begrenzt')

