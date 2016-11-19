clc;
clear all;
close all;

% Subdivision 1.1
% FFT of sine signal
f = 5; fs = 50;
t = 0: 1/fs : 1;
xn = sin(2 * pi * f * t);
N = length(xn);
fr = (-N/2 : N/2-1)* fs/N;
xf = fftshift(fft(xn));
figure
subplot(221); plot(t, xn); title('Sine signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(fr, abs(xf)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(fr, real(xf)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(fr, imag(xf)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');

% Subdivision 1.2
% FFT of cosine signal
% The phase of cosine wave is different from sine wave which can be
% observed from the imaginary component of the FFT plotted
f = 5; fs = 50;
t = 0: 1/fs : 1;
xn = cos(2 * pi * f * t);
N = length(xn);
fr = (-N/2 :N/2-1)* fs/N;
xf = fftshift(fft(xn));
figure
subplot(221); plot(t, xn); title('Cosine signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(fr, abs(xf)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(fr, real(xf)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(fr, imag(xf)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');


% Subdivision 1.3
% FFT of square signal
f = 5; fs = 50;
t = 0: 1/fs : 1;
xn = square(2 * pi * f * t);
N = length(xn);
fr = (-N/2 : N/2-1)* fs/N;
xf = fftshift(fft(xn));
figure
subplot(221); plot(t, xn); title('Square signal'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(fr, abs(xf)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(fr, real(xf)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(fr, imag(xf)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');


% Subdivision 1.4
% FFT of gaussian nosie
% The FFT of a gaussian noise is again a gaussian
N = 10000;
xn = wgn(N, 1, 0);
t = 1:N;
fr = (-N/2 : N/2-1)* fs/N;
xf = fftshift(fft(xn));
figure
subplot(221); plot(t, xn); title('Gaussian noise'); xlabel('Time(sec)'); ylabel('Amplitude');
subplot(222); plot(fr, abs(xf)); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
subplot(223); plot(fr, real(xf)); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
subplot(224); plot(fr, imag(xf)); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');
