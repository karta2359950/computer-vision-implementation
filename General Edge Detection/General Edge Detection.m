clear;

%read image
Im = imread('lena.bmp');

%% robert

robert = zeros(size(Im));

%get r1 r2
mask = [-1,0;0,1];
r1 = conv(Im, mask);
mask = [0,-1;1,0];
r2 = conv(Im, mask);

%compute output
for i =1:512
    for j =1:512
       if sqrt(r1(i,j)^2+r2(i,j)^2) >= 12     %threshold
           robert(i,j) = 0;
       else
           robert(i,j) = 255;
       end
    end
end

imshow(robert)

%% prewit

prewit = zeros(size(Im));

%get p1 p2
mask = [-1,-1,-1;0,0,0;1,1,1];
p1 = conv(Im, mask);
mask = [-1,-0,1;-1,0,1;-1,0,1];
p2 = conv(Im, mask);

%compute output
for i =1:512
    for j =1:512
       if sqrt(p1(i,j)^2+p2(i,j)^2) >= 24     %threshold
           prewit(i,j) = 0;
       else
           prewit(i,j) = 255;
       end
    end
end

imshow(prewit)

%% sobel

sobel = zeros(size(Im));

%get s1 s2
mask = [-1,-2,-1;0,0,0;1,2,1];
s1 = conv(Im, mask);
mask = [-1,-0,1;-2,0,2;-1,0,1];
s2 = conv(Im, mask);

%compute output
for i =1:512
    for j =1:512
       if sqrt(s1(i,j)^2+s2(i,j)^2) >= 38     %threshold
           sobel(i,j) = 0;
       else
           sobel(i,j) = 255;
       end
    end
end

imshow(sobel)

%% frei

frei = zeros(size(Im));

%get f1 f2
mask = [-1,-sqrt(2),-1;0,0,0;1,sqrt(2),1];
f1 = conv(Im, mask);
mask = [-1,-0,1;-sqrt(2),0,sqrt(2);-1,0,1];
f2 = conv(Im, mask);

%compute output
for i =1:512
    for j =1:512
       if sqrt(f1(i,j)^2+f2(i,j)^2) >= 30     %threshold
           frei(i,j) = 0;
       else
           frei(i,j) = 255;
       end
    end
end

imshow(frei)

%% kirsch

kirsch = zeros(size(Im));

%get k
k = zeros(512,512,8);
mask = [-3,-3,5;-3,0,5;-3,-3,5];
k(:,:,1) = conv(Im, mask);
mask = [-3,5,5;-3,0,5;-3,-3,-3];
k(:,:,2) = conv(Im, mask);
mask = [5,5,5;-3,0,-3;-3,-3,-3];
k(:,:,3) = conv(Im, mask);
mask = [5,5,-3;5,0,-3;-3,-3,-3];
k(:,:,4) = conv(Im, mask);
mask = [5,-3,-3;5,0,-3;5,-3,-3];
k(:,:,5) = conv(Im, mask);
mask = [-3,-3,-3;5,0,-3;5,5,-3];
k(:,:,6) = conv(Im, mask);
mask = [-3,-3,-3;-3,0,-3;5,5,5];
k(:,:,7) = conv(Im, mask);
mask = [-3,-3,-3;-3,0,5;-3,5,5];
k(:,:,8) = conv(Im, mask);

%compute output
for i =1:512
    for j =1:512
       if max(k(i,j,:)) >= 135     %threshold
           kirsch(i,j) = 0;
       else
           kirsch(i,j) = 255;
       end
    end
end

imshow(kirsch)

%% robinson

robinson = zeros(size(Im));

%get r
r = zeros(512,512,8);
mask = [-2,0,1;-2,0,2;-2,0,1];
r(:,:,1) = conv(Im, mask);
mask = [0,1,2;-1,0,1;-2,-1,0];
r(:,:,2) = conv(Im, mask);
mask = [1,2,1;0,0,0;-1,-2,-1];
r(:,:,3) = conv(Im, mask);
mask = [2,1,0;1,0,-1;0,-1,-2];
r(:,:,4) = conv(Im, mask);
mask = [1,0,-1;2,0,-2;1,0,-1];
r(:,:,5) = conv(Im, mask);
mask = [0,-1,-2;1,0,-1;2,1,0];
r(:,:,6) = conv(Im, mask);
mask = [-1,-2,-1;0,0,0;1,2,1];
r(:,:,7) = conv(Im, mask);
mask = [-2,-1,0;-1,0,1;0,1,2];
r(:,:,8) = conv(Im, mask);

%compute output
for i =1:512
    for j =1:512
       if max(r(i,j,:)) >= 43     %threshold
           robinson(i,j) = 0;
       else
           robinson(i,j) = 255;
       end
    end
end

imshow(robinson)

%% babu

babu = zeros(size(Im));

%get b
b = zeros(512,512,6);
mask = [100,100,100,100,100;
        100,100,100,100,100;
        0,0,0,0,0;
        -100,-100,-100,-100,-100;
        -100,-100,-100,-100,-100;];
b(:,:,1) = conv(Im, mask);
mask = [100,100,100,100,100;
        100,100,100,78,-32;
        100,92,0,-92,-100;
        32,-78,-100,-100,-100;
        -100,-100,-100,-100,-100;];
b(:,:,2) = conv(Im, mask);
mask = [100,100,100,32,-100;
        100,100,92,-78,-100;
        100,100,0,-100,-100;
        100,78,-92,-100,-100;
        100,-32,-100,-100,-100;];
b(:,:,3) = conv(Im, mask);
mask = [-100,-100,0,100,100;
        -100,-100,0,100,100;
        -100,-100,0,100,100;
        -100,-100,0,-100,100;
        -100,-100,0,-100,100;];
b(:,:,4) = conv(Im, mask);
mask = [-100,32,100,100,100;
        -100,-78,92,100,100;
        -100,-100,0,100,100;
        -100,-100,-92,78,-100;
        -100,-100,-100,-32,100;];
b(:,:,5) = conv(Im, mask);
mask = [100,100,100,100,100;
        -32,78,100,100,100;
        -100,92,0,92,-100;
        -100,-100,-100,-78,32;
        -100,-100,-100,-100,-100;];
b(:,:,6) = conv(Im, mask);

%compute output
for i =1:512
    for j =1:512
       if max(b(i,j,:)) >= 5000     %threshold
           babu(i,j) = 0;
       else
           babu(i,j) = 255;
       end
    end
end

imshow(babu)