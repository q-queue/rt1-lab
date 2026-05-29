% Regelunstechnik 1 
% (C) 2019 W.Lindermeir, W.Zimmermann
% Hochschule Esslingen
%
%  Labor Regler
%  Simulation eines Simulink-Blockschaltbilds mit variablen Parametern

clear all;                              %Variablen und Bilder löschen
close all;
slCharacterEncoding('UTF-8')

i=1;                                    %Zaehlindex
for kp= [1 2 4 ]                        %Variation des Parameters kp
                                        %kp wird in einem Simulink-Block als
                                        %Parameter verwendet

    sim('Regelkreis');                  %Aufruf der Simulink-Simulation
                                        %Durch das Oszilloskop wird figure(1) belegt
    figure(2)                           %Umschalten auf ein neues Bild
    plot(t, x1, t, x2);                 %Zeichnen der Simulationsergebnisse
    
    hold on                             %Löschen des Diagramms verhindern

    [a(i),Tan(i),Taus(i)] = Analyse(x2,t);   %Ueberschwingweite, An- und 
                                        %Ausregelzeit in Arrays speichern
    KP(i)   = kp;                       %Speichern von KP in einem Array        

    i=i+1;                              %Zaehlindex fuer das Array
end
xlabel('t [sec]')                   %Beschriften des Diagramms
ylabel('y')
title('Sprungantwort');
grid on

figure(3)
plot(KP, Tan, 'rO--', KP, Taus, 'bX:')  %Zeichen von Tan(kp) bzw. Taus(kp) ...
xlabel('kp');                           % ... und beschriften
ylabel('Tan (rot) - Taus (blau) [sec]');
