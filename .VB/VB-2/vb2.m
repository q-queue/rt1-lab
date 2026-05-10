% RT1 Lab

%% Vorbereitungsaufgabe 2


close all

% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

Ts = 0.1;

G = filt([0 0.1], [1 -0.8] , Ts);

% - -- - -- - -- - -- - --

f_step = figure();

step(G);                       % Berechnet und zeichnet die Sprungantwort

grid on

title('Zeit-Diskret - Sprungantwort');

export_figure(f_step, "plots/step-response");

% - -- - -- - -- - -- - --

f_impulse = figure();

impulse(G);                    % Berechnet und zeichnet die Impulsantwort

grid on

title('Zeit-Diskret - Impulsantwort');

export_figure(f_impulse, "plots/impulse-response");


% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

f_bode = figure();

bode(G);

grid minor

export_figure(f_bode, "plots/bode-diagram");
