clc;
clear all;
close all;

% Subdivision 1.7
imgLena = imread('../images/lena-grey.bmp');
imgLenaPadded = zeros(size(imgLena,1)*2, size(imgLena,2)*2);
imgLenaPadded(1:size(imgLena,1), 1:size(imgLena,2)) = imgLena;
figure
imshow(imgLenaPadded, [])
title('Lena image with zero padding')

% Vertical sobel filter
sobelVertFilter = [-1 0 1; -2 0 2; -1 0 1];
sobelVertFilterPadded = zeros(size(imgLenaPadded,1), size(imgLenaPadded,2));
sobelVertFilterPadded(floor(size(sobelVertFilterPadded,1)/2)-1:(floor(size(sobelVertFilterPadded,1)/2)+size(sobelVertFilter,1))-2, floor(size(sobelVertFilterPadded,2)/2)-1:floor((size(sobelVertFilterPadded,2)/2)+size(sobelVertFilter,2))-2) = sobelVertFilter;
figure
imshow(sobelVertFilterPadded, [])
title('Vertical sobel filter centered and zero padded')

% Taking transform of image and filter
imgFreq = fftshift(fft2(imgLenaPadded));
filterFreq = fftshift(fft2(sobelVertFilterPadded));

figure('units','normalized','outerposition',[0 0 1 1])
subplot(121); imagesc(log(1+abs(imgFreq))); colormap('gray'); title('Image Magnitude')
subplot(122); imagesc(angle(imgFreq)/pi*180); colormap('gray'); title('Image Phase')

figure('units','normalized','outerposition',[0 0 1 1])
subplot(121); imagesc(log(1+abs(filterFreq))); colormap('gray'); title('Filter magnitude')
subplot(122); imagesc(angle(filterFreq)/pi*180); colormap('gray'); title('Filter phase')

% Filtering the image by multiplying with the filter
imgFilteredFreq = imgFreq .* filterFreq;
figure('units','normalized','outerposition',[0 0 1 1])
subplot(121); imagesc(log(1+abs(imgFilteredFreq))); colormap('gray'); title('Filtered image magnitude')
subplot(122); imagesc(angle(imgFilteredFreq)/pi*180); colormap('gray'); title('Filtered image phase')

% Filtered image in spatial domain obtained by taking inverse fft
imgFilteredSpatial = uint8(ifftshift(ifft2(imgFilteredFreq)));
imgFilteredSpatial = imgFilteredSpatial(1:size(imgLena,1), 1:size(imgLena,1));
figure
imshow(real(imgFilteredSpatial));
title('Filtered image reconstructed')