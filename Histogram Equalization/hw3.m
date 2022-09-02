clear;

%read image
Im = imread('lena.bmp');
Im = double(Im);
[R,C] = size(Im);

%(a)
% subplot(121);imshow(uint8(Im));title('original image');
% subplot(122);imhist(uint8(Im));title('original image hist');

% ��/3���|�ˤ��J�P�p��1-256��pdf
pdf = zeros(1,256);
for i = 1:R
    for j = 1:C
        Im(i,j) = round(Im(i,j)/3);%�|�ˤ��J
        pdf(Im(i,j)+1) = pdf(Im(i,j)+1) + 1;%�Ƕ���0��Jindex1����l��
    end
end

%(b)
subplot(121);imshow(uint8(Im));title('1/3original image');
subplot(122);imhist(uint8(Im));title('1/3original image hist');

%cdf  
cdf = cumsum(pdf);

%�Ƕ����ഫ
trans = zeros(1,256);
for i = 1:256
    trans(i) = round(((cdf(i) - min(cdf(cdf>0)))/(max(cdf) - min(cdf(cdf>0))))*255);
end

%output img
output = zeros(R,C);
for i = 1:R
    for j = 1:C
        output(i,j) = trans(Im(i,j) + 1);
    end
end

%(c)
subplot(121);imshow(uint8(output));title('histogram equalized image');
subplot(122);imhist(uint8(output));title('histogram equalized image hist');
