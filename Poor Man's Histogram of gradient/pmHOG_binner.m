function H = pmHOG_binner(PHI, MAG)
    
    no_bin = 9;
    H = zeros(1,no_bin);
    
    start = -90;
    for i = 1:no_bin
        mini = start + 20*(i-1); 
        maxi = mini + 20;
        
        LOG_MASK = (PHI >= mini & PHI < maxi);
        mag_in_bin = MAG(LOG_MASK);
        
        H(i) = sum(mag_in_bin);
    end
end
