function out = hsvtorgb(I)

% Determine if input is a 3-D array
threeD = (ndims(I)==3); 
if threeD
    h = I(:,:,1); s = I(:,:,2); v = I(:,:,3);
end    

%convert
h = 6.*h;
k = floor(h);
p = h-k;
t = 1-s;
n = 1-s.*p;
p = 1-(s.*(1-p));
 
% 把k拆開來做避免儲存上的錯誤
kc = (k==0 | k==6);
r = kc;
g = kc.*p;
b = kc.*t;
 
kc = (k==1);
r = r + kc.*n;
g = g + kc;
b = b + kc.*t;
 
kc = (k==2);
r = r + kc.*t;
g = g + kc;
b = b + kc.*p;
 
kc = (k==3);
r = r + kc.*t;
g = g + kc.*n;
b = b + kc;
 
kc = (k==4);
r = r + kc.*p;
g = g + kc.*t;
b = b + kc;
 
kc = (k==5);
r = r + kc;
g = g + kc.*t;
b = b + kc.*n;

%combine r,g,b
out = cat(3,r,g,b);
out = bsxfun(@times, v./max(out(:)), out);
end