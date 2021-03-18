function [LUT, M] = mykmeans(S, k)
    
    [LUT, M] = step1_initialization(S, k);
    
    converged = false;
    max_iter = 100;
    t = 1;
    threshold = 0.02;
    M_prev = zeros(size(M));
    
    while ~converged && t < max_iter
        LUT = step2_assignment(S, k, LUT, M);
        M_prev = M;
        M = step3_update(S, k, LUT, M);
        
        converged = sum( sum((M-M_prev).^2) ) < threshold; 
        t = t + 1;
    end
    
    fprintf('Iteration finished after %d steps.\n', t);

end
