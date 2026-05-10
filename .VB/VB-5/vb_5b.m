% RT1 Lab1 VB5 b

close all

clear

global gang

gang = 2;

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

sim('fahrg4_b');

fig = figure();

plot(t, n);

title('Motordrehlzahl mit der Zeit');
ylabel('Motordrehzajl (RPM)')
xlabel('Time (Seconds)');

export_figure(fig, 'plots/vb_5b')

