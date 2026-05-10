
function frequency_response(f,t,G)

    u = sin(2*pi*f*t);
    y = lsim(G, u, t);

    f_response = figure();

    plot(t, u, 'r');
    hold on
    plot(t, y, 'b');
    hold off

    plot_title = sprintf("Frequenzantwort (f=%.1fHz)", f);
    title(plot_title);
    legend('Ausgang y(t)', 'Eingang u(t)');
    xlabel('Zeit $(\mu s)$','Interpreter','latex');
    ylabel('Amplitude');
    xlim('tight');
    grid on

    figure_name = sprintf("plots/freq-response-%g", round(f, 2));
    export_figure(f_response, figure_name);
end

