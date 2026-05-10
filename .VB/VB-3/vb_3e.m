% RT1 Lab

%% Vorbereitungsaufgabe 3 e

v = 1;

T = 1;

T_0 = 0;
T_max = 90;

resolution = 100000;

tolerance = 0.05;

t = linspace(T_0, T_max, resolution);

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

D_range = 0.1 : 0.1 : 2;

AR_values = zeros(size(D_range));
wR_values = zeros(size(D_range));

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

for i = 1:length(D_range)

    D = D_range(i);

    G = tf(v, [T, 2*D, 1]);

    [mag, phase, wout] = bode(G);

    [AR_values(i), wR_values(i)]  = analyseFrequenzgang(squeeze(mag), wout);

end

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

close all

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

fig = figure();

plot(D_range, AR_values, '-o', 'LineWidth', 1.5);

xlabel('D\"ampfungsfaktor $D$', 'Interpreter', 'latex');
ylabel('Resonanz\"uberh\"ohung $A_r$', 'Interpreter', 'latex');

title('Resonanz\"uberh\"ohung $A_r(D)$', 'Interpreter', 'latex');

export_figure(fig, "plots/vb_3e_AR");

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

fig = figure();

plot(D_range, wR_values, '-s', 'LineWidth', 1.5, 'MarkerFaceColor', 'b');

xlabel('D\"ampfungsfaktor $D$', 'Interpreter', 'latex');
ylabel('Resonanzfrequenz $\omega_R$', 'Interpreter', 'latex');

title('Resonanzfrequenz $\omega_R(D)$', 'Interpreter', 'latex');

export_figure(fig, "plots/vb_3e_wR");
