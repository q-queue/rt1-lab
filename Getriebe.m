% Regelunstechnik 1 
% (C) 2019 W.Lindermeir, W.Zimmermann
% Hochschule Esslingen
%
%  Labor Regler
%  Getriebe-Schaltstrategie für die Fahrgeschwindigkeitsregelung
%

function y = Getriebe(v)

slCharacterEncoding('UTF-8')
% Aktuelle Gangstufe als globale Variable, damit der Wert bis zum
% nächsten Aufruf gespeichert bleibt
global gang

if isempty(gang)
    gang = 1;
end

% Getriebeuebersetzung
k1 = [40.0 20.0 13.0 10.0 8.0]; 
% Drehzahlgrenzen zum Hoch- und Herunterschalten in 1/min
NUPSHIFT   = 4200.0;
NDOWNSHIFT = 1500.0;

while 1
    % Motordrehzahl vor dem Schaltvorgang in 1/min
    n = k1(gang) * v / (2 * pi) * 60;
    
    % Schaltvorgang
    if n > NUPSHIFT
        gang = min(gang+1, 5);  %Hochschalten
    elseif n < NDOWNSHIFT
        gang = max(gang-1, 1);  %Herunterschalten
    end
    
    % Motordrehzahl nach dem Schaltvorgang in 1/min
    n = k1(gang) * v / (2 * pi) * 60;
    
    % Pruefen, ob nochmals geschaltet werden muss
    if (n > NDOWNSHIFT) && (n < NUPSHIFT)
        break;
    elseif (n < NDOWNSHIFT) && (gang==1)
        break;
    elseif (n > NUPSHIFT) && (gang==5)
        break;
    end
end

% Zusammenfassung der Ausgangssignale in einem Vektor
% (muss in Simulink über Demultiplexer aufgelöst werden)
y(1) = k1(gang);
y(2) = gang;    
y(3) = n;
end



