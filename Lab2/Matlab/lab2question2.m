% SUBDIVISION 2.1

clc;
clear all;
close all;

x1 = Step(10, 4);
y1 = accumulator(x1);

figure
subplot(1, 2, 1)
stem(x1);
xlabel('k')
ylabel('Step[k-4]')
title('STEP FUNCTION')

subplot(1, 2, 2)
stem(y1);
xlabel('k')
ylabel('y1[k]')
title('ACCUMULATED STEP FUNCTION')

% The accumulator/integrator is considered to be unstable in both general 
% and bounded sense because it is observed from the graph that the output 
% constantly increase as k increases.
disp('2.1 The accumulator/integrator is considered to be unstable in both general and bounded sense because it is observed from the graph that the output constantly increase as k increases.')

% SUBDIVISION 2.2
x2 = Dirac(10, 1);
y2 = accumulator(x2);

figure
stem(y2);
xlabel('k')
ylabel('y2[k]')
title('IMPULSE RESPONSE OF ACCUMULATOR')

% Impulse response of the accumulator is a step function. It does not
% converge to 0 and hence unstable.
disp('2.2 Impulse response of the accumulator is a step function. It does not converge to 0 and hence unstable.')


% SUBDIVISION 2.3
x3 = Dirac(10, 1);
y3(1) = x3(1);
for i = 2:size(x3, 2)
    y3(i) = x3(i) + 2*y3(i-1);
end
figure
stem(y3);
xlabel('k')
ylabel('y3[k]')
title('IMPULSE RESPONSE OF x[k] + 2*y[k-1]')

% The system is unstable because the impulse response diverges as k tends to infinity.
disp('2.3 The system is unstable because the impulse response diverges as k tends to infinity.')


% SUBDIVISION 2.4
x4 = Dirac(10, 1);
y4(1) = x4(1);
for i = 2:size(x4, 2)
    y4(i) = x4(i) + y4(i-1)/3;
end
figure
stem(y4);
xlabel('k')
ylabel('y4[k]')
title('IMPULSE RESPONSE OF x[k] + y[k-1]/3')

% The system is stable because the impulse response converges to 0 as k tends to infinity.
disp('2.4 The system is stable because the impulse response converges to 0 as k tends to infinity.')
