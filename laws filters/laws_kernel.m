function H = laws_kernel(k)

    if k >= 0 && k <= 10
        Lk = zeros(9,3,3);
        L = 1/6 * [1;2;1];
        E = 1/2 * [1;0;-1];
        S = 1/2 * [1;-2;1];
        
        Lk(1, :, :) = L * L';
        Lk(2, :, :) = L * E';
        Lk(3, :, :) = L * S';
        Lk(4, :, :) = E * L';
        Lk(5, :, :) = E * E';
        Lk(6, :, :) = E * S';
        Lk(7, :, :) = S * L'; 
        Lk(8, :, :) = S * E';
        Lk(9, :, :) = S * S';
        
%         size(Lk(k, :, :))
        H = squeeze(Lk(k, :, :));
        
    else
        error("k is not valid")
    end
end
