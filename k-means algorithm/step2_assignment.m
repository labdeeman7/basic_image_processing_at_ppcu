function LUT = step2_assignment(S, k, LUT, M)
    m = size(S, 1);
    
    d_ij = zeros(m, k);
    for i = 1:m
        for j = 1:k
            x_i = S(i, :);
            mu_j = M(j, :);
            d_ij(i,j) = sum((x_i-mu_j).^2);
        end
    end
    [~,I] = min(d_ij,[],2);
    
    LUT = I';
end
