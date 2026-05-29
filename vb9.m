% RT1 Lab 2 Analoge und Digitale Regler

% Vorbereitungsaufgabe 9

%% Reset Workspace

clear;
close all;

slCharacterEncoding('UTF-8')

model = 'Diskret_Regelkreis_P';

%% - -- - -- - -- - Run Batch Sim  -- - -- - -- - -- - --

sim('C_PT2_test')

fig = figure();
plot(t, x1, t, x2, 'LineWidth', 1.5);
xlabel('Time (Seconds)');
ylabel('y(t)');
legend('n_{soll}', 'y(t)');

%% - -- - -- - -- - Export Plot as PNG - - - -- - -- - --

dir_name = '.plots/vb9';

if ~exist(dir_name, 'dir')
  mkdir(dir_name);
end

exportgraphics(fig, ...
  [dir_name, '/T_10.png'], ...
  "Resolution", 300, "BackgroundColor", "white");
