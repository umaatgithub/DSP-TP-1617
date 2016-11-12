clc;
clear all;
close all;

% Subdivision 3.1

% Read 'a' image and convert to binary image by otsu thresholding
a_img = imread('../images/a.png');
a_bw = im2bw( a_img, graythresh(a_img));

% Read 'text' image and convert to binary image by otsu thresholding
text_img = imread('../images/text.png');
text_bw = im2bw( text_img, graythresh(text_img));

% Display the original images and binary images
figure
subplot(1,2,1)
imshow(a_img);
title('"a" IMAGE')

subplot(1,2,2)
imshow(a_bw);
title('"a" BINARY IMAGE')

figure
subplot(1,2,1)
imshow(text_img)
title('"text" IMAGE')

subplot(1,2,2)
imshow(text_bw)
title('"text" BINARY IMAGE')

% -------------------------------------------------------------------------

% Subdivision 3.2

% 2D cross correlation
C = xcorr2(1*text_bw, 1*a_bw);

figure
imshow(C, []);
title('CROSS CORRELATION "text" and "a"')

% -------------------------------------------------------------------------

% Subdivision 3.3
% Finding indexes having maximum value
CrossCorrelationMaxValue = max(max(C))
index = find(C > 90);

% Mask containing the points with high cross correlation values
mask = zeros(size(text_bw));
mask(index) = 1;

figure
imshow(mask)
title('POINTS WITH HIGH CROSS CORRELATION')



