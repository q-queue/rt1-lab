% RT1 Lab 2 Analoge und Digitale Regler

% Laboraufgabe 1 Ausregelzeit

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

W = [ 1, 2, 4, 0.9 * y_max ];

a    = zeros(size(W));
Tan  = zeros(size(W));
Taus = zeros(size(W));

for i = 1 : length(W)

  w = W(i);

  SimInput = Simulink.SimulationInput(model);
  
  SimInput = SimInput.setModelParameter('StopTime', '10');

  SimInput = SimInput.setVariable('w', w, 'Workspace', model);

  SimOutput = sim(SimInput);

  t = SimOutput.t;
  y = SimOutput.x4;

  [a(i), Tan(i), Taus(i)] = Analyse(y, t);

end

%% - -- - -- - -- - Print Results  -- - -- - -- - -- - --


ResultTable = table(W', a', Tan', Taus', ...
    'VariableNames', {'w', 'A_max', 'T_an', 'T_aus'});

disp(ResultTable);


AusregelzeitTabel = table(W', Taus', ...
    'VariableNames', {'w', 'T_aus'});

AusregelzeitTabel{:, :} = round(AusregelzeitTabel{:, :}, 3);

disp(AusregelzeitTabel);
