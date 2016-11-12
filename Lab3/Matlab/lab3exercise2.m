clc;
close all;
clear all;

% Subdivision 1.1
% The function is implemented in convFn2D.m file.

% -------------------------------------------------------------------------

% Subdivision 2.2
lena_original = imread('../images/lena-grey.bmp');

% Defining Gaussian kernel
K = [1   4   6   4  1;
     4  16  24  16  4;
     6  24  36  24  6;
     4  16  24  16  4;
     1   4   6   4  1];
K = 1/256 * K;

% Applying convolution with Gaussian which gives the smoothened image
lena_conv = convFn2D(lena_original, K);

% Display the original image and smoothened image
figure('units','normalized','outerposition',[0 0 1 1])
subplot(1,2,1)
imshow(lena_original);
title('ORIGINAL LENA IMAGE')

subplot(1,2,2)
imshow(lena_conv, []);
title('SMOOTHENED WITH GAUSSIAN FILTER')

% -------------------------------------------------------------------------

% Subdivision 2.3
% Sobel filter is used for edge detection and the filter gradients are
% defined as below
Sx = [-1 0 1; -2 0 2; -1 0 1];
Sy = Sx';

% Applying convolution with sobel filter
lena_sobelx = convFn2D(lena_original, Sx);
lena_sobely = convFn2D(lena_original, Sy);
lena_sobel = sqrt(lena_sobelx .^2 + lena_sobely .^2);

% Display the original image and filtered image
figure('units','normalized','outerposition',[0 0 1 1])
subplot(2,2,1)
imshow(lena_original);
title('ORIGINAL LENA IMAGE')

subplot(2,2,2)
imshow(lena_sobel, []);
title('SOBEL MAGNITUDE')

subplot(2,2,3)
imshow(lena_sobelx, []);
title('SOBEL X GRADIENT')

subplot(2,2,4)
imshow(lena_sobely, []);
title('SOBEL Y GRADIENT')
