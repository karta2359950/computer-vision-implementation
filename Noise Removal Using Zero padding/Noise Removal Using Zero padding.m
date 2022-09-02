%clear;

Im = imread('lena.bmp');
[R,C]=size(Im);


for i = 1:R
    for j = 1:C
        GN10_Im(i,j) = Im(i,j) + 10*normrnd(0,1);
        if GN10_Im(i,j) >255
            GN10_Im(i,j) = 255;
        end
    end
end
%a
imshow(GN10_Im);

for i = 1:R
    for j = 1:C
        GN30_Im(i,j) = Im(i,j) + 30*normrnd(0,1);
        if GN30_Im(i,j) >255
            GN30_Im(i,j) = 255;
        end
    end
end
%b
imshow(GN30_Im);

for i = 1:R
    for j = 1:C
        random =  rand();
        if random <= 0.05
            SPN1_Im(i,j) = 0;
        elseif random >= 1-0.05
            SPN1_Im(i,j) = 255;
        else
            SPN1_Im(i,j) = Im(i,j);
        end
    end
end
%c
imshow(SPN1_Im);

for i = 1:R
    for j = 1:C
        random =  rand();
        if random <= 0.1
            SPN2_Im(i,j) = 0;
        elseif random >= 1-0.1
            SPN2_Im(i,j) = 255;
        else
            SPN2_Im(i,j) = Im(i,j);
        end
    end
end
%d
imshow(SPN2_Im);


%zero padding 更換圖片點
ZP_Im1 = [zeros(1,C+2);[zeros(R,1), GN30_Im, zeros(R,1)];zeros(1,C+2)];
ZP_Im2 = [zeros(2,C+4);[zeros(R,2), GN30_Im, zeros(R,2)];zeros(2,C+4)];

%% box

%-1
box1 = zeros(size(ZP_Im1));

for i=2:513
    for j=2:513
        neighbors = ZP_Im1(i-1:i+1, j-1:j+1);
        box1(i,j) = sum(neighbors, 'all')/9;
    end
end

%clean zero panding
box1 = box1(2:end-1,2:end-1);

imshow(uint8(box1))


%-2
box2 = zeros(size(ZP_Im2));

for i=3:514
    for j=3:514
        neighbors = ZP_Im2(i-2:i+2, j-2:j+2);
        box2(i,j) = sum(neighbors, 'all')/25;
    end
end

%clean zero panding
box2 = box2(3:end-2,3:end-2);

imshow(uint8(box2))

%% median

%-3
median1 = zeros(size(ZP_Im1));

for i=2:513
    for j=2:513
        neighbors = ZP_Im1(i-1:i+1, j-1:j+1);
        median1(i,j) = median(neighbors, 'all');
    end
end

%clean zero panding
median1 = median1(2:end-1,2:end-1);

imshow(uint8(median1))


%-4
median2 = zeros(size(ZP_Im2));

for i=3:514
    for j=3:514
        neighbors = ZP_Im2(i-2:i+2, j-2:j+2);
        median2(i,j) = median(neighbors, 'all');
    end
end

%clean zero panding
median2 = median2(3:end-2,3:end-2);

imshow(uint8(median2))


%% opening and closing

%-5
mask=[0,1,1,1,0;
    1,1,1,1,1;
    1,1,1,1,1;
    1,1,1,1,1;
    0,1,1,1,0;];

OC_Im = imopen(GN30_Im,mask); %更換圖片點
OC_Im = imclose(OC_Im,mask);

imshow(OC_Im)


%-6
CO_Im = imclose(GN30_Im,mask); %更換圖片點
CO_Im = imopen(CO_Im,mask);

imshow(CO_Im)

%% SNR

%更換圖片點
Old_Im = Im;
%因matlab存檔後固定size會填255在外圍，所以要轉回gray後再取出圖片
New_Im = rgb2gray(imread('d-6.jpg'));
New_Im = New_Im(33:544,92:603);
% imshow(New_Im)


norm = 512*512;
u_s = sum(Old_Im,'all')/norm;
v_s = 0;
u_n = (sum(New_Im,'all') - sum(Old_Im,'all'))/norm;
v_n = 0;

for i = 1:512
    for j = 1:512
        v_s = v_s + (double(Old_Im(i,j)) - u_s)^2;
        v_n = v_n + (double(New_Im(i,j)) - double(Old_Im(i,j)) - u_n)^2;
    end
end

v_s = v_s/norm;
v_n = v_n/norm;

SNR = 20*log10(sqrt(v_s)/sqrt(v_n));

