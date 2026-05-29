% RT1 Lab 2 Analoge und Digitale Regler

% Vorbereitungsaufgabe 8

%% Reset Workspace

clear;
close all;

slCharacterEncoding('UTF-8')

model = 'Diskret_Regelkreis_P';

%% - -- - -- - -- - Run Batch Sim  -- - -- - -- - -- - --

fig = figure(1);

for T = [ 1/1000, 10/1000, 20/1000, 40/1000 ]

  SimInput = Simulink.SimulationInput(model);

  SimInput = SimInput.setVariable('T', T, 'Workspace', model);

  SimOutput = sim(SimInput);

  figure(fig);

  trace_label = sprintf('T = %g', T);

  hold on
  plot(SimOutput.logsout.getElement('y').Values, '-.', 'DisplayName', trace_label);
  hold off
end

figure(fig);

xlabel('Time (Seconds)')
ylabel('y(t)')
legend();

%% - -- - -- - -- - Export Plot as PNG - - - -- - -- - --

if ~exist('.plots/vb8', 'dir')
    mkdir('.plots/vb8');
end

exportgraphics(fig, ...
  '.plots/vb8/Abtastzeit.png', ...
  "Resolution", 300, "BackgroundColor", "white");
