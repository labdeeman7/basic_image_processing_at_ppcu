clear;
clc;

T=.2;
x= double( imread ('input/lena.bmp')); %read original image
N1= size (x,1); 
N2 = size (x,2);
figure (1); imagesc (x); colormap( gray) %display original image

w=5; h=ones(w,w)/w^2;
% PSF of bluring
X=fft2(x);
% DFT of original image
H=psf2otf(h,[N1,N2]);
% DFT of PSF
Y=X.*H;
% DFT of blurred image
y=ifft2(Y)+10* randn (N1,N2); %observed image: blurred + additive noise
Y=fft2(y);
% DFT of the observed image
figure (2); imagesc (abs(ifft2(Y))); colormap (gray ); %display observed image


BF= find(abs(H)<T);
H(BF)=T;

invH=ones(N1,N2)./H;
X1=Y.*invH;
im = abs(ifft2(X1)); % reconstructed image
figure(3); imagesc (im ); colormap (gray ) %display result