clear;

%read image
Im = imread('lena.bmp');

[R,C]=size(Im);
output1=zeros(R/8,C/8);

%Binarize 
Im = im2bw(Im);

%downsample
for i=1:8:R
    for j=1:8:C
        output1((i-1)/8+1,(j-1)/8+1) = Im(i,j);
    end
end

%zero panding
[R,C]=size(output1);
output1 = [zeros(1,C+2);[zeros(R,1), output1, zeros(R,1)];zeros(1,C+2)];

[R,C]=size(output1);
output2 = zeros(size(output1));

%calculate yokoi number
for i=2:R-1
    for j=2:C-1
        if output1(i,j) == 0
            output2(i,j) = 0;
            continue;
        end
        q = 0;
        r = 0;
        s = 0;
        
        %calculate q r s
        if output1(i,j+1) == 1
            if output1(i-1,j+1) == 1 && output1(i-1,j) == 1
                r = r + 1;
            else
                q = q + 1;
            end
        else 
            s = s + 1;
        end
        
        if output1(i-1,j) == 1
            if output1(i-1,j-1) == 1 && output1(i,j-1) == 1
                r = r + 1;
            else
                q = q + 1;
            end
        else 
            s = s + 1;
        end
        
        if output1(i,j-1) == 1
            if output1(i+1,j-1) == 1 && output1(i+1,j) == 1
                r = r + 1;
            else
                q = q + 1;
            end
        else 
            s = s + 1;
        end
        
        if output1(i+1,j) == 1
            if output1(i+1,j+1) == 1 && output1(i,j+1) == 1
                r = r + 1;
            else
                q = q + 1;
            end
        else 
            s = s + 1;
        end
        
        %calculate output
        if s == 4
            output2(i,j) = 0;
        elseif r == 4
            output2(i,j) = 5;
        else
            output2(i,j) = q;                
        end
    end
end

%clean zero panding
output2 = output2(2:end-1,2:end-1);

%output txt and image
writematrix(output2);
imshow(output2)
