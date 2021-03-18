a = imread('input\AlfredoBorba_TuscanLandscape.jpg');
[ver_a, hor_a, flip_a] = flip_and_rotate(a);
figure
subplot(1,3,1);
imshow(ver_a)
subplot(1,3,2);
imshow(hor_a)
subplot(1,3,3);
imshow(flip_a)