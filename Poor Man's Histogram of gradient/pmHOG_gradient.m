function [PHI, MAG] = pmHOG_gradient(I)   
   I = double(I); 
   H_x = [-1, 0, 1];
   H_y = [-1; 0; 1];
   
   X = imfilter(I, H_x, 'replicate', 'same');
   Y = imfilter(I, H_y, 'replicate', 'same');
   
   PHI = atan( Y./X );
   PHI = rad2deg(PHI);
   
   MAG = sqrt( X.^2 +  Y.^2 );
end
