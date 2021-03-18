function out_img = blur_edge(in_img)
    IN_IMG = fft2(in_img);
    psf = fspecial('gaussian', 60, 10);
    OTF = psf2otf(psf , size(in_img));
    blurred_img = abs( ifft2(OTF .* IN_IMG) );
    
    wm = padarray(ones(70), [1,1],0);
    wm2 = imresize(wm, size(in_img) , 'bilinear');
    wm2 = mat2gray(wm2,[0, 1]);
    out_img = wm2 .* in_img + (1- wm2) .* blurred_img;
end
