clear;

%read image
Im = imread('lena.bmp');
Im = double(Im);
[R,C] = size(Im);

%(a)
% subplot(121);imshow(uint8(Im));title('original image');
% subplot(122);imhist(uint8(Im));title('original image hist');

% 取/3的四捨五入與計算1-256的pdf
pdf = zeros(1,256);
for i = 1:R
    for j = 1:C
        Im(i,j) = round(Im(i,j)/3);%四捨五入
        pdf(Im(i,j)+1) = pdf(Im(i,j)+1) + 1;%灰階值0放入index1的格子裡
    end
end

%(b)
subplot(121);imshow(uint8(Im));title('1/3original image');
subplot(122);imhist(uint8(Im));title('1/3original image hist');

%cdf  
cdf = cumsum(pdf);

%灰階值轉換
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
