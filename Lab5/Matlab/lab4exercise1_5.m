clc;
clear all;
close all;

% Subdivision 1.5
img = zeros(301,301);
img(100:200, 140:160) = 255;
imgFreq = fftshift(fft2(img));
figure('units','normalized','outerposition',[0 0 1 1])
subplot(221); imshow(img); title('Image')
subplot(222); imagesc(abs(imgFreq)); colormap('gray'); title('Magnitude')
% Row vector along the center(We consider the middle because we have shifted the fft)
subplot(223); stem(abs(imgFreq(:,floor(size(imgFreq,2)/2)))); title('|If (u,0)|')
% Column vector along the center(We consider the middle because we have shifted the fft)
subplot(224); stem(abs(imgFreq(floor(size(imgFreq,1)/2),:))); title('|If (0,v)|')
