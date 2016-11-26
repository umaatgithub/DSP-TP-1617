clc;
clear all;
close all;

% Subdivision 1.6

% The phase of the image contains most of the information which is very
% useful during reconstruction

imgLena = imread('../images/lena-grey.bmp');
imgFreq = fftshift(fft2(imgLena));
figure('units','normalized','outerposition',[0 0 1 1])
subplot(121); imagesc(log(1+abs(imgFreq))); colormap('gray'); title('Log of lena image magnitude')
subplot(122); imagesc(angle(imgFreq)/pi*180); colormap('gray'); title('Lena image phase')
figure
imshow(imgLena)
title('Original lena image')

imgLenaReconstructedMagnitude = uint8(ifft2(abs(imgFreq)));
figure
imshow(real(imgLenaReconstructedMagnitude), []);
title('Image reconstructed using magnitude')

imgLenaReconstructedPhase = uint8(ifft2(255*exp(i*angle(imgFreq))));
figure
imshow(real(imgLenaReconstructedPhase), []);
title('Image reconstructed using phase')
