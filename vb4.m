% RT1 Lab 2 Analoge und Digitale Regler

%% Reset Workspace

clear all;
close all;

slCharacterEncoding('UTF-8')

%% - -- - -- - -- - Run Batch Sim  -- - -- - -- - -- - --

kp = 1;

TN = [ 10/1000, 50/1000, 100/1000, 200/1000, 500/1000 ];

a    = zeros(size(TN));
Tan  = zeros(size(TN));
Taus = zeros(size(TN));


for i = 1 : length(TN)

    Tn = TN(i);

    sim('Regelkreis_PI');

    figure(2)

    hold on

    trace_label = sprintf('Tn = %g', Tn);
    plot(t, x2, 'DisplayName', trace_label);


    [a(i),Tan(i),Taus(i)] = Analyse(x2,t);

end

xlabel('t [sec]')
ylabel('y')
title('Sprungantwort');
grid on
legend();

exportgraphics(figure(2), ...
  '.plots/vb4/Regelkreis_Tn.png', ...
  "Resolution", 300, "BackgroundColor", "white");

%% - -- - -- - -- - Plot Regelzeit -- - -- - -- - -- - --

figure(3)

plot(TN, Tan, 'rO--', TN, Taus, 'bX:')
xlabel('Tn');
ylabel('Tan (rot) - Taus (blau) [sec]');


exportgraphics(figure(3), ...
  '.plots/vb4/Regelzeit_Tn.png', ...
  "Resolution", 300, "BackgroundColor", "white");

%% - -- - -- - -- - Plot Überschwingweite  - -- - -- - --

figure(4)

plot(TN, a, 'gO--')
xlabel('Tn');
ylabel('Überschwingweite a');

title('Überschwingweite als Funktion vom Tn')


exportgraphics(figure(4), ...
  '.plots/vb4/Überspringweite_Tn.png', ...
  "Resolution", 300, "BackgroundColor", "white");

%% - -- - -- - -- - Min. Werte - - -- - -- - -- - -- - --

[min_Taus, idx] = min(Taus);

fprintf('Min bei Ausregelzeit von Taus = %g\n', min_Taus);
fprintf('Tn = %g, a = %g, Tan = %g\n', TN(idx), a(idx), Tan(idx));

