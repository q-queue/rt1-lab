% RT1 Lab 2 Analoge und Digitale Regler

%% Reset Workspace

clear all;
close all;

slCharacterEncoding('UTF-8')

%% - -- - -- - -- - Run Batch Sim  -- - -- - -- - -- - --

kr = 2;
Ti = 100/1000;

TD = [ 0, 5/1000, 10/1000, 20/1000 ];

a    = zeros(size(TD));
Tan  = zeros(size(TD));
Taus = zeros(size(TD));


for i = 1 : length(TD)

    Td = TD(i);

    sim('Regelkreis_PID');

    figure(2)

    hold on

    trace_label = sprintf('Td = %g', Td);
    plot(t, x2, 'DisplayName', trace_label);


    [a(i),Tan(i),Taus(i)] = Analyse(x2,t);

end

xlabel('t [sec]')
ylabel('y')
title('Sprungantwort');
grid on
legend();

exportgraphics(figure(2), ...
  '.plots/vb6/Regelkreis_Tn.png', ...
  "Resolution", 300, "BackgroundColor", "white");

%% - -- - -- - -- - Plot Regelzeit -- - -- - -- - -- - --

figure(3)

plot(TD, Tan, 'rO--', TD, Taus, 'bX:')
xlabel('Tn');
ylabel('Tan (rot) - Taus (blau) [sec]');


exportgraphics(figure(3), ...
  '.plots/vb6/Regelzeit_Tn.png', ...
  "Resolution", 300, "BackgroundColor", "white");

%% - -- - -- - -- - Plot Überschwingweite  - -- - -- - --

figure(4)

plot(TD, a, 'gO--')
xlabel('Tn');
ylabel('Überschwingweite a');

title('Überschwingweite als Funktion vom Tn')


exportgraphics(figure(4), ...
  '.plots/vb6/Überspringweite_Tn.png', ...
  "Resolution", 300, "BackgroundColor", "white");

%% - -- - -- - -- - Min. Werte - - -- - -- - -- - -- - --

[min_Taus, idx] = min(Taus);

fprintf('Min bei Ausregelzeit von Taus = %g\n', min_Taus);
fprintf('Tn = %g, a = %g, Tan = %g\n', TD(idx), a(idx), Tan(idx));

