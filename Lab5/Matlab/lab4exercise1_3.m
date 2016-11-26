clc;
clear all;
close all;

% Subdivision 1.3
% Original image with single block
img = zeros(301,301);
img(100:200, 140:160) = 255;
imgFreq = fftshift(fft2(img));
figure('units','normalized','outerposition',[0 0 1 1])
subplot(221); imshow(img); title('Original image')
subplot(223); imagesc(abs(imgFreq)); colormap('gray'); title('Magnitude')
subplot(224); imagesc(angle(imgFreq)/pi*180); colormap('gray'); title('Phase')

% Block translated image
% There is no change in magnitude when the block is translated but the
% phase is shifted.
imgTrans = zeros(301,301);
imgTrans(150:250, 160:180) = 255;
imgFreq = fftshift(fft2(imgTrans));
figure('units','normalized','outerposition',[0 0 1 1])
subplot(221); imshow(imgTrans); title('Block translated image')
subplot(223); imagesc(abs(imgFreq)); colormap('gray'); title('Magnitude')
subplot(224); imagesc(angle(imgFreq)/pi*180); colormap('gray'); title('Phase')

% Block rotated image
% When the block is rotated the magnitude is also rotated
imgRot = imrotate(img, 45);
imgFreq = fftshift(fft2(imgRot));
figure('units','normalized','outerposition',[0 0 1 1])
subplot(221); imshow(imgRot); title('Block rotated image')
subplot(223); imagesc(abs(imgFreq)); colormap('gray'); title('Magnitude')
subplot(224); imagesc(angle(imgFreq)/pi*180); colormap('gray'); title('Phase')

% 2 blocks image
% When the number of blocks are increased the magnitude is shrunk and phase
% also changes
img2 = zeros(301,301);
img2(20:120, 140:160) = 255;
img2(180:280, 140:160) = 255;
imgFreq = fftshift(fft2(img2));
figure('units','normalized','outerposition',[0 0 1 1])
subplot(221); imshow(img2); title('2 blocks image')
subplot(223); imagesc(abs(imgFreq)); colormap('gray'); title('Magnitude')
subplot(224); imagesc(angle(imgFreq)/pi*180); colormap('gray'); title('Phase')

% Block size shrunk horizontally
% When the block size is shrunk horizontally then the magnitude is extended
% horizantally whereas the phase shift is decreased
img3 = zeros(301,301);
img3(100:200, 145:155) = 255;
imgFreq = fftshift(fft2(img3));
figure('units','normalized','outerposition',[0 0 1 1])
subplot(221); imshow(img3); title('Block size shrunk image')
subplot(223); imagesc(abs(imgFreq)); colormap('gray'); title('Magnitude')
subplot(224); imagesc(angle(imgFreq)/pi*180); colormap('gray'); title('Phase')

