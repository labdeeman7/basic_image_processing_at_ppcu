function MODEL = training_phase(T_cell)
   N = length(T_cell);
   MODEL = zeros(N,9);
   
   for n = 1:N
       for k = 1:9
           H = laws_kernel(k);
           A = conv2(T_cell{n},H,'same');
           MODEL(n,k) = sum(sum(A.^2))/(size(A,1) * size(A,2));
       end
   end
end
