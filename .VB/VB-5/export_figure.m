
% - -- - -- - -- - -- - -- - -- - -- - -- - -- - -- - --

%%% Export Figure Function

function export_figure(figHandle, filepath)

    [folder, ~, ~] = fileparts(filepath);

    if ~isempty(folder) && ~isfolder(folder)
        mkdir(folder); 
    end

    %% -------------------- Export PNG --------------------

    pngFile = fullfile(filepath + ".png");
    exportgraphics(figHandle, pngFile, "Resolution", 300, "BackgroundColor", "white");

end
