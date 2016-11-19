clc;
clear all;
close all;

% Subdivision 2.1
% Generating the signal given and plotting
f1 = 5; f2 = 20; 
f = 1000;
n = 0 : 1/f :1;
xn = 3*cos(2*pi*(f1)*n) + 4*sin(2*pi*(f2)*n);
figure
plot(n, xn)
title('Original signal')


% Subdivision 2.2
% Plotting x[n] for different sampling frequencies
f1 = 5; f2 = 20; 
f = [10 20 25 40 50 100 150];

for i = 1: size(f,2)
    fs = f(i);
    n = 0 : 1/fs :1;
    xn = 3*cos(2*pi*(f1)*n) + 4*sin(2*pi*(f2)*n);
    figure
    stem(n, xn)
    title(['Sampled signal with sampling frequency ', num2str(fs)])
end


% Subdivision 2.3
% The original signal has 2 frequency components but as the sampling
% frequency is decreased the sampled signal losses its main frequency
% components. According to Shannon's theorem the sampling frequency should
% be atleast more than twice the highest frequecny component of the signal 
% so that the signal can be reconstructed properly.


%Subdivision 2.4
% The magnitude of FFT of the central frequencies decreases as the
% sampling frequency decreases and when it become much smaller than the
% actual signal's frequency the peak at the FFT's magnitude is completely lost.

f1 = 5; f2 = 20; 
f = [10 20 25 40 50 100 150];

for i = 1: size(f,2)
    fs = f(i);
    n = 0 : 1/fs :1;
    xn = 3*cos(2*pi*(f1)*n) + 4*sin(2*pi*(f2)*n);
    xf = fftshift(fft(xn));
    N = length(xn);
    fr = (-N/2 : N/2-1)* fs/N;
    figure
    subplot(221); plot(n, xn); title(['Sampled signal, fs=', num2str(fs)]); xlabel('Time(sec)'); ylabel('Amplitude');
    subplot(222); plot(fr, abs(xf)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
    subplot(223); plot(fr, real(xf)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
    subplot(224); plot(fr, imag(xf)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');
end



