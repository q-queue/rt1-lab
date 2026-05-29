% RT1 VB7 - PIDT1-Regler Erweiterung
close all;
clear;

%% - - -- - -- - -- - Parameters Definitionen  - - -- - -- - -- -

kR = 2; 
Ti = 0.1;
Td = 0.005;

T_PIDT1 = 0.001; 

s = tf('s');

%% - - -- - -- - -- - Übertragungsfunktionen - -- - -- - -- -

% Idealer PID-Regler
G_ideal = kR * ((1 + s*Ti)*(1 + s*Td)) / (s * Ti);

% Realer PIDT1-Regler
G_pidt1 = G_ideal / (1 + s*T_PIDT1);

%% - - -- - -- - -- - Auswertung bei 2 kHz - -- - -- - -- -

f_stoer = 2000;                   % Störfrequenz in Hz
omega_stoer = 2 * pi * f_stoer;   % Kreisfrequenz in rad/sec

% Extrahiere Amplituden
mag_ideal = squeeze(bode(G_ideal, omega_stoer));
mag_pidt1 = squeeze(bode(G_pidt1, omega_stoer));

% Umrechnung in dB
db_ideal = 20 * log10(mag_ideal);
db_pidt1 = 20 * log10(mag_pidt1);

%% - - -- - -- - -- - Ausgabe Werte - -- - -- - -- -

fprintf('\n==================================================\n');
fprintf('Ergebnisse bei f = %g Hz:\n', f_stoer);
fprintf('Idealer PID: %.2f (%.2f dB)\n', mag_ideal, db_ideal);
fprintf('Realer PIDT1 (T = %g s): %.2f (%.2f dB)\n', T_PIDT1, mag_pidt1, db_pidt1);
fprintf('==================================================\n\n');

fig = figure();

bode(G_ideal, 'r--', G_pidt1, 'b-')

grid on;

legend('Idealer PID', 'Realer PIDT1', 'Location', 'best');

title('Frequenzgangkompensation: PID vs. PIDT1');

exportgraphics(fig, ...
  '.plots/vb7/bode.png', ...
  "Resolution", 300, "BackgroundColor", "white");

