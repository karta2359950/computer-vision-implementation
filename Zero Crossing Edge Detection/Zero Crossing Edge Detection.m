clear;

%read image
Im = imread('lena.bmp');

%% lapacian

%get l
mask = [0,-1,0;-1,4,-1;0,-1,0];
l = conv(Im, mask);

%compute zero crossing image
for i =1:512
    for j =1:512
       if l(i,j) >= 15     %threshold
           l(i,j) = 1;
       elseif l(i,j) <= -15
           l(i,j) =-1;
       else
           l(i,j) = 0;
       end
    end
end

%compute output
l = padarray(l, [floor(3/2) floor(3/2)], 'replicate');
lapacian = zeros(size(l));

for i =2:513
    for j =2:513
       if(l(i,j) == 1 && (l(i+1,j) == -1 || l(i,j+1)==-1 || l(i-1,j)==-1 || l(i,j-1)==-1 || l(i+1,j+1) == -1 || l(i-1,j+1)==-1 || l(i-1,j-1)==-1 || l(i+1,j-1)==-1))
            lapacian(i,j) = 0;
       else
           lapacian(i,j) = 255;
       end
    end
end

lapacian = lapacian(2:513,2:513);

imshow(lapacian)

%% lapacian

%get l
mask = 1/3*[1,1,1;1,-8,1;1,1,1];
l = conv(Im, mask);

%compute zero crossing image
for i =1:512
    for j =1:512
       if l(i,j) >= 15     %threshold
           l(i,j) = 1;
       elseif l(i,j) <= -15
           l(i,j) =-1;
       else
           l(i,j) = 0;
       end
    end
end

%compute output
l = padarray(l, [floor(3/2) floor(3/2)], 'replicate');
lapacian = zeros(size(l));

for i =2:513
    for j =2:513
       if(l(i,j) == 1 && (l(i+1,j) == -1 || l(i,j+1)==-1 || l(i-1,j)==-1 || l(i,j-1)==-1 || l(i+1,j+1) == -1 || l(i-1,j+1)==-1 || l(i-1,j-1)==-1 || l(i+1,j-1)==-1))
            lapacian(i,j) = 0;
       else
           lapacian(i,j) = 255;
       end
    end
end

lapacian = lapacian(2:513,2:513);

imshow(lapacian)

%% mvlapacian

%get l
mask = 1/3*[2,-1,2;-1,-4,-1;2,-1,2];
l = conv(Im, mask);

%compute zero crossing image
for i =1:512
    for j =1:512
       if l(i,j) >= 10     %threshold
           l(i,j) = 1;
       elseif l(i,j) <= -10
           l(i,j) =-1;
       else
           l(i,j) = 0;
       end
    end
end

%compute output
l = padarray(l, [floor(3/2) floor(3/2)], 'replicate');
lapacian = zeros(size(l));

for i =2:513
    for j =2:513
       if(l(i,j) == 1 && (l(i+1,j) == -1 || l(i,j+1)==-1 || l(i-1,j)==-1 || l(i,j-1)==-1 || l(i+1,j+1) == -1 || l(i-1,j+1)==-1 || l(i-1,j-1)==-1 || l(i+1,j-1)==-1))
            lapacian(i,j) = 0;
       else
           lapacian(i,j) = 255;
       end
    end
end

lapacian = lapacian(2:513,2:513);

imshow(lapacian)

%% lapacian of gaussian

%get l
mask = [0,0,0,-1,-1,-2,-1,-1,0,0,0;
        0,0,-2,-4,-8,-9,-8,-4,-2,0,0;
        0,-2,-7,-15,-22,-23,-22,-15,-7,-2,0;
        -1,-4,-15,-24,-14,-1,-14,-24,-15,-4,-1;
        -1,-8,-22,-14,52,103,52,-14,-22,-8,-1;
        -2,-9,-23,-1,103,178,103,-1,-23,-9,-2;
        -1,-8,-22,-14,52,103,52,-14,-22,-8,-1;
        -1,-4,-15,-24,-14,-1,-14,-24,-15,-4,-1;
        0,-2,-7,-15,-22,-23,-22,-15,-7,-2,0;
        0,0,-2,-4,-8,-9,-8,-4,-2,0,0;
        0,0,0,-1,-1,-2,-1,-1,0,0,0;];
l = conv(Im, mask);

%compute zero crossing image
for i =1:512
    for j =1:512
       if l(i,j) >= 3000     %threshold
           l(i,j) = 1;
       elseif l(i,j) <= -3000
           l(i,j) =-1;
       else
           l(i,j) = 0;
       end
    end
end

%compute output
l = padarray(l, [floor(11/2) floor(11/2)], 'replicate');
lapacian = zeros(size(l));

for i =6:517
    for j =6:517
       if(l(i,j) == 1 && (l(i+1,j) == -1 || l(i,j+1)==-1 || l(i-1,j)==-1 || l(i,j-1)==-1 || l(i+1,j+1) == -1 || l(i-1,j+1)==-1 || l(i-1,j-1)==-1 || l(i+1,j-1)==-1))
            lapacian(i,j) = 0;
       else
           lapacian(i,j) = 255;
       end
    end
end

lapacian = lapacian(6:517,6:517);

imshow(lapacian)

%% difference of gaussian

%get g
mask = [-1,-3,-4,-6,-7,-8,-7,-6,-4,-3,-1;
        -3,-5,-8,-11,-13,-13,-13,-11,-8,-5,-3;
        -4,-8,-12,-16,-17,-17,-17,-16,-12,-8,-4;
        -6,-11,-16,-16,0,15,0,-16,-16,-11,-6;
        -7,-13,-17,0,85,160,85,0,-17,-13,-7;
        -8,-13,-17,15,160,283,160,15,-17,-13,-8;
        -7,-13,-17,0,85,160,85,0,-17,-13,-7;
        -6,-11,-16,-16,0,15,0,-16,-16,-11,-6;
        -4,-8,-12,-16,-17,-17,-17,-16,-12,-8,-4;
        -3,-5,-8,-11,-13,-13,-13,-11,-8,-5,-3;
        -1,-3,-4,-6,-7,-8,-7,-6,-4,-3,-1;];
g = conv(Im, mask);

%compute zero crossing image
for i =1:512
    for j =1:512
       if g(i,j) >= 3     %threshold
           g(i,j) = 1;
       elseif g(i,j) <= -3
           g(i,j) =-1;
       else
           g(i,j) = 0;
       end
    end
end

%compute output
g = padarray(g, [floor(11/2) floor(11/2)], 'replicate');
gaussian = zeros(size(g));

for i =6:517
    for j =6:517
       if(g(i,j) == 1 && (g(i+1,j) == -1 || g(i,j+1)==-1 || g(i-1,j)==-1 || g(i,j-1)==-1 || g(i+1,j+1) == -1 || g(i-1,j+1)==-1 || g(i-1,j-1)==-1 || g(i+1,j-1)==-1))
            gaussian(i,j) = 0;
       else
           gaussian(i,j) = 255;
       end
    end
end

gaussian = gaussian(6:517,6:517);

imshow(gaussian)




