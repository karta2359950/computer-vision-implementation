
function out = rgbtohsv(I)

%Âà´«input
I = double(I) / 255; 

% Determine if input is a 3-D array  
threeD = (ndims(I)==3); 
 
if threeD
  r = I(:,:,1); g = I(:,:,2); b = I(:,:,3);
  siz = size(r);
end
  
%convert 
v = max(max(r,g),b);
h = zeros(size(v));
s = (v - min(min(r,g),b));
 
z = ~s;
s = s + z;
k = find(r == v);
h(k) = (g(k) - b(k))./s(k);
k = find(g == v);
h(k) = 2 + (b(k) - r(k))./s(k);
k = find(b == v);
h(k) = 4 + (r(k) - g(k))./s(k);
h = h/6;
k = find(h < 0);
h(k) = h(k) + 1;
h=(~z).*h;
 
k = find(v);
s(k) = (~z(k)).*s(k)./v(k);
s(~v) = 0;
 
%out
h = reshape(h,siz);
s = reshape(s,siz);
v = reshape(v,siz);
out=cat(3,h,s,v);

end