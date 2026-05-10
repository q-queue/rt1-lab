% RT1 Lab

%% Vorbereitungsaufgabe 1


% - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

% Parameter (SI-Einheiten)
R = 0.8;
L = 1E-6;
C = 1E-6;

% - -- - -- - -- - -- - --

a = 2;

T_0 = 0;
T_max = 25E-6;
plot_points = 1000;

f = 250E3;

% - -- - -- - -- - -- - --

t = linspace(T_0, T_max, plot_points);

G = tf([1], [L*C  R*C  1]);    % Übertragungsfunktion

u = a * square(2*pi*f * t);

y = lsim(G, u, t);

% - -- - -- - -- - -- - --

f_step = figure();

step(G);                       % Berechnet und zeichnet die Sprungantwort

grid on

title('RLC Schwingkreis - Sprungantwort');

export_figure(f_step, "plots/step-response");

% - -- - -- - -- - -- - --

f_impulse = figure();

impulse(G);                    % Berechnet und zeichnet die Impulsantwort

grid on

title('RLC Schwingkreis - Impulsantwort');

export_figure(f_impulse, "plots/impulse-response");


% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

f_square = figure();

p_u = plot(t, u, 'r');

hold on

p_y = plot(t, y, 'b');

hold off

title('RLC Schwingkreis - Rechtecksignal(a=2, f=250kHz)');

legend('Ausgang y(t)', 'Eingang u(t)');

xlabel('Zeit $(\mu s)$','Interpreter','latex');

ylabel('Amplitude');

xlim('tight');

grid on

export_figure(f_square, "plots/square-response");

% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

f_bode = figure();

bode(G);

grid minor

export_figure(f_bode, "plots/bode-diagram");
