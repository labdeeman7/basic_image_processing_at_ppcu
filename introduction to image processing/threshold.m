function [TH] = threshold(IMG, level)
    dim = size(IMG);
    if size(dim) ~= 2
        warning('input is not a grayscale image')
        IMG = rgb2gray(IMG);
    end
    mask = IMG < level;
    % true for below level, false for above level
    IMG(mask == 1) = 0;
    IMG(mask == 0) = 255;
    TH = IMG;
end