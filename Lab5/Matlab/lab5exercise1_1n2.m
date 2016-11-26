clc;
clear all;
close all;

% Subdivision 1.1
img = zeros(301,301);
img(100:200, 140:160) = 255;

% Subdivision 1.2
imgFreq = fftshift(fft2(img));
figure('units','normalized','outerposition',[0 0 1 1])
subplot(221); imshow(img); title('Image')
subplot(223); imagesc(abs(imgFreq)); colormap('gray'); title('Magnitude')
subplot(224); imagesc(angle(imgFreq)/pi*180); colormap('gray'); title('Phase')
