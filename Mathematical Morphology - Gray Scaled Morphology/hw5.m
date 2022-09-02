clear;

%read image
Im = imread('lena.bmp');
[R,C] = size(Im);

% create kernal         
mask=[0,1,1,1,0;
    1,1,1,1,1;
    1,1,1,1,1;
    1,1,1,1,1;
    0,1,1,1,0;];

[r, c]=size(mask);
output1 = zeros(size(Im));
output2 = zeros(size(Im));
  
for i=ceil(r/2):R-floor(r/2)
    for j=ceil(c/2):C-floor(c/2)
        %取5x5範圍
        neighors=Im(i-floor(r/2):i+floor(r/2), j-floor(c/2):j+floor(c/2));  
        %取kernal有1的index
        select=neighors(logical(mask));
        %dilation
        output1(i, j)=max(select(:)); 
        %erosion
        output2(i, j)=min(select(:)); 
    end
end
%(a)
%imshow(uint8(output1))
%(b)
%imshow(uint8(output2))

output3 = zeros(size(Im));
output4 = zeros(size(Im));

for i=ceil(r/2):R-floor(r/2)
    for j=ceil(c/2):C-floor(c/2)
        %取5x5範圍
        neighors_b=output2(i-floor(r/2):i+floor(r/2), j-floor(c/2):j+floor(c/2)); 
        neighors_a=output1(i-floor(r/2):i+floor(r/2), j-floor(c/2):j+floor(c/2));  
        %取kernal有1的index
        select_b=neighors_b(logical(mask));
        select_a=neighors_a(logical(mask));
        %opening
        output3(i, j)=max(select_b(:));
        %closing
        output4(i, j)=min(select_a(:)); 
        
    end
end

%(c)
imshow(uint8(output3))
%(d)
imshow(uint8(output4))