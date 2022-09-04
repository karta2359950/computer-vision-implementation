clear
%all mask
G1 = fspecial('gaussian',[3,3]);
G2 = fspecial('gaussian',[5,5]);
G3 = fspecial('gaussian',[7,7]);
G4 = fspecial('gaussian',[3,3],1);
G5 = fspecial('gaussian',[3,3],5);
G6 = fspecial('gaussian',[3,3],10);
G7 = fspecial('prewitt');
G8 = [-1,-1,-1;-1,8,-1;-1,-1,-1];

%G1
G1 = G1(:);
N = 3; % Define size of Gaussian mask
%read
I = imread('dog.jpg');
I = im2double(I);
%out
subplot(3,3,7);
image(I);
title ('Original');
%干箂
Img = padarray(I, [floor(N/2) floor(N/2)]);
%img to col
ImgR = im2col(Img(:,:,1), [N, N], 'sliding');
ImgG = im2col(Img(:,:,2), [N, N], 'sliding');
ImgB = im2col(Img(:,:,3), [N, N], 'sliding');
%辈縩ofRGB
R = sum(bsxfun(@times, ImgR, G1), 1);
G = sum(bsxfun(@times, ImgG, G1), 1);
B = sum(bsxfun(@times, ImgB, G1), 1);
%col to img
OofR = col2im(R, [N, N], size(Img(:,:,1)), 'sliding');
OofG = col2im(G, [N, N], size(Img(:,:,2)), 'sliding');
OofB = col2im(B, [N, N], size(Img(:,:,3)), 'sliding');
% combine RGB
OofImg(:,:,1) = OofR;
OofImg(:,:,2) = OofG;
OofImg(:,:,3) = OofB;
%ans
peaksnr1 = psnr(OofImg,I);
%out
subplot(3,3,1);
image(OofImg);
title ('G1');

%G2
G2 = G2(:);
N = 5; % Define size of Gaussian mask
%干箂
Img = padarray(I, [floor(N/2) floor(N/2)]);
%img to col
ImgR = im2col(Img(:,:,1), [N, N], 'sliding');
ImgG = im2col(Img(:,:,2), [N, N], 'sliding');
ImgB = im2col(Img(:,:,3), [N, N], 'sliding');
%辈縩ofRGB
R = sum(bsxfun(@times, ImgR, G2), 1);
G = sum(bsxfun(@times, ImgG, G2), 1);
B = sum(bsxfun(@times, ImgB, G2), 1);
%col to img
OofR = col2im(R, [N, N], size(Img(:,:,1)), 'sliding');
OofG = col2im(G, [N, N], size(Img(:,:,2)), 'sliding');
OofB = col2im(B, [N, N], size(Img(:,:,3)), 'sliding');
% combine RGB
OofImg(:,:,1) = OofR;
OofImg(:,:,2) = OofG;
OofImg(:,:,3) = OofB;
%ans
peaksnr2 = psnr(OofImg,I);
%out
subplot(3,3,2);
image(OofImg);
title ('G2');

%G3
G3 = G3(:);
N = 7; % Define size of Gaussian mask
%干箂
Img = padarray(I, [floor(N/2) floor(N/2)]);
%img to col
ImgR = im2col(Img(:,:,1), [N, N], 'sliding');
ImgG = im2col(Img(:,:,2), [N, N], 'sliding');
ImgB = im2col(Img(:,:,3), [N, N], 'sliding');
%辈縩ofRGB
R = sum(bsxfun(@times, ImgR, G3), 1);
G = sum(bsxfun(@times, ImgG, G3), 1);
B = sum(bsxfun(@times, ImgB, G3), 1);
%col to img
OofR = col2im(R, [N, N], size(Img(:,:,1)), 'sliding');
OofG = col2im(G, [N, N], size(Img(:,:,2)), 'sliding');
OofB = col2im(B, [N, N], size(Img(:,:,3)), 'sliding');
% combine RGB
OofImg(:,:,1) = OofR;
OofImg(:,:,2) = OofG;
OofImg(:,:,3) = OofB;
%ans
peaksnr3 = psnr(OofImg,I);
%out
subplot(3,3,3);
image(OofImg);
title ('G3');

%G4
G4 = G4(:);
N = 3; % Define size of Gaussian mask
%干箂
Img = padarray(I, [floor(N/2) floor(N/2)]);
%img to col
ImgR = im2col(Img(:,:,1), [N, N], 'sliding');
ImgG = im2col(Img(:,:,2), [N, N], 'sliding');
ImgB = im2col(Img(:,:,3), [N, N], 'sliding');
%辈縩ofRGB
R = sum(bsxfun(@times, ImgR, G4), 1);
G = sum(bsxfun(@times, ImgG, G4), 1);
B = sum(bsxfun(@times, ImgB, G4), 1);
%col to img
OofR = col2im(R, [N, N], size(Img(:,:,1)), 'sliding');
OofG = col2im(G, [N, N], size(Img(:,:,2)), 'sliding');
OofB = col2im(B, [N, N], size(Img(:,:,3)), 'sliding');
% combine RGB
OofImg(:,:,1) = OofR;
OofImg(:,:,2) = OofG;
OofImg(:,:,3) = OofB;
%ans
peaksnr4 = psnr(OofImg,I);
%out
subplot(3,3,4);
image(OofImg);
title ('G4');

