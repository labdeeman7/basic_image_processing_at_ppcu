function output_img = myconv(input_img, kernel)
	dim_img = size(input_img);
    dim_kernel = size(kernel);
    
    a = (dim_kernel(1) -1)/2;
    b = (dim_kernel(2) -1)/2;
    
    padded_img = padarray(input_img,[a b],0);
    
    rotated_kernel = rot90(rot90(kernel));
    
    output_img = zeros(dim_img);
    
    for i = 1:dim_img(1)
        for j = 1:dim_img(2)
            conv_mat = rotated_kernel .* padded_img(i:i+2*a, j:j+2*b);
            output_img(i,j) = sum ( sum ( conv_mat ) ); 
        end
    end
    
        
end
