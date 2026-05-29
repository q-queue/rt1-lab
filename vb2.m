% RT1 Lab 2 Analoge und Digitale Regler

%% Run Batch Sim

clear all;
close all;

slCharacterEncoding('UTF-8')

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

KP = [ 0.1, 0.2, 0.5, 1, 2, 5, 10 ];

a    = zeros(size(KP));
Tan  = zeros(size(KP));
Taus = zeros(size(KP));


for i = 1 : length(KP)

    kp = KP(i);

    sim('Regelkreis_P');

    figure(2)

    plot(t, x1, 'k--', 'HandleVisibility', 'off');

    hold on

    trace_label = sprintf('kp = %g', kp);
    plot(t, x2, 'DisplayName', trace_label);


    [a(i),Tan(i),Taus(i)] = Analyse(x2,t);

end

xlabel('t [sec]')
ylabel('y')
title('Sprungantwort');
grid on
legend();

exportgraphics(figure(2), ...
  '.plots/vb2/Regelkreis_kp.png', ...
  "Resolution", 300, "BackgroundColor", "white");

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

figure(3)

plot(KP, Tan, 'rO--', KP, Taus, 'bX:')  %Zeichen von Tan(kp) bzw. Taus(kp) ...
xlabel('kp');                           % ... und beschriften
ylabel('Tan (rot) - Taus (blau) [sec]');


exportgraphics(figure(3), ...
  '.plots/vb2/Regelzeit_kp.png', ...
  "Resolution", 300, "BackgroundColor", "white");

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

figure(4)

plot(KP, a, 'gO--')
xlabel('kp');
ylabel('Überschwingweite a');

title('Überschwingweite als Funktion vom Kp')


exportgraphics(figure(4), ...
  '.plots/vb2/Überspringweite_kp.png', ...
  "Resolution", 300, "BackgroundColor", "white");

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

[min_Taus, idx] = min(Taus);

fprintf('Minumn bei Ausregelzeit von Taus = %g\n', min_Taus);
fprintf('Kp = %g, a = %g, Tan = %g\n', KP(idx), a(idx), Tan(idx));


