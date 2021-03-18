function [PAD] = pad_image(varargin)
    if size(varargin) == 1
        varargin{2} = 10;
    end
   
    IMG = varargin{1};
    border_size = varargin{2};
    
    dim = size(IMG);
    if size(dim) ~= 2
        warning('Image is not a grayscale Image')
        IMG = rgb2gray(IMG);
    end
    
    
    PAD_dim = [dim(1) + 2*border_size, dim(2) + 2*border_size];
    PAD = uint8 (zeros(PAD_dim)); 
    PAD(border_size: dim(1)+ border_size-1, border_size:dim(2)+border_size-1)= IMG;
  
end