% RT1 Lab

%% Vorbereitungsaufgabe 3 b


% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

close all

D_range = 0.1 : 0.1 : 2;

a_values = zeros(size(D_range));


for i = 1:length(D_range)

    D = D_range(i);

    a_values(i) = sprungweite(D);

end

fig = figure();

plot(D_range, a_values * 100, 'o-b', 'LineWidth', 1.5);

title('Überschwingweite in Abhängigkeit der Dämpfung');

ylabel('Überschwingweite a [%]');
xlabel('Dämpfung D');

export_figure(fig, "plots/vb_3b");

%% Sprungweite als Function auf D

function a = sprungweite(D)

    v = 1;

    T = 1;

    T_0 = 0;
    T_max = 90;
    resolution = 100000;

    t = linspace(T_0, T_max, resolution);


    G = tf(v, [T, 2*D, 1]);

    [y, t_analyse] = step(G, t);


    tolerance = 0.05;

    [a, ~, ~] = Analyse(y, t_analyse, tolerance);

end

