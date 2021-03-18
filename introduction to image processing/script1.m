a = imread('input\AlfredoBorba_TuscanLandscape.jpg');
figure
imshow(a)
isColor = size(a,3) == 3;
a_gray = rgb2gray(a);
figure
imshow(a_gray)
imwrite(a_gray,'output\AlfredoBorba_TuscanLandscape_GRAY.jpg')

