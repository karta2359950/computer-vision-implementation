clear;
%define filter
F1 = [0,1,0;1,-4,1;0,1,0];%lapacian_filter
F2 = [-1,-1,-1;-1,10,-1;-1,-1,-1];%high_boot_filter

%img1
%F1
F1 = F1(:);
N = 3; % Define size of mask
%read
I = imread('skeleton_orig.bmp');
I = im2double(I);
%out
subplot(1,3,1);
image(I);
title ('Original');
%¸É¹s
Img = padarray(I, [floor(N/2) floor(N/2)]);
%img to col
ImgR = im2col(Img(:,:,1), [N, N], 'sliding');
ImgG = im2col(Img(:,:,2), [N, N], 'sliding');
ImgB = im2col(Img(:,:,3), [N, N], 'sliding');
%±²¿nofRGB
R = sum(bsxfun(@times, ImgR, F1), 1);
G = sum(bsxfun(@times, ImgG, F1), 1);
B = sum(bsxfun(@times, ImgB, F1), 1);
%col to img
OofR = col2im(R, [N, N], size(Img(:,:,1)), 'sliding');
OofG = col2im(G, [N, N], size(Img(:,:,2)), 'sliding');
OofB = col2im(B, [N, N], size(Img(:,:,3)), 'sliding');
% combine RGB
OofImg(:,:,1) = OofR;
OofImg(:,:,2) = OofG;
OofImg(:,:,3) = OofB;
%out
subplot(1,3,2);
image(OofImg);
title ('lapacian filter');

%F2
F2 = F2(:);
N = 3; % Define size of mask
%¸É¹s
Img = padarray(I, [floor(N/2) floor(N/2)]);
%img to col
ImgR = im2col(Img(:,:,1), [N, N], 'sliding');
ImgG = im2col(Img(:,:,2), [N, N], 'sliding');
ImgB = im2col(Img(:,:,3), [N, N], 'sliding');
%±²¿nofRGB
R = sum(bsxfun(@times, ImgR, F2), 1);
G = sum(bsxfun(@times, ImgG, F2), 1);
B = sum(bsxfun(@times, ImgB, F2), 1);
%col to img
OofR = col2im(R, [N, N], size(Img(:,:,1)), 'sliding');
OofG = col2im(G, [N, N], size(Img(:,:,2)), 'sliding');
OofB = col2im(B, [N, N], size(Img(:,:,3)), 'sliding');
% combine RGB
OofImg(:,:,1) = OofR;
OofImg(:,:,2) = OofG;
OofImg(:,:,3) = OofB;
%out
subplot(1,3,3);
image(OofImg);
title ('high boot filter');

