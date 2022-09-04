function out = he(I)

%read image
I = double(I);
[m,n] = size(I);

% �p��1-256��pdf 
pdf = zeros(1,256);
for i = 1:m
    for j = 1:n
        for k = 1:256
            if I(i,j) == (k-1)%�p�G�ۦP�ӭ�+1
                pdf(k) = pdf(k) + 1;
            end
        end
    end
end

%cdf
cdf = cumsum(pdf);

%�Ƕ����ഫ
trans = zeros(1,256);
for i = 1:256
    trans(i) = floor(((cdf(i) - min(cdf(cdf>0)))/(max(cdf) - min(cdf(cdf>0))))*255 + 0.5);
end

%output img
output = zeros(m,n);
for i = 1:m
    for j = 1:n
        output(i,j) = trans(I(i,j) + 1);
    end
end

out = output;

end
