function OUT = majority_voting(IN, w_dia)
    OUT = zeros('like',IN);
    
    for x=1:w_dia:size(IN,1)
        for y=1:w_dia:size(IN,2)
            startx = x; 
            endx = min(x + w_dia - 1, size(IN,1));
            starty = y; 
            endy = min(y + w_dia - 1, size(IN,2));
            SelectedWindow = IN(startx:endx, starty:endy);
            MajorityValue = mode( reshape(SelectedWindow,[],1) );
            OUT(startx:endx, starty:endy) = MajorityValue;
        end
    end
end
