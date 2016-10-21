%Question 1

close all;
clear all;
clc;

% Subdivision 1.1
figure
Dirac(20, 10)

% Subdivision 1.2
figure
Step(20, 10)

% Subdivision 1.3
figure
Ramp(20, 10, 2)

% Subdivision 1.4
figure
Geo(20, 10, 2)

% Subdivision 1.5
figure
Box(20, 10, 3)

% Subdivision 1.6
% Number of samples in a time period is given by the sampling frequency
% divided by the frequency of the  signal
figure
% f=10, Period=1, Sampling freq=100
% 10 samples in 1 time period
Sinus(10, 1, 100)
title('SINUSOIDAL FUNCTION (f=10, N=1, Fs=100)')

figure
% f=10, Period=2, Sampling freq=1000
% 200 samples for 2 time period
Sinus(10, 2, 1000)
title('SINUSOIDAL FUNCTION (f=10, N=2, Fs=1000)')

figure
% f=10, Period=2, Sampling freq=30
% 6 samples for 2 time period
Sinus(10, 2, 30)
title('SINUSOIDAL FUNCTION (f=10, N=2, Fs=30)')


