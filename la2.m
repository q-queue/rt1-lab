% RT1 Lab 2 Analoge und Digitale Regler

% Laboraufgabe 2

%% Reset Workspace

clear;
close all;

slCharacterEncoding('UTF-8')

dir_name = '.plots/la2';

if ~exist(dir_name, 'dir')
  mkdir(dir_name);
end

mex PI_AntiWindUp.c

model = 'Regelkreis_begrenzt_windup';

%% - -- - -- - -- - Run Batch Sim  -- - -- - -- - -- - --

y_max = 6;

for w = [ 1, 4, 0.9 * y_max, 1.1 * y_max ]

  SimInput = Simulink.SimulationInput(model);

  SimInput = SimInput.setVariable('w', w, 'Workspace', model);

  SimInput = SimInput.setModelParameter('StopTime', '2');

  SimOutput = sim(SimInput);

  fig = figure();
  
  logged = @(var) SimOutput.logsout.getElement(var).Values;

  hold on

  plot(logged('w'), 'DisplayName' ,'w', 'LineWidth', 1.5);
  
  plot(logged('w_b'), '--', 'DisplayName' ,'w_b', 'LineWidth', 1.5);

  plot(logged('u'), 'DisplayName', 'u');

  plot(logged('u_b'), '--o', 'DisplayName', 'u_b', 'MarkerSize', 3);

  plot(logged('y'), 'DisplayName', 'y', 'LineWidth', 1.5);

  hold off

  xlim([0, 0.7]);
  xlabel('Time (Seconds)')
  title(sprintf('Begrenzt Regelkreis Mit AntiWindUp w = %g', w))
  legend();

  y_signal = logged('y');
  t = y_signal.Time;
  y = y_signal.Data;
  
  [a, Tan, Taus] = Analyse(y, t);
  
  fprintf('w = %10g,           Taus = %g\n', w, Taus);

  fig_name = sprintf('/Regelkreis_windup_w_%g.png', w);

  exportgraphics(fig, ...
    [dir_name, fig_name], ...
    "Resolution", 300, "BackgroundColor", "white");

end
