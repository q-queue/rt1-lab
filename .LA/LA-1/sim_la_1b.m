% RT1 Lab1 Laboraufgaben

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

close all

clear

out = sim('LA_1b');

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

t = out.t;

F_A = out.x1;

v = out.x2;

x = out.x3;

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

close all

fig = figure();

hold on

plot(t, F_A);
plot(t, v);
plot(t, x);

hold off

legend({'$F_A(t)$', '$v(t)$', '$x(t)$'}, ...
    'Interpreter', 'latex', ...
    'FontSize', 16, ...
    'Location', 'best');

xlabel('Time (s)');

export_figure(fig, 'plots/LA-1b');

