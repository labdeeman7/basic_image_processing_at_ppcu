function output_img = stretch_log(input_img, c)
  
    input_img = double(input_img);
    
    output_img = c * log( 1 + input_img );
    
    min_I = double(min(output_img(:)))
    max_I = double(max(output_img(:)))
    
    output_img = 255.0 /( max_I - min_I ) * (output_img - min_I); 
    output_img = uint8(output_img);
    
end