%G5
G5 = G5(:);
N = 3; % Define size of Gaussian mask
%干箂
Img = padarray(I, [floor(N/2) floor(N/2)]);
%img to col
ImgR = im2col(Img(:,:,1), [N, N], 'sliding');
ImgG = im2col(Img(:,:,2), [N, N], 'sliding');
ImgB = im2col(Img(:,:,3), [N, N], 'sliding');
%辈縩ofRGB
R = sum(bsxfun(@times, ImgR, G5), 1);
G = sum(bsxfun(@times, ImgG, G5), 1);
B = sum(bsxfun(@times, ImgB, G5), 1);
%col to img
OofR = col2im(R, [N, N], size(Img(:,:,1)), 'sliding');
OofG = col2im(G, [N, N], size(Img(:,:,2)), 'sliding');
OofB = col2im(B, [N, N], size(Img(:,:,3)), 'sliding');
% combine RGB
OofImg(:,:,1) = OofR;
OofImg(:,:,2) = OofG;
OofImg(:,:,3) = OofB;
%ans
peaksnr5 = psnr(OofImg,I);
%out
subplot(3,3,5);
image(OofImg);
title ('G5');

%G6
G6 = G6(:);
N = 3; % Define size of Gaussian mask
%干箂
Img = padarray(I, [floor(N/2) floor(N/2)]);
%img to col
ImgR = im2col(Img(:,:,1), [N, N], 'sliding');
ImgG = im2col(Img(:,:,2), [N, N], 'sliding');
ImgB = im2col(Img(:,:,3), [N, N], 'sliding');
%辈縩ofRGB
R = sum(bsxfun(@times, ImgR, G6), 1);
G = sum(bsxfun(@times, ImgG, G6), 1);
B = sum(bsxfun(@times, ImgB, G6), 1);
%col to img
OofR = col2im(R, [N, N], size(Img(:,:,1)), 'sliding');
OofG = col2im(G, [N, N], size(Img(:,:,2)), 'sliding');
OofB = col2im(B, [N, N], size(Img(:,:,3)), 'sliding');
% combine RGB
OofImg(:,:,1) = OofR;
OofImg(:,:,2) = OofG;
OofImg(:,:,3) = OofB;
%ans
peaksnr6 = psnr(OofImg,I);
%out
subplot(3,3,6);
image(OofImg);
title ('G6');

%G7
G7 = G7(:);
N = 3; % Define size of Gaussian mask
%干箂
Img = padarray(I, [floor(N/2) floor(N/2)]);
%img to col
ImgR = im2col(Img(:,:,1), [N, N], 'sliding');
ImgG = im2col(Img(:,:,2), [N, N], 'sliding');
ImgB = im2col(Img(:,:,3), [N, N], 'sliding');
%辈縩ofRGB
R = sum(bsxfun(@times, ImgR, G7), 1);
G = sum(bsxfun(@times, ImgG, G7), 1);
B = sum(bsxfun(@times, ImgB, G7), 1);
%col to img
OofR = col2im(R, [N, N], size(Img(:,:,1)), 'sliding');
OofG = col2im(G, [N, N], size(Img(:,:,2)), 'sliding');
OofB = col2im(B, [N, N], size(Img(:,:,3)), 'sliding');
% combine RGB
OofImg(:,:,1) = OofR;
OofImg(:,:,2) = OofG;
OofImg(:,:,3) = OofB;
%ans
%out
subplot(3,3,8);
image(OofImg);
title ('G8');

%G8
G8 = G8(:);
N = 3; % Define size of Gaussian mask
%干箂
Img = padarray(I, [floor(N/2) floor(N/2)]);
%img to col
ImgR = im2col(Img(:,:,1), [N, N], 'sliding');
ImgG = im2col(Img(:,:,2), [N, N], 'sliding');
ImgB = im2col(Img(:,:,3), [N, N], 'sliding');
%辈縩ofRGB
R = sum(bsxfun(@times, ImgR, G8), 1);
G = sum(bsxfun(@times, ImgG, G8), 1);
B = sum(bsxfun(@times, ImgB, G8), 1);
%col to img
OofR = col2im(R, [N, N], size(Img(:,:,1)), 'sliding');
OofG = col2im(G, [N, N], size(Img(:,:,2)), 'sliding');
OofB = col2im(B, [N, N], size(Img(:,:,3)), 'sliding');
% combine RGB
OofImg(:,:,1) = OofR;
OofImg(:,:,2) = OofG;
OofImg(:,:,3) = OofB;
%ans
%out
subplot(3,3,9);
image(OofImg);
title ('G9');