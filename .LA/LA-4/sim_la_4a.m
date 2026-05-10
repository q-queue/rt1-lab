% RT1 Lab1 Laboraufgaben 3


for m_p = [0 100 300]
    bleibende_regel_abweichung(m_p);
end


%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --
function delta_x = bleibende_regel_abweichung(m_p)

    model_name = 'LA_4';

    model = Simulink.SimulationInput(model_name);

    blkPath = [model_name '/m_p'];
    model = model.setBlockParameter(blkPath, 'Value', string(m_p));

    out = sim(model);

    t = out.t;

    %% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

    i = out.logsout.get('i').Values.Data / 20;

    v = out.logsout.get('v').Values.Data;
    v_soll = out.logsout.get('v_soll').Values.Data;

    x = out.logsout.get('x').Values.Data;
    x_soll = out.logsout.get('x_soll').Values.Data;

    
    %% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

    last_n = 5;
    
    delta_x = x(end-last_n:end) - x_soll(end-last_n:end);
    
    delta_x = abs(delta_x);
    
    delta_x = mean(delta_x);
    
    fprintf('Blebenderegelabweichung: %5.3f, bei m_p = %d\n', delta_x, m_p);
    
    %% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --
    
    fig = figure();
    
    hold on

    plot(t, i);

    plot(t, v);
    plot(t, v_soll);

    plot(t, x);
    plot(t, x_soll);

    hold off
    
    title(sprintf('Simulation for m_p = %g', m_p));

    legend({'$i(t)$', '$v(t)$', '$v_{soll}$', '$x(t)$', '$x_{soll}$'}, ...
        'Interpreter', 'latex', ...
        'FontSize', 16, ...
        'Location', 'southeast');

    txt = sprintf('$\\Delta x = %.3f$', delta_x);

    n = 15;
    idx = max(1, numel(x_soll) - n + 1);    % index of the "last_n" sample to annotate

    text(t(idx), x_soll(idx), txt, ...
        'Interpreter', 'latex', 'FontSize', 12, ...
        'HorizontalAlignment','left','VerticalAlignment','bottom');

    export_figure(fig, sprintf('plots/LA-4a_%g', m_p));

end
