clc;
clear all;
close all;

% Subdivision 1.4
% Image with many blocks
Im=0;
N=64;
T=1;
Ts=T/N;
Fs=1/Ts;
df=Fs/N;
Im(N/8:N/4,N/4+1:N/2)=1;
Im(1:N/4,N/2+1:N)=Im;
Im(N/4+1:N/2,:) = Im;
Im(N/2+1:3*N/4,:) = Im(1:N/4,:);
Im(3*N/4+1:N,:) = Im(1:N/4,:);

imgFreq = fftshift(fft2(Im));
figure('units','normalized','outerposition',[0 0 1 1])
subplot(221); imshow(Im); title('Image with many blocks')
subplot(223); imagesc(abs(imgFreq)); colormap('gray'); title('Magnitude')
subplot(224); imagesc(angle(imgFreq)/pi*180); colormap('gray'); title('Phase')

% The central frequency is equal to half of the mean of all the frequencies

