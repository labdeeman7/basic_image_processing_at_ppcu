function [H] = my_hough(input_img)
    dim = size(input_img);
    disp(dim)
    r_max = floor(norm(dim));
    n_theta = 180;
    H = zeros(r_max, n_theta);
    
    
   %The for loops
   for x = 1:dim(1)
        for y = 1:dim(2)
            if(input_img(x,y))
                for theta = 1:n_theta
                    theta_rad = (theta * pi)/180;
                    r = floor( x * cos (theta_rad) + y * sin (theta_rad) );
                    if (r >= 1 && r <= r_max)
                        H(r, theta) = H(r, theta) + 1 ;
                    end
                end
            end
        end
   end
    
end