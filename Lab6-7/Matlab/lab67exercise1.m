clc;
clear all;
close all;

%Subdivision 1.1
order = 3;
%Butterworth filters
[numeratorButter, denominatorButter] = butter(order, 0.5, 'low');
transferFunctionButter = tf(numeratorButter, denominatorButter)
[HButter,wButter] = freqz(numeratorButter,denominatorButter);
figure('units','normalized','outerposition',[0 0 1 1])
subplot(2,2,1)
plot(wButter, HButter);
xlabel('Radian frequency(rad/sec)');
ylabel('Filter');
title('Butterworth Low Pass Frequency Response');
%axis([min(wButter), max(wButter), min(HButter), 3]);

[numeratorButter, denominatorButter] = butter(order, 0.5, 'high');
transferFunctionButter = tf(numeratorButter, denominatorButter)
[HButter,wButter] = freqz(numeratorButter,denominatorButter);
subplot(2,2,2)
plot(wButter, abs(HButter));
xlabel('Radian frequency(rad/sec)');
ylabel('Filter');
title('Butterworth High Pass Frequency Response');

[numeratorButter, denominatorButter] = butter(order, [0.3 0.7], 'bandpass');
transferFunctionButter = tf(numeratorButter, denominatorButter)
[HButter,wButter] = freqz(numeratorButter,denominatorButter);
subplot(2,2,3)
plot(wButter, abs(HButter));
xlabel('Radian frequency(rad/sec)');
ylabel('Filter');
title('Butterworth Band Pass Frequency Response');

[numeratorButter, denominatorButter] = butter(order, [0.3 0.7], 'stop');
transferFunctionButter = tf(numeratorButter, denominatorButter)
[HButter,wButter] = freqz(numeratorButter,denominatorButter);
subplot(2,2,4)
plot(wButter, abs(HButter));
xlabel('Radian frequency(rad/sec)');
ylabel('Filter');
title('Butterworth Band Stop Frequency Response');


%Chebychev filters
[numeratorCheb, denominatorCheb] = cheby1(order, 0.5 , 0.5, 'low');
transferFunctionCheb = tf(numeratorCheb, denominatorCheb)
[HCheb,wCheb] = freqz(numeratorCheb,denominatorCheb);
figure('units','normalized','outerposition',[0 0 1 1])
subplot(2,2,1)
plot(wCheb, HCheb);
xlabel('Radian frequency(rad/sec)');
ylabel('Filter');
title('Chebychev Low Pass Frequency Response');

[numeratorCheb, denominatorCheb] = cheby1(order, 0.5 , 0.5, 'high');
transferFunctionCheb = tf(numeratorCheb, denominatorCheb)
[HCheb,wCheb] = freqz(numeratorCheb,denominatorCheb);
subplot(2,2,2)
plot(wCheb, HCheb);
xlabel('Radian frequency(rad/sec)');
ylabel('Filter');
title('Chebychev High Pass Frequency Response');

[numeratorCheb, denominatorCheb] = cheby1(order, 0.5 , [0.3 0.7], 'bandpass');
transferFunctionCheb = tf(numeratorCheb, denominatorCheb)
[HCheb,wCheb] = freqz(numeratorCheb,denominatorCheb);
subplot(2,2,3)
plot(wCheb, HCheb);
xlabel('Radian frequency(rad/sec)');
ylabel('Filter');
title('Chebychev Bandpass Pass Frequency Response');

[numeratorCheb, denominatorCheb] = cheby1(order, 0.5 , [0.3 0.7], 'stop');
transferFunctionCheb = tf(numeratorCheb, denominatorCheb)
[HCheb,wCheb] = freqz(numeratorCheb,denominatorCheb);
subplot(2,2,4)
plot(wCheb, HCheb);
xlabel('Radian frequency(rad/sec)');
ylabel('Filter');
title('Chebychev Band Stop Frequency Response');


%Subdivision 1.2
% It is observed that as the order increases the roll off rate increases
% thereby reducing the transition band. Also the ripples in the passband
% increases for higher order filters
order = [3 5 10 20];
figure('units','normalized','outerposition',[0 0 1 1])
for i=1:size(order, 2);
    [numeratorCheb, denominatorCheb] = cheby1(order(1,i), 1 , 0.5, 'low');  
    transferFunctionCheb = tf(numeratorCheb, denominatorCheb)
    [HCheb,wCheb] = freqz(numeratorCheb,denominatorCheb);

    subplot(2,2,i)
    plot(wCheb, HCheb);
    xlabel('Radian frequency(rad/sec)');
    ylabel('Filter');
    title(['Chebychev Low Pass order ' num2str(order(i))]);
end;