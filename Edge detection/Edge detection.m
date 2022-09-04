clear;
%define filter
f = fspecial('Sobel');

f = f(:);
N = 3; % Define size of mask
%read
I = imread('peppers.png');
I = im2double(I);
%out
subplot(1,2,1);
image(I);
title ('Original');
%¸É¹s
Img = padarray(I, [floor(N/2) floor(N/2)]);
%img to col
ImgR = im2col(Img(:,:,1), [N, N], 'sliding');
ImgG = im2col(Img(:,:,2), [N, N], 'sliding');
ImgB = im2col(Img(:,:,3), [N, N], 'sliding');
%±²¿nofRGB
R = sum(bsxfun(@times, ImgR, f), 1);
G = sum(bsxfun(@times, ImgG, f), 1);
B = sum(bsxfun(@times, ImgB, f), 1);
%col to img
OofR = col2im(R, [N, N], size(Img(:,:,1)), 'sliding');
OofG = col2im(G, [N, N], size(Img(:,:,2)), 'sliding');
OofB = col2im(B, [N, N], size(Img(:,:,3)), 'sliding');
% combine RGB
OofImg(:,:,1) = OofR;
OofImg(:,:,2) = OofG;
OofImg(:,:,3) = OofB;
%out
subplot(1,2,2);
image(OofImg);
title ('color edge detection');


