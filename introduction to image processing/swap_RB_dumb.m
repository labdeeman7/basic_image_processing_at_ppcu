function [BGR] = swap_RB_dumb(RGB)
    dim = size(RGB);
    BGR = RGB;
    for i = 1:dim (1)
        for j = 1:dim (2)
           BGR(i,j,1) =  RGB(i,j,3);
           BGR(i,j,3) =  RGB(i,j,1);
        end
    end
end