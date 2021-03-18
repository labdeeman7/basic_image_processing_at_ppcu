function [O] = image_segmenter(I, k)
    reshaped_I = reshape(I, [ size(I, 1) * size(I, 2) , 3]);
    [LUT, M] = mykmeans(reshaped_I, k);
    O = reshaped_I;
    
    for i = 1:k
        n_times = size(O(LUT == i, :), 1);
        O(LUT == i, :) = repmat(M(i, :) , n_times, 1);
    end
    O = reshape(O, [ size(I, 1), size(I, 2) , 3]);
end
