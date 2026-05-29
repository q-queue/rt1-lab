% RT1 Lab 2 Analoge und Digitale Regler

% Laboraufgabe 1

%% Reset Workspace

clear;
close all;

slCharacterEncoding('UTF-8')

dir_name = '.plots/la1';

if ~exist(dir_name, 'dir')
  mkdir(dir_name);
end

model = 'Regelkreis_begrenzt';

%% - -- - -- - -- - Run Batch Sim  -- - -- - -- - -- - --

y_max = 6;

for w = [ 1, 2, 4, 0.9 * y_max, 1.1 * y_max ]

  SimInput = Simulink.SimulationInput(model);

  SimInput = SimInput.setVariable('w', w, 'Workspace', model);

  SimOutput = sim(SimInput);

  fig = figure();

  t = SimOutput.t;

  hold on

  plot(t, SimOutput.x1, 'DisplayName' ,'w', 'LineWidth', 1.5);

  plot(t, SimOutput.x2, 'DisplayName', 'u', 'LineWidth', 1.5);

  plot(t, SimOutput.x3, '--o', 'DisplayName', 'u_b', 'MarkerSize', 3);

  plot(t, SimOutput.x4, 'DisplayName', 'y', 'LineWidth', 1.5);

  hold off

  xlabel('Time (Seconds)')
  title(sprintf('Begrenzt Regelkreis w = %g', w))
  legend();

  %% - -- - -- - -- - Export Plot as PNG - - - -- - -- - --

  fig_name = sprintf('/Regelkreis_begrenzt_w_%g.png', w);

  exportgraphics(fig, ...
    [dir_name, fig_name], ...
    "Resolution", 300, "BackgroundColor", "white");

end
