% RT1 Lab 2 Analoge und Digitale Regler

% Laboraufgabe 3

%% Reset Workspace

clc;
clear;
close all;

slCharacterEncoding('UTF-8')

dir_name = '.plots/la3/';

if ~exist(dir_name, 'dir')
  mkdir(dir_name);
end

model = 'PID_GM_LastStoer';

%% - -- - -- - -- - Run Batch Sim  -- - -- - -- - -- - --

sim(model);

fig = gcf();

exportgraphics(fig, ...
  [dir_name, 'Laststörung.png'], ...
  "Resolution", 300, "BackgroundColor", "white");

%% - -- - -- - -- - Lastsprung Rechnung -- - -- - -- - --

logged = @(var) logsout.getElement(var).Values.Data;

t = logsout.getElement('y').Values.Time;

y = logged('y');

w = logged('w');

v = logged('v');
% consider only values after v ~= 0
mask = v == 0;
w(mask) = 0.0;
y(mask) = 0.0;

e = abs((w - y) ./ (w + eps)); % sollte aber schon normiert

[max_e, idx] = max(e);

t_max = t(idx);

fig = figure();

plt = plot(t, e);

hold on

plot(t_max, max_e, 'ro', 'MarkerSize', 10);

xline(t_max, '--r', 'LineWidth', 0.8, 'Alpha', 0.5);
yline(max_e, '--r', 'LineWidth', 0.8, 'Alpha', 0.5);

dt = datatip(plt, 'DataIndex', idx);

dt.Location = 'southwest'; 

hold off

ylabel('Relative Regelabweichung e(t)');
xlabel('Time (Seconds)');

title('Lastsörung auf Regelkreis');

exportgraphics(fig, ...
  [dir_name, 'delta_n.png'], ...
  "Resolution", 300, "BackgroundColor", "white");

%% - -- - -- - -- - Lastsprung Rechnung -- - -- - -- - --

delta_n_norm = max_e;

U_N = 12;
k = 0.03;

n_0 = U_N  / (2 * pi * k);

delta_n = delta_n_norm * n_0;


fprintf('In 1/sec:\n\t')
fprintf('delta_n* = %6.3g, n_0 = %6.3g, delta_n = %6.3g\n', delta_n_norm, n_0, delta_n);

fprintf('In 1/min:\n\t')
fprintf('delta_n* = %6.3g, n_0 = %6g, delta_n = %6.3g\n', delta_n_norm * 60, n_0 * 60, delta_n * 60);


