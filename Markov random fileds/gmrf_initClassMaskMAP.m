function mrf=gmrf_initClassMaskMAP(mrf)

 cmap = load('MRF_colormap.mat'); % the colormap
    h = mrf.imagesize(1);         % height of the image
    w = mrf.imagesize(2);         % width of the image
 cnum = mrf.classnum;             % number of classes

    for y=1:h
        for x=1:w

            % ====================================== %
            %                                        %
            %    Please, put your implementation     %
            %             BELOW THIS LINE            %
            %                                        %
            % ====================================== %
            class_index_vec = [];
            for cind = 1:cnum
                class_index_vec = [class_index_vec , mrf.logProbs{cind}(y,x)];
            end
            
            [~ , minind] = min(class_index_vec);
            
            % ====================================== %
            %                                        %
            %    Please, put your implementation     %
            %             ABOVE THIS LINE            %
            %                                        %
            % ====================================== %             
            
            mrf.classmask(y,x) = minind;
            
        end
    end
    
    imshow(uint8(255*reshape(cmap.color(mrf.classmask,:), h, w, 3)));

end