clear;

%read image
Im = imread('lena.bmp');

[R,C]=size(Im);
output=zeros(R/8,C/8);

%Binarize 
Im = im2bw(Im);

%downsample
for i=1:8:R
    for j=1:8:C
        output((i-1)/8+1,(j-1)/8+1) = Im(i,j);
    end
end

%zero panding
[R,C]=size(output);
output = [zeros(1,C+2);[zeros(R,1), output, zeros(R,1)];zeros(1,C+2)];

%initialize
[R,C]=size(output);
yokoi = zeros(size(output));
pair = zeros(size(output));
shrink =1;

%thinning operator iterate
while shrink == 1
    shrink = 0;
    
    %calculate yokoi number
    for i=2:R-1
        for j=2:C-1
            if output(i,j) == 0
                yokoi(i,j) = 0;
                continue;
            end
            q = 0;
            r = 0;
            s = 0;
            
            %calculate q r s
            if output(i,j+1) == 1
                if output(i-1,j+1) == 1 && output(i-1,j) == 1
                    r = r + 1;
                else
                    q = q + 1;
                end
            else
                s = s + 1;
            end
            
            if output(i-1,j) == 1
                if output(i-1,j-1) == 1 && output(i,j-1) == 1
                    r = r + 1;
                else
                    q = q + 1;
                end
            else
                s = s + 1;
            end
            
            if output(i,j-1) == 1
                if output(i+1,j-1) == 1 && output(i+1,j) == 1
                    r = r + 1;
                else
                    q = q + 1;
                end
            else
                s = s + 1;
            end
            
            if output(i+1,j) == 1
                if output(i+1,j+1) == 1 && output(i,j+1) == 1
                    r = r + 1;
                else
                    q = q + 1;
                end
            else
                s = s + 1;
            end
            
            %calculate output
            if s == 4
                yokoi(i,j) = 0;
            elseif r == 4
                yokoi(i,j) = 5;
            else
                yokoi(i,j) = q;
            end
        end
    end
    
    %pair relationship operator
    for i=2:R-1
        for j=2:C-1
            if yokoi(i,j) == 1 && (yokoi(i+1,j) == 1 || yokoi(i,j+1)==1 || yokoi(i-1,j)==1 || yokoi(i,j-1)==1)
                pair(i,j) =1;
            else
                pair(i,j) = 0;
            end
            
        end
    end
    
    %shrink operator
    for i=2:R-1
        for j=2:C-1
            if pair(i,j) == 1
                q = 0;
                r = 0;
                s = 0;
                
                %calculate q r s
                if output(i,j+1) == 1
                    if output(i-1,j+1) == 1 && output(i-1,j) == 1
                        r = r + 1;
                    else
                        q = q + 1;
                    end
                else
                    s = s + 1;
                end
                
                if output(i-1,j) == 1
                    if output(i-1,j-1) == 1 && output(i,j-1) == 1
                        r = r + 1;
                    else
                        q = q + 1;
                    end
                else
                    s = s + 1;
                end
                
                if output(i,j-1) == 1
                    if output(i+1,j-1) == 1 && output(i+1,j) == 1
                        r = r + 1;
                    else
                        q = q + 1;
                    end
                else
                    s = s + 1;
                end
                
                if output(i+1,j) == 1
                    if output(i+1,j+1) == 1 && output(i,j+1) == 1
                        r = r + 1;
                    else
                        q = q + 1;
                    end
                else
                    s = s + 1;
                end
                
                %shrink
                if q==1
                    output(i,j) = 0;
                    shrink =1;
                end
            end
            
        end
    end
end

%clean zero panding
output = output(2:end-1,2:end-1);

imshow(output)
