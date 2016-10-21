%QUESTION 2

close all;
clear all;
clc;

% Subdivision 2.1
N1000 = randn(1000,1);
figure
% 'histfit' function fits a theoritical Gaussian curve to the histogram.
% It is similar to calculating Gaussian using the formula
histfit(N1000);
title('Normal Distribution 1000 samples')

N10000 = randn(10000,1);
figure
histfit(N10000);
title('Normal Distribution 10000 samples')

% When the number of samples are increased the experimental results gets closer to theoritical curve.
disp('2.1 When the number of samples are increased the experimental results gets closer to theoritical curve.')

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

%Subdivision 2.2
U1000 = rand(1000,1);
figure
hist(U1000);
title('Uniform Distribution 1000 samples')

U10000 = rand(10000,1);
figure
hist(U10000);
title('Uniform Distribution 10000 samples')

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% Subdivision 2.3
figure
autocorrN1000 = xcorr(N1000);
plot(autocorrN1000)
title('Autocorrelation of normal distribution 1000 samples')

figure
autocorrN10000 = xcorr(N10000);
plot(autocorrN10000)
title('Autocorrelation of normal distribution 10000 samples')

figure
autocorrU1000 = xcorr(U1000);
plot(autocorrU1000)
title('Autocorrelation of uniform distribution 1000 samples')

figure
autocorrU10000 = xcorr(U10000);
plot(autocorrU10000)
title('Autocorrelation of uniform distribution 10000 samples')

% White noise tend to have equal intensity at different frequencies.
% From the autocorrelation graphs plotted it is evident that Gaussian 
% distribution have same intensity and so considered as white noise.
disp('2.3 White noise tend to have equal intensity at different frequencies. From the autocorrelation graphs plotted it is evident that Gaussian distribution have same intensity and so considered as white noise.')

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% Subdivision 2.4
s1 = round(rand(1, 50));
figure
stem(s1);
title('s1 signal');
s2 = round(rand(1, 50));
figure
stem(s2);
title('s2 signal');
s3 = round(rand(1, 50));
figure
stem(s3);
title('s3 signal');

s = zeros(1, 250);
% Values of s1 are copied to 1 to 50 elements of s
s(1:50) = s1(:);
% Values of s1 are copied to 101 to 150 elements of s
s(101:150) = s2(:);
% Values of s1 are copied to 201 to 250 elements of s
s(201:250) = s3(:);
figure
stem(s);
title('s signal');
figure
plot(xcorr(s, s1));
title('Cross-correlation of signals s and s1')
figure
plot(xcorr(s, s2));
title('Cross-correlation of signals s and s2')
figure
plot(xcorr(s, s3));
title('Cross-correlation of signals s and s3')
% The peaks of the cross-correlation for the signals are observed at 250, 350 and
% 450 for signals s1, s2 and s3 respectively when the signals completely
% overlap each other.
disp('2.4 The highest peak of the cross-correlation for the signals are observed at 250, 350 and 450 for signals s1, s2 and s3 respectively when the signals completely overlap with s.')

