% RT1 Lab

%% Vorbereitungsaufgabe 3


% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

v = 1;

T = 1;

T_0 = 0;
T_max = 30;
resolution = 100000;

t = linspace(T_0, T_max, resolution);

%% Plot Loop

close all

labels = {};

fig = figure();

for D = [5.0, 2.0, 1.0, 0.7, 0.5, 0.1]

    G = tf(v, [T, 2*D, 1]);

    hold on

    step(G, t);

    labels{end+1} = sprintf('D = %.1f', D);

    hold off

end

legend(labels, 'Location', 'best');

title('Dämpfungswerte - Normierte Sprungantwort');

export_figure(fig, "plots/vb_3a");

