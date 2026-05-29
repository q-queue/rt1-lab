% RT1 Lab 2 Analoge und Digitale Regler

%% Run Batch Sim

BatchSimulation;

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

exportgraphics(figure(1), ...
  '.plots/vb1/Regelkreis.png', ...
  "Resolution", 300, "BackgroundColor", "white");

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

fig = figure(2);

ax = findall(fig, 'type', 'axes');

labels = cellstr(compose('kp = %g', KP));

legend(ax, labels);

exportgraphics(fig, ...
  '.plots/vb1/Sprungantwort.png', ...
  "Resolution", 300, "BackgroundColor", "white");

%% - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

exportgraphics(figure(3), ...
  '.plots/vb1/RegelZeit.png', ...
  "Resolution", 300, "BackgroundColor", "white");

