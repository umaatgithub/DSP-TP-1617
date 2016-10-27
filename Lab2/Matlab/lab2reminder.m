f = 1;
t = 0:0.01:2;

x = sin(2*pi*f*t);
figure
subplot(1, 2, 1)
plot(t, x)
xlabel('t')
ylabel('sin(2*pi*f*t)')
title('SINUSOIDAL FUNCTION (f=1, N=2)')

% f=10, Period=1, Sampling freq=100
% 10 samples in 1 time period
subplot(1, 2, 2)
Sinus(1, 2, 20)
title('SINUSOIDAL FUNCTION (f=1, N=2, Fs=20)')