function ClassMap = recognition_phase(I, MODEL)
    ClassMap = zeros('like',I);
    BB = zeros(size(I,1) , size(I,2), 9);
    for k = 1:9
        H = laws_kernel(k);
        B = conv2(I,H,'same');
        B = B.^2;
        N = ones(15)/ (15*15);
        B_star = conv2(B,N,'same');  
        BB(:, :, k) = B_star;
    end
    
    for x = 1: size(I,1)
        for y = 1: size(I,2)
            sum_abs_diff = zeros(1,size(MODEL,1));
            for n = 1: size(MODEL,1)
                sum_abs_diff(n) = sum(abs( reshape((BB(x,y,:)),[],1) -  reshape(MODEL(n,:),[],1)  ) );
            end
            [~,ind] = min(sum_abs_diff);
            ClassMap(x,y) = ind;
        end
    end
end
