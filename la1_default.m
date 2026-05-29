% RT1 Lab 2 Analoge und Digitale Regler

% Laboraufgabe 1

%% Reset Workspace

clear;
close all;

slCharacterEncoding('UTF-8')

model = 'Regelkreis_begrenzt';

%% - -- - -- - -- - Run default Sim - - -- - -- - -- - --

out = sim(model);

fig = figure();

t = out.t;

hold on

plot(t, out.x1, 'DisplayName' ,'w', 'LineWidth', 1.5);

plot(t, out.x2, 'DisplayName', 'u', 'LineWidth', 1.5);

plot(t, out.x3, '--o', 'DisplayName', 'u_b', 'MarkerSize', 3);

plot(t, out.x4, 'DisplayName', 'y', 'LineWidth', 1.5);

hold off

xlabel('Time (Seconds)');

legend();

%% - -- - -- - -- - Export Plot as PNG - - - -- - -- - --

dir_name = '.plots/la1';

if ~exist(dir_name, 'dir')
  mkdir(dir_name);
end

exportgraphics(fig, ...
  [dir_name, '/Regelkreis_begrenzt.png'], ...
  "Resolution", 300, "BackgroundColor", "white");

