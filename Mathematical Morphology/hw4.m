clear;

%read image
Im = imread('lena.bmp');
Im = im2bw(Im);
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
        output1(i, j)=max(select(:)); 
        output2(i, j)=min(select(:)); 
    end
end
%(a)
%imshow(output1)
%(b)
imshow(output2)

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
        output3(i, j)=max(select_b(:)); 
        output4(i, j)=min(select_a(:)); 
        
    end
end

%(c)
%imshow(output3)
%(d)
%imshow(output4)
mask_j = [0,0,0,0,0;
    0,0,0,0,0;
    1,1,0,0,0;
    0,1,0,0,0;
    0,0,0,0,0;];

mask_k = [0,0,0,0,0;
    0,1,1,0,0;
    0,0,1,0,0;
    0,0,0,0,0;
    0,0,0,0,0;];

Im_imc= imcomplement(Im);

x =zeros(size(Im));
y=zeros(size(Im));
for i=ceil(r/2):R-floor(r/2)
    for j=ceil(c/2):C-floor(c/2)
        %取5x5範圍
        neighors_x=Im(i-floor(r/2):i+floor(r/2), j-floor(c/2):j+floor(c/2));  
        neighors_y=Im_imc(i-floor(r/2):i+floor(r/2), j-floor(c/2):j+floor(c/2));  
        %取kernal有1的index
        select_x=neighors_x(logical(mask_j));
        select_y=neighors_y(logical(mask_k));
        
        x(i, j)=min(select_x(:)); 
        y(i, j)=min(select_y(:)); 
    end
end

output5=x&y;
%(e)
imshow(output5)