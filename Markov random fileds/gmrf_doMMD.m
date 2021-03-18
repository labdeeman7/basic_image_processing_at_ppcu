function mrf=gmrf_doMMD(mrf)

         cmap = load('MRF_colormap.mat'); % the colormap
            h = mrf.imagesize(1);         % height of the image
            w = mrf.imagesize(2);         % width of the image
         cnum = mrf.classnum;             % number of classes
         beta = mrf.Beta;                 % value of parameter beta
    DeltaUmin = mrf.DeltaUmin;            % value of minimal necessary energy change
            T = mrf.T0;                   % temperature at the begining
            c = mrf.c;                    % the c constant parameter
     

           cycle = 0;
    summa_deltaE = 2 * DeltaUmin; % the first iteration is guaranteed

    while summa_deltaE > DeltaUmin 
        
        % ====================================== %
        %                                        %
        %    Please, put your implementation     %
        %             BELOW THIS LINE            %
        %                                        %
        % ====================================== %
        summa_deltaE = 0;
        cycle = cycle + 1;
        
        for y=1:h
            for x=1:w
                C = mrf.classmask(y, x);
                neighbor_class_labels = [];
                
%                 for relative_pos_y = [-1, 0, 1]
%                     for relative_pos_x = [-1, 0, 1]
%                         r = y + relative_pos_y; %row
%                         c = x + relative_pos_x; %column
%                         if ( r > 0 && r <= h && c > 0 && c <= w && ~( r == y && c == x) )
%                             neighbor_class_labels = [neighbor_class_labels, ...
%                                 mrf.classmask(r, c) ];
%                         end
%                     end
%                 end

                %%%%%% using the diagonal e=neighburs does not work and it
                %%%%%% conflicts with what was given in the class where
                %%%%%% only vertical and horizontal neigburs was explaiend
                
                if( y > 1)
                   neighbor_class_labels = [neighbor_class_labels, mrf.classmask(y-1, x) ];
                end
                if (y < h)
                   neighbor_class_labels = [neighbor_class_labels, mrf.classmask(y+1, x) ];
                end
                if( x > 1)
                   neighbor_class_labels = [neighbor_class_labels, mrf.classmask(y, x-1) ];
                end
                if (x < w)
                   neighbor_class_labels = [neighbor_class_labels, mrf.classmask(y, x+1)];
                end
                
                
                actual_post_prob = mrf.logProbs{C}(y, x);                
                actual_prior_prob = 0;
                for N = neighbor_class_labels
                    if C == N
                       actual_prior_prob = actual_prior_prob - beta;
                    else
                        actual_prior_prob = actual_prior_prob + beta;
                    end
                end
                        
                
                list_ex_C = setdiff(1:cnum, C);
                rand_new_C = list_ex_C(randi(numel(list_ex_C)));
                
%                 if  ( mod(y, h/2) == 0 && mod(x, w/2) == 0 )
%                     disp(beta)
%                     disp(y)
%                     disp(x)
%                     disp(C)
%                     disp(neighbor_class_labels)
%                     disp(actual_prior_prob)
%                     disp(list_ex_C)
%                     disp(rand_new_C)
%                 end
                
                new_post_prob = mrf.logProbs{rand_new_C}(y, x);
                new_prior_prob = 0;
                for N = neighbor_class_labels
                    if rand_new_C == N
                       new_prior_prob = new_prior_prob - beta;
                    else
                        new_prior_prob = new_prior_prob + beta;
                    end
                end
                
                U_act = actual_post_prob + actual_prior_prob;
                U_new = new_post_prob + new_prior_prob;
                dU = U_new - U_act;
                
                if (dU < 0 || ( dU > 0 && rand < exp( -dU/T ) ) )
%                 if (dU < 0)
                    summa_deltaE = summa_deltaE + abs(dU);
                    mrf.classmask(y, x) = rand_new_C;
                end
                
                
            end
        end
        
        T = c*T;
        
        % ====================================== %
        %                                        %
        %    Please, put your implementation     %
        %             ABOVE THIS LINE            %
        %                                        %
        % ====================================== %    
        
        imshow(uint8(255*reshape(cmap.color(mrf.classmask,:), h, w, 3)));
        %fprintf('Iteration #%i\n', cycle);
        title(['Class map in cycle ', num2str(cycle)]);
        drawnow;
    end
end
