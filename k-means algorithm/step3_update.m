function M = step3_update(S, k, LUT, M)
    m = size(S, 1);
    
    for j = 1:k
        cluster_logical_index = LUT == j; 
        vectors_in_cluster = S( cluster_logical_index , :);
        M(j, :) = sum(vectors_in_cluster, 1)/ size(vectors_in_cluster,1);
    end
    
end
