clc;
clear all;
close all;

% Subdivision 1.1

% The function is implemented in convFn.m file with additional parameter
% for 'zero', 'symmetry', 'periodic' and 'constant' padding. The function
% assumes that the (length of 'h') is not more than (length of 'x'+1) for 
% 'symmetry', 'periodic' and 'constant' padding.

% -------------------------------------------------------------------------

% Subdivision 1.2
x = [1 2 3 4];
figure('units','normalized','outerposition',[0 0 1 1])
% The results are shown in the graph and the comparison with the inbuilt
% function are displayed in the output window.

% Dirac function
h = Dirac(5, 1);
y_dirac_convFn = convFn(x, h, 'zero')
y_dirac_conv = conv(x,h)
subplot(2, 2, 1)
stem(y_dirac_convFn);
title('CONVOLUTION WITH DIRAC FUNCTION')

% Step function
h = Step(5, 1);
y_step_convFn = convFn(x, h, 'zero')
y_step_conv = conv(x,h)
subplot(2, 2, 2)
stem(y_step_convFn);
title('CONVOLUTION WITH STEP FUNCTION')

% Exponential function
h = Exponential(5, 1);
y_exponential_convFn = convFn(x, h, 'zero')
y_exponential_conv = conv(x,h)
subplot(2, 2, 3)
stem(y_exponential_convFn);
title('CONVOLUTION WITH EXPONENTIAL FUNCTION')

% Derivative function
h = [-1 1];
y_derivative_convFn = convFn(x, h, 'zero')
y_derivative_conv = conv(x,h)
subplot(2, 2, 4)
stem(y_derivative_convFn);
title('CONVOLUTION WITH DERIVATIVE FUNCTION')

% -------------------------------------------------------------------------

%Subdivision 1.3

h = Dirac(5, 1);
figure('units','normalized','outerposition',[0 0 1 1])

% When the function is convoluted with dirac function:
% Padding 'symmetry' -> Convolution result is symmetric
% Padding 'periodic' -> Convolution result is periodic
% Padding 'constant' -> The final value is repeated for the padded results

%Zero padding
y = convFn(x, h, 'zero');
subplot(2, 2, 1)
stem(y);
title('CONVOLUTION WITH ZERO PADDING')

% Symmetry padding
y = convFn(x, h, 'symmetry');
subplot(2, 2, 2)
stem(y);
title('CONVOLUTION WITH SYMMETRY PADDING')

% Periodic padding
y = convFn(x, h, 'periodic');
subplot(2, 2, 3)
stem(y);
title('CONVOLUTION WITH PERIODIC PADDING')

% Constant padding
y = convFn(x, h, 'constant');
subplot(2, 2, 4)
stem(y);
title('CONVOLUTION WITH CONSTANT PADDING')