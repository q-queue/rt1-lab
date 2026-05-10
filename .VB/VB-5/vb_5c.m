% RT1 Lab1 VB5 c

close all

clear

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

sim('fahrg4_c');

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

shifts = [];

for i = 2 : length(gaenge)

  if gaenge(i - 1) ~= gaenge(i)
    shifts(end + 1) = i;
  end

end

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

fig = figure();

hold on

plot(t, n);

plot(t(shifts), n(shifts), 'o');

ax = gca();
mid_v = ax.YLim(2) / 8;

idx = 1;

for i = shifts
  text(t(i), n(i) - 100, sprintf('Gear %d', gaenge(i)));
  text(t(i), mid_v * idx, sprintf('T = %g', t(i)));
  idx = idx + 1;
end

hold off

ylabel('Drehzahl (RPM)');
xlabel('Time (Seconds)');

title('Motordrehzahl mit der Zeit');

export_figure(fig, 'plots/vb_5c_drehzahl');

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

fig = figure();

hold on

plot(t, x1);
plot(t, x2);
plot(t, x3);
plot(t, x4);

ax = gca();
top_v = ax.YLim(2);

for i = shifts
  xline(t(i), '--k', 'LineWidth', 1);
  text(t(i), top_v, sprintf('Gear %d', gaenge(i)));
  text(t(i), 20, sprintf('T = %g', t(i)));
end

hold off

xlabel('Time (Seconds)');

export_figure(fig, 'plots/vb_5c_gear_changes');

