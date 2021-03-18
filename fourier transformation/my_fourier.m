function [F] = my_fourier(I)
    dim = size(I);
    F = complex(zeros(dim));
    
    
    for k_1 = 0:dim(1)-1
       for k_2 = 0:dim(2)-1 
           sum_x_k1_k2 = 0;
           for n_1 = 0:dim(1)-1
               for n_2 = 0:dim(1)-1
                   x_n1_n2 = I(n_1+1, n_2+1);
                   x_k1_k2 = x_n1_n2 * exp( -1j * 2 * pi * k_1 * n_1 / dim(1) )...
                       * exp( -1j * 2 * pi * k_2 * n_2/dim(2));
                   sum_x_k1_k2 =  sum_x_k1_k2 + x_k1_k2;
               end
           end
           F(k_1+1, k_2+1) = sum_x_k1_k2;
       end
    end
    
end
