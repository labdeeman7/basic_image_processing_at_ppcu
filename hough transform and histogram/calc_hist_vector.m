function hist_vector = calc_hist_vector(input_img)
    dim = size(input_img);
    hist_vector = zeros(1, 256);
    
    for x = 1:dim(1)
        for y = 1:dim(2)
            intensity_value = input_img(x,y);
            % intensity values from 0-255, matlab from 1-256.
            idx = intensity_value + 1;
            hist_vector(idx) =  hist_vector(idx) + 1;
        end
    end
    
end