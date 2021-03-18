function norm_HOG = pmHOG_extractHOG(I)
    [H, W] = size(I);
    h = H/8; w = W/8;
    
    norm_HOG = zeros(h-1, w-1, 36); 
    
    
    for i = 1: (size(norm_HOG, 1))
        for j = 1:(size(norm_HOG, 2))       
            start_y = 1 + (i-1) * 8; 
            start_x = 1 + (j-1) * 8; 
            end_y = start_y + 15;
            end_x = start_x + 15;
            
%             h
%             w
%             i
%             j
%             start_x
%             end_x
%             size(I)
            block = I(start_y:end_y, start_x:end_x);
            
            block_blur = imgaussfilt(block,0.1);
            
            feature_vector = zeros(1, 36);
            
            current_element = 1;
            
            for cell_i = 1:2
                for cell_j = 1:2
                    start_cell_i = 1 + (cell_i-1) *  8; 
                    start_cell_j = 1 + (cell_j-1) * 8; 
                    end_cell_i = cell_i * 8;
                    end_cell_j = cell_j * 8;
                    cell = block_blur( start_cell_i:end_cell_i,...
                        start_cell_j:end_cell_j);
                    
                    [PHI, MAG] = pmHOG_gradient(cell);
                    
                    H = pmHOG_binner(PHI, MAG);
                    
%                     size(H)
                    
                    feature_vector(current_element: current_element+8)...
                        = H;
                    
                    current_element = current_element + 9;
                end
            end
            
            feature_vector = feature_vector / sum(feature_vector);
            
            norm_HOG(i,j, :) = feature_vector; 
        end
    end
end
