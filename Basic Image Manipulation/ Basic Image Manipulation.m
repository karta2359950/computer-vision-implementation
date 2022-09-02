clear;

Im = imread('lena.bmp');
[R,C]=size(Im);
output1=zeros(R,C);
for i=1:R
    for j=1:C
        if Im(i,j) <128
            output1(i,j) = 0;
        else
            output1(i,j) = 1;
        end
    end
end
%imshow(output1) (a)

cnt = zeros(1,256);
for i=1:R
    for j=1:C
        %灰階值0放入index1的格子裡
        cnt(Im(i,j)+1) = cnt(Im(i,j)+1) + 1;
    end
end
%bar(cnt)  (b)

L = bwareaopen(output1, 500, 8);%去除500以下區域
[L, n] = mybwlabel(L);%找連通圖

stats = regionprops(L);%印出centroid and bounding box

%輸出box與centroid
imshow(L);hold on;%  (c)
 for i = 1 : n
  tempBound = stats(i).BoundingBox;
  rectangle('position',tempBound,'edgecolor','r');
 end
 
centroids = [stats.Centroid];
xCentroids = centroids(1:2:end);
yCentroids = centroids(2:2:end);
plot(xCentroids, yCentroids,'r+', 'MarkerSize', 12, 'LineWidth', 1);
hold off;
