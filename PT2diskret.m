% Regelunstechnik 1 
% (C) 2019 W.Lindermeir, W.Zimmermann
% Hochschule Esslingen
%
%  Labor Regler
%  Berechnung der Koeffizienten für den zeitdiskreten Algoritmus eines
%  PT2-Glieds (C-Programm PT2.c)

slCharacterEncoding('UTF-8')
v = 1; D = 2.0; T0 = 0.1;       % Parameter PT2
Gs = tf([v],[T0^2 2*D*T0 1]);   % s-Übertragungsfunktion PT2
T = 10 / 1000;                  % Abtastzeit
Gz =c2d(Gs, T);                 % Umwandlung s-ÜF ? z-ÜF
[b, a] = tfdata(Gz, 'v ');      % Berechnung Koeffizienten a, b  
b = b/a(1); a = a/a(1);         % Normierung so, dass a0 = 1 wird

fprintf(1,'-----------------------------------------------------\n');
fprintf(1,'Zeitkontinuierliches PT2-Glied:');
Gs
fprintf(1,'Zeitdiskretes PT2-Glied:');
Gz

fprintf(1,'Zeitdiskreter Algorithmus: u(k) =  b0*e(k) + b1*e(k_1) + b2*e(k_2) + ... + a1*u(k_1) + a2*u(k_2) + ..\n');
fprintf(1,'Koeffizienten [b0 b1 b2 ...] : ');
disp(b)
fprintf(1,'\n');
fprintf(1,'Koeffizienten [a0 a1 a2 ...] : ');
disp(a)
fprintf(1,'\n');

fprintf(1,'Achtung: Koeffizienten nach PT2.c übertragen und neu compilieren.\n')
fprintf(1,'         Änderung der Abtastzeit in Simulink (S-Function Parameter) nicht vergessen!\n\n');

step(Gs,'r')
hold on
step(Gz,'b')
hold off
title('Sprungantwort PT2 zeitkontinuierlich (rot) - zeitdiskret (blau)!')


%% - -- - -- - -- - Export Plot as PNG - - - -- - -- - --

dir_name = '.plots/vb9';

if ~exist(dir_name, 'dir')
  mkdir(dir_name);
end

fig = gcf();

exportgraphics(fig, ...
  [dir_name, '/Sprungantwort_PT2_10ms.png'], ...
  "Resolution", 300, "BackgroundColor", "white");


