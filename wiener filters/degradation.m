function [y, h, n] = degradation(x)
    h = fspecial('motion', 42, 30);
    n = sqrt(0.001) * randn(size(x));
    
    y = imfilter(x,h,'replicate', 'same', 'conv');
    y = y + n;
end
