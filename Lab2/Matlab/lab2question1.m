clc;
clear all;
close all;

% SUBDIVISION 1.1

% Input step signal
x = Step(10, 4);
figure
subplot(1, 2, 1)
stem(x);       
xlabel('k')
ylabel('Step[k-4]')
title('INPUT STEP FUNCTION')

% Output signal
y1 = zeros(1,9);
for k = 1:9
    y1(k) = (x(k) + x(k+1))/2;
end

% Plotting output signal
subplot(1, 2, 2)
stem(y1)
xlabel('k')
ylabel('y1[k]')
title('OUTPUT FUNCTION - (x[k] + x[k+1]) /2')

% For causal systems the ouput signal remains 0 until there is any change
% in the input signal. But it is observed from the graphs that at k=4 the
% output signal is greater than 0 when the input signal is still at 0.
% Hence the system is not causal.
disp('1.1 For causal systems the ouput signal remains 0 until there is any change in the input signal. But it is observed from the graphs that at k=4 the output signal is greater than 0 when the input signal is still at 0. Hence the system is not causal.')


% SUBDIVISION 1.2

% Output function
y2 = zeros(1,9);
for k = 2:10
    y2(k) = (x(k) + x(k-1))/2;
end

% Plotting output function
figure
subplot(1, 2, 1)
stem(x);       
xlabel('k')
ylabel('Step[k-4]')
title('INPUT STEP FUNCTION')

subplot(1, 2, 2)
stem(y2)
xlabel('k')
ylabel('y2[k]')
title('PROPOSED OUTPUT FUNCTION - (x[k] + x[k-1]) /2')

% Inorder to make the system causal the output signal should depend on past
% and present inputs and not future inputs. The newly proposed system is
% the shifted signal y[k] = (x[k] + x[k-1]) /2
disp('1.2 Inorder to make the system causal the output signal should depend on past and present inputs and not future inputs. The newly proposed system is the shifted signal y[k] = (x[k] + x[k-1]) /2')
