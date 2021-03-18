function duck = find_the_duck(I)
    I_hsv = rgb2hsv(I);
    h_channel = squeeze(I_hsv(: , : , 1));
    
    duck = h_channel < 0.16;
    
end