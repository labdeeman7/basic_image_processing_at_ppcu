function [decompressed_image] = lossless_decompress(compressed_image)
    decompressed_image= [];
    H = length(compressed_image);

    for y = 1:H
        symbol = compressed_image{y}(1);
        
        row_pixels = [];
        
        N = numel(compressed_image{y});
        
        for x = 2:N
            block = repmat(symbol, 1, compressed_image{y}(x));
            row_pixels = [row_pixels, block];
            symbol = ~symbol;
        end
        
        decompressed_image = [decompressed_image; row_pixels];
    end
end