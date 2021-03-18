I = imread('input/AlfredoBorba_TuscanLandscape.jpg');
I = rgb2gray(I);
dim = size(I);
disp(dim)
row = 150;

figure(1);
subplot(2,1,1);
imshow(I);
hold on
begin = [0, row];
stop = [dim(2), row];
plot([begin(1),stop(1)],[begin(2),stop(2)],'Color'...
    ,'r','LineWidth',1)
subplot(2,1,2);
x = 1:1:dim(2);
y = I(row, :); 
plot(x,y);
xlabel('column index') 
ylabel('pixel intensity value')


