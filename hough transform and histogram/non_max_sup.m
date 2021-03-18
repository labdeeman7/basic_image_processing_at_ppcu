function [r_vect, t_vect] = non_max_sup(H, k, p)
    dim = size(H);
    r_vect = zeros(1,k);
    t_vect = zeros(1,k);
    i = 1;
       
    while k > 0
        H_vec = H(:);
        [m , ind] = max(H_vec);
%         disp(m)
%         disp(ind)
%         disp(H)
        [x_n,y_n] = ind2sub(dim, ind);
        
        r_vect(i) = x_n;
        t_vect(i) = y_n;
        
        x_1 = max ([1; x_n-p]);
        x_2 = min ([dim(1); x_n+p]);
        
        y_1 = max ([1; y_n-p]);
        y_2 = min ([dim(2); y_n+p]);
        
        H(x_1:x_2, y_1:y_2) = 0;
        
        k = k-1;
        i = i+1;
    end
    
%     disp(H)
%     disp(r_vect)
%     disp(t_vect)
end