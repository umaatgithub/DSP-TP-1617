clc;
clear all;
close all;

% Subdivision 2.1
x = Dirac(40, 20);
figure('units','normalized','outerposition',[0 0 1 1])
subplot(2,2,1)
stem(x);
title('DIRAC FUNCTION')

% Subdivision 2.2
% Applying an anticausal smoothing filter smoothens along the left of the
% signal whereas applying a causal filter smoothens along the right side of
% the signal
s = 0.8;
Ts = 1;
alpha = s * Ts; 
a = exp(-alpha);
y_anticausal = zeros(1, size(x,2)) ;
for k = size(x,2)-2 : -1 : 1
    y_anticausal(k) =  a*(alpha+1)*x(k+1) - (a^2)*x(k+2) + 2*a*y_anticausal(k+1) - (a^2)*y_anticausal(k+2) ;
end

subplot(2,2,3)
stem(y_anticausal)
title('SMOOTHING WITH ANTICAUSAL FILTER')

y_causal = zeros(1, size(x,2)) ;
for k = 3 : size(x,2)
    y_causal(k) =  x(k) + a*(alpha-1)*x(k-1) + 2*a*y_causal(k-1) - (a^2)*y_causal(k-2) ;
end

subplot(2,2,4)
stem(y_causal)
title('SMOOTHING WITH CAUSAL FILTER')

y = y_anticausal + y_causal;
subplot(2,2,2)
stem(y)
title('FILTERED SIGNAL')


% Subdivision 2.3
x = Step(40, 10) - Step(40, 30);
figure('units','normalized','outerposition',[0 0 1 1])
subplot(2,2,1)
stem(x);
title('BOX FUNCTION')

% Subdivision 2.2
% Applying an anticausal derivative filter finds the derivate from left to
% right whereas applying a causal derivative filter finds the derivative
% from right to left. It is also observed that the output remains in the
% previous state when the signal is constant until the next change in
% signal is encountered.
y_anticausal = zeros(1, size(x,2)) ;
for k =  size(x,2)-2 : -1 : 1
    y_anticausal(k) = s*alpha*a*x(k+1) + 2*a*y_anticausal(k+1) - (a^2)*y_anticausal(k+2) ;
end

subplot(2,2,3)
stem(y_anticausal)
title('DERIVATIVE WITH ANTICAUSAL FILTER')

y_causal = zeros(1, size(x,2)) ;
for k = 3 : size(x,2)
    y_causal(k) =  -s*alpha*a*x(k-1) + 2*a*y_causal(k-1) - (a^2)*y_causal(k-2) ;
end

subplot(2,2,4)
stem(y_causal)
title('DERIVATIVE WITH CAUSAL FILTER')

y = y_anticausal + y_causal;
subplot(2,2,2)
stem(y)
title('DERIVATIVE FILTERED SIGNAL')
