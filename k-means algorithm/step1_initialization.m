function [LUT, M] = step1_initialization(S, k)
    % m is the total number of points been clustered, n is the amount of
    % features.
    m = size(S, 1);
    n = size(S, 2);
    
    LUT = zeros(1, m);
    %M = zeros(k, n);
    
    seed = floor(m/k);
    seed_array = 1 + (0:k-1)*seed; 
    M = S(seed_array , :);
    
end
