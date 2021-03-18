function pine = find_the_pine(I)
   
    I_hsv = rgb2hsv(I);
    h_channel = squeeze(I_hsv(: , : , 1));
    
    pine = h_channel < 0.15;
end