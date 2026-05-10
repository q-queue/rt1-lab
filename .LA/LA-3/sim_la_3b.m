% RT1 Lab1 Laboraufgaben 3b


close all

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

clear

model_name = 'LA_3';

model = Simulink.SimulationInput(model_name);

model = model.setBlockParameter('LA_3/Kpx', 'k', "4");

out = sim(model);

t = out.t;

fig = figure();

i = out.logsout.get('i').Values.Data / 20;

v = out.logsout.get('v').Values.Data;
v_soll = out.logsout.get('v_soll').Values.Data;

x = out.logsout.get('x').Values.Data;
x_soll = out.logsout.get('x_soll').Values.Data;

hold on

plot(t, i);

plot(t, v);
plot(t, v_soll);

plot(t, x);
plot(t, x_soll);

hold off

legend({'$i(t)$', '$v(t)$', '$v_{soll}$', '$x(t)$', '$x_{soll}$'}, ...
    'Interpreter', 'latex', ...
    'FontSize', 16, ...
    'Location', 'southeast');

xlabel('Time (s)');

title('Doubling Kpx');

export_figure(fig, 'plots/LA-3a_double');


%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

clear

model_name = 'LA_3';

model = Simulink.SimulationInput(model_name);

model = model.setBlockParameter('LA_3/Kpx', 'k', "1");

out = sim(model);

t = out.t;

fig = figure();

i = out.logsout.get('i').Values.Data / 20;

v = out.logsout.get('v').Values.Data;
v_soll = out.logsout.get('v_soll').Values.Data;

x = out.logsout.get('x').Values.Data;
x_soll = out.logsout.get('x_soll').Values.Data;

hold on

plot(t, i);

plot(t, v);
plot(t, v_soll);

plot(t, x);
plot(t, x_soll);

hold off

legend({'$i(t)$', '$v(t)$', '$v_{soll}$', '$x(t)$', '$x_{soll}$'}, ...
    'Interpreter', 'latex', ...
    'FontSize', 16, ...
    'Location', 'best');

xlabel('Time (s)');

title('Halfing Kpx');

export_figure(fig, 'plots/LA-3b_half');

