% RT1 Lab

%% Vorbereitungsaufgabe 3 c

v = 1;

T = 1;

T_0 = 0;
T_max = 90;

resolution = 100000;

tolerance = 0.05;

t = linspace(T_0, T_max, resolution);

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

close all

D_range = 0.1 : 0.1 : 2;

a_values = zeros(size(D_range));
T_an_values = zeros(size(D_range));
T_aus_values = zeros(size(D_range));

for i = 1:length(D_range)

    D = D_range(i);

    G = tf(v, [T, 2*D, 1]);

    [y, t_analyse] = step(G, t);

    [a, T_an, T_aus] = Analyse(y, t_analyse, tolerance);

    a_values(i) = a;
    T_an_values(i) = T_an;
    T_aus_values(i) = T_aus;

end

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

% %% Überschwingweite Plot

figure

plot(D_range, a_values * 100, 'o-', 'LineWidth', 1.5);

title('Überschwingweite in Abhängigkeit der Dämpfung');

ylabel('Überschwingweite a [%]');
xlabel('Dämpfung D');

grid on

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

% %% Regelzeit Plot

fig = figure();

hold on

plot(D_range, T_an_values, '-o', 'LineWidth', 1.5, 'DisplayName', 'T_{an}');
plot(D_range, T_aus_values, '-s', 'LineWidth', 1.5, 'DisplayName', 'T_{aus}');

hold off

xlabel('Dämpfungsfaktor D');
ylabel('Zeit [s]');

title('Anregelzeit T_{an} Ausregelzeit T_{aus}');

legend('show');

grid on

export_figure(fig, "plots/vb_3c");

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

% %% Min-Wert für T_aus

[taus_min, idx] = min(T_aus_values);

fprintf('Taus ist minimal bei D = %.2f mit Wert %.2f sec\n', D_range(idx), taus_min);

fprintf('Die zugehörige Anregelzeit beträgt T_an = %.2f \n', T_an_values(idx));

fprintf('Die zugehörige Überschwingweite beträgt a = %.2f %%\n', a_values(idx)*100);
