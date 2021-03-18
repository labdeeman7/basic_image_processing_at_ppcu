function newF = mask_fourier(F, x, y, r)
    F = fftshift(F);
    dim = size(F);
    x = round(x);
    y = round(y);
    
    point_size = length(x);
    
    for idx = 1:point_size
        x_n = x(idx);
        y_n = y(idx);
        
        y_1 = max ([1; y_n-r]);
        y_2 = min ([dim(1); y_n+r]);
        
        x_1 = max ([1; x_n-r]);
        x_2 = min ([dim(2); x_n+r]);
        
        F(y_1:y_2, x_1:x_2) = 0 + 0j;
    end
    
    newF = ifftshift(F); 
end
