clear;

%input
I1 = imread('aloe.jpg');
%I2 = imread('church.jpg');
%I3 = imread('house.jpg');
%I4 = imread('kitchen.jpg');

%Original
subplot(1,4,1);
image(I1);

%rgb
O = I1;

OR = he(O(:,:,1));
OG = he(O(:,:,2));
OB = he(O(:,:,3));

O(:,:,1) = OR;
O(:,:,2) = OG;
O(:,:,3) = OB;

subplot(1,4,2);
image(O);

%hsv
O1 = rgbtohsv(I1);

O1S = histeq(O1(:,:,2));
O1V = histeq(O1(:,:,3));

O1(:,:,2) = O1S;
O1(:,:,3) = O1V;

O1 = hsvtorgb(O1);
subplot(1,4,3);
image(O1);

%lab
O2 = rgbtolab(I1);

max_luminosity = 100;
L = O2(:,:,1)/max_luminosity;
shadow_imadjust = O2;
shadow_imadjust(:,:,1) = imadjust(L)*max_luminosity;
O2 = labtorgb(shadow_imadjust);
subplot(1,4,4);
image(O2);
