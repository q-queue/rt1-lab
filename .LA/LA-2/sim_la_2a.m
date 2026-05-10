% RT1 Lab1 Laboraufgaben

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

close all

clear

model_name = 'LA_2';

model = Simulink.SimulationInput(model_name);

model = model.setBlockParameter('LA_2/Kpv', 'k', "25");

out = sim(model);

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

t = out.t;

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

close all

fig = figure();

i = out.logsout.get('i').Values.Data / 20;

v = out.logsout.get('v').Values.Data;

v_soll = out.logsout.get('v_soll').Values.Data;

hold on

plot(t, i);

plot(t, v);

plot(t, v_soll);

hold off

legend({'$i(t)$', '$v(t)$', '$v_{soll}$'}, ...
    'Interpreter', 'latex', ...
    'FontSize', 16, ...
    'Location', 'best');

xlabel('Time (s)');

export_figure(fig, 'plots/LA-2a');

