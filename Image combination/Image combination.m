a=imread('Lion.bmp');
b=imread('Pond.bmp');
c=imread('Wave.bmp');
z = imadd(0.9*a,0.4*c,'uint16');
z = uint8(z);
k = imadd(0.7*z,0.5*b,'uint16');
figure,imshow(uint8(k));