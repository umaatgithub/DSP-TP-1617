clc;
clear all;
close all;

% SUBDIVISION 3.1
x_a = [0 0 0 0 1 2 3 4 5 0 0 0 0 0 0 0 0 0 0];
x_b = [0 0 0 0 0 0 0 0 0 4 3 2 1 0 0 0 0 0 0];

y_a(1) = (- 2*x_a(1)) + x_a(2);
y_b(1) = (- 2*x_b(1)) + x_b(2);
for k = 2:size(x_a,2)-1
    y_a(k) = 3*x_a(k-1) - 2*x_a(k) + x_a(k+1);
    y_b(k) = 3*x_b(k-1) - 2*x_b(k) + x_b(k+1);
end
y_a(size(x_a,2)) = 3*x_a(size(x_a,2)-1) - 2*x_a(size(x_a,2));
y_b(size(x_b,2)) = 3*x_b(size(x_b,2)-1) - 2*x_b(size(x_b,2));

figure
subplot(1, 2, 1)
stem(x_a);
xlabel('k')
ylabel('x_a')
title('x_a')

subplot(1, 2, 2)
stem(y_a);
xlabel('k')
ylabel('y_a')
title('y_a')

figure
subplot(1, 2, 1)
stem(x_b);
xlabel('k')
ylabel('x_b')
title('x_b')

subplot(1, 2, 2)
stem(y_b);
xlabel('k')
ylabel('y_b')
title('y_b')


% SUBDIVISION 3.2
disp('3.2')
% A system is LINEAR if it exhibits superposition property. y_a is the
% ouput of x_a and if y_b is the output of x_b. If the new input x is a 
% weighted sum of x_a and x_b the the new output should be equal to the 
% weighted sum of y_a and y_b with the same weights as the input.
disp('A system is LINEAR if it exhibits superposition property. y_a is the ouput of x_a and if y_b is the output of x_b. If the new input x is a weighted sum of x_a and x_b the the new output should be equal to the weighted sum of y_a and y_b with the same weights as the input.')

% A system is TIME INVARIANT if the input of the system is shifted by T 
% then the output is also shifted by T.
disp('A system is TIME INVARIANT if the input of the system is shifted by T then the output is also shifted by T.')

% The inputs are scaled by 2 and 3 and shifted by 4.
x_a_scaled_shifted = x_a(5:end) * 2;
x_b_scaled_shifted = x_b(5:end) * 3;
x = x_a_scaled_shifted + x_b_scaled_shifted;

y_a_scaled_shifted = y_a(5:end) * 2;
y_b_scaled_shifted = y_b(5:end) * 3;
y = y_a_scaled_shifted + y_b_scaled_shifted;

% Calculating new output of the scaled and shifted signal
y_new(1) = (- 2*x(1)) + x(2);
for k = 2:size(x,2)-1
    y_new(k) = 3*x(k-1) - 2*x(k) + x(k+1);
end
y_new(size(x,2)) = 3*x(size(x,2)-1) - 2*x(size(x,2));

figure
subplot(1, 2, 1)
stem(y);
xlabel('k')
ylabel('y')
title('2*y_a[k-4] + 3*y_b[k-4]')

subplot(1, 2, 2)
stem(y_new);
xlabel('k')
ylabel('y')
title('Response of 2*x_a[k-4] + 3*x_b[k-4]')

% It is observed from the graphs that when the inputs are scaled by 2 and 3
% and shifted by 4 the output is also scaled and shifted by the same factors
% and this proves that the system is linear and time invariant(LTI).
disp('It is observed from the graphs that when the inputs are scaled by 2 and 3 and shifted by 4 the output is also scaled and shifted by the same factors and this proves that the system is linear and time invariant(LTI).')


% SUBDIVISION 3.3
% y[k] = x[k^2] + 1 is both non linear and time variant system. Addition of
% '1' makes the system non linear and squarring 'k' makes the system time
% variant.
disp(' ')
disp('3.3')
disp('y[k] = x[k^2] + 1 is both non linear and time variant system. Addition of 1 makes the system non linear and squarring k makes the system time variant.')
