function output_img = stretch_lin(input_img)
    
    min_I = double(min(input_img(:)));
    max_I = double(max(input_img(:)));
    
    output_img = 255.0 /( max_I - min_I ) * (input_img - min_I); 
    output_img = uint8(output_img);
    
end