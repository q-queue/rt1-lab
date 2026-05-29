% RT1 Lab 2 Analoge und Digitale Regler

% Vorbereitungsaufgabe 10

%% Reset Workspace

clear;
close all;

slCharacterEncoding('UTF-8')

mex PI.c

model = 'C_PI_test';

%% - -- - -- - -- - Run Batch Sim  -- - -- - -- - -- - --

out = sim(model);

fig = figure();

t = out.t;

hold on

plot(t, out.x1, 'DisplayName' ,'n_{soll}', 'LineWidth', 1.5);

plot(t, out.x2, 'o', 'DisplayName', 'y_{zPI}(t)','MarkerSize', 3);

plot(t, out.x3, 'DisplayName', 'y_{CPI}(t)', 'LineWidth', 1.5);

hold off

xlabel('Time (Seconds)');
ylabel('y(t)');
legend();

%% - -- - -- - -- - Export Plot as PNG - - - -- - -- - --

dir_name = '.plots/vb10';

if ~exist(dir_name, 'dir')
  mkdir(dir_name);
end

exportgraphics(fig, ...
  [dir_name, '/C_PI.png'], ...
  "Resolution", 300, "BackgroundColor", "white");
