% RT1 Lab

%% Vorbereitungsaufgabe 3 d

v = 1;

T = 1;

T_0 = 0;
T_max = 90;

resolution = 100000;

tolerance = 0.05;

t = linspace(T_0, T_max, resolution);

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

D_range = [5.0, 2.0, 1.0, 0.7, 0.5, 0.1];


%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

close all

fig = figure();

labels = {};

hold on

for i = 1:length(D_range)

    D = D_range(i);

    G = tf(v, [T, 2*D, 1]);

    bode(G);

    labels{end+1} = sprintf('D = %.1f', D);

end

hold off

legend(labels, 'Location', 'best');

title('Frequenzgang Dämpfungswerte D');

export_figure(fig, "plots/vb_3d");
