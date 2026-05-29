% RT1 Lab 2 Analoge und Digitale Regler

%% Reset Workspace

clear all;
close all;

slCharacterEncoding('UTF-8')

global fig_idx;

fig_idx = 1;

%% - -- - -- - -- - Run Batch Sim  -- - -- - -- - -- - --

global TN;

TN = [ 10/1000, 50/1000, 100/1000, 200/1000, 500/1000 ];

KP = [1 2 0.5];

for kp = KP
   sim_kp(kp);
end

%% - 

function [a, Tan, Taus] = sim_kp(kp)

    global TN;
    global fig_idx;

    a    = zeros(size(TN));
    Tan  = zeros(size(TN));
    Taus = zeros(size(TN));

    fig_idx = fig_idx +1;

    for i = 1 : length(TN)

        Tn = TN(i);

        simIn = Simulink.SimulationInput('Regelkreis_PI');
        simIn = simIn.setVariable('kp', kp);
        simIn = simIn.setVariable('Tn', Tn);

        simOut = sim(simIn);

        t = simOut.t;
        x2 = simOut.x2;

        figure(fig_idx)

        hold on

        trace_label = sprintf('Tn = %g', Tn);
        plot(t, x2, 'DisplayName', trace_label);


        [a(i),Tan(i),Taus(i)] = Analyse(x2,t);

    end

    xlabel('t [sec]')
    ylabel('y')
    title(sprintf('Sprungantwort kp = %g', kp));
    grid on
    legend();

    %% - -- - -- - -- - Plot Regelzeit -- - -- - -- - -- - --

    fig_idx = fig_idx +1;
    figure(fig_idx)

    plot(TN, Tan, 'rO--', TN, Taus, 'bX:')
    xlabel('Tn');
    ylabel('Tan (rot) - Taus (blau) [sec]');
    title(sprintf('Regelzeit kp = %g', kp));



    %% - -- - -- - -- - Plot Überschwingweite  - -- - -- - --

    fig_idx = fig_idx +1;
    figure(fig_idx)

    plot(TN, a, 'gO--')
    xlabel('Tn');
    ylabel('Überschwingweite a');

    title(sprintf('Überschwingweite als Funktion vom Tn kp = %g', kp))



    %% - -- - -- - -- - Min. Werte - - -- - -- - -- - -- - --

    [min_Taus, idx] = min(Taus);

    fprintf('\n\n- -- - -- - -- - -- - -- - -- - -- - -- - --\n\n');
    fprintf('kp = %g\n', kp);
    fprintf('Min bei Ausregelzeit von Taus = %g\n', min_Taus);
    fprintf('Tn = %g, a = %g, Tan = %g\n', TN(idx), a(idx), Tan(idx));

end
