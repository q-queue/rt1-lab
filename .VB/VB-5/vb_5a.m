% RT1 Lab1 VB5

close all

clear

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

sim('fahrg4_a');

fig = figure();

plot(t, n);

title('Motordrehlzahl mit der Zeit');
ylabel('Motordrehzajl (RPM)')
xlabel('Time (Seconds)');

export_figure(fig, 'plots/vb_5a')

