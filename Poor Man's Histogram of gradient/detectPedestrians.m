function [score] = detectPedestrians(I, sample_HOG)
    im_HOG = pmHOG_extractHOG(I); 
    
    elem_mul = im_HOG .* sample_HOG;
    
    elem_mul_vec = elem_mul(:);
    
    non_sig_mask = elem_mul_vec < 0.01;
    
    elem_mul_vec(non_sig_mask) = [];
    
    score = nansum(elem_mul_vec);
    
end
