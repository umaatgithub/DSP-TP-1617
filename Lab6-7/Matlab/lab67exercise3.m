clc;
clear all;
close all;

barbara_im = imread('..\images\barbara.gif');
figure
imshow(barbara_im);
title('Original image')


% Horizontal gradient
im_horz_gradient = barbara_im;
im_horz_gradient_anticausal = barbara_im;
im_horz_gradient_causal = barbara_im;

s = 0.8;
Ts = 1;
alpha = s * Ts; 
a = exp(-alpha);
for i = 1:size(im_horz_gradient,2)
    x = im_horz_gradient(:,i);
    y_anticausal = zeros(size(x)) ;
    for k = size(x,1)-2 : -1 : 1
        y_anticausal(k) =  s*alpha*a*x(k+1) + 2*a*y_anticausal(k+1) - (a^2)*y_anticausal(k+2);
    end
    im_horz_gradient_anticausal(:,i) = y_anticausal;
end

for i = 1:size(im_horz_gradient,2)
    x = im_horz_gradient(:,i);
    y_causal = zeros(size(x)); 
    for k = 3 : size(x,1)
        y_causal(k) =  -s*alpha*a*x(k-1) + 2*a*y_causal(k-1) - (a^2)*y_causal(k-2) ;
    end
    im_horz_gradient_causal(:,i) = y_causal;
end

im_horz_gradient = im_horz_gradient_anticausal + im_horz_gradient_causal;

for i = 1:size(im_horz_gradient,1)
    x = im_horz_gradient(i,:);
    y_anticausal = zeros(size(x)) ;
    for k = size(x,2)-2 : -1 : 1
        y_anticausal(k) = a*(alpha+1)*x(k+1) - (a^2)*x(k+2) + 2*a*y_anticausal(k+1) - (a^2)*y_anticausal(k+2) ;
    end
    im_horz_gradient_anticausal(i,:) = y_anticausal;
end

for i = 1:size(im_horz_gradient,1)
    x = im_horz_gradient(i,:);
    y_causal = zeros(size(x)); 
    for k = 3 : size(x,2)
        y_causal(k) =  x(k) + a*(alpha-1)*x(k-1) + 2*a*y_causal(k-1) - (a^2)*y_causal(k-2) ;
    end
    im_horz_gradient_causal(i,:) = y_causal;
end

im_horz_gradient = im_horz_gradient_anticausal + im_horz_gradient_causal;

figure
imshow(im_horz_gradient)
title('Horizontal gradient')

% Vertical gradient

im_vert_gradient = barbara_im;
im_vert_gradient_anticausal = barbara_im;
im_vert_gradient_causal = barbara_im;

s = 0.8;
Ts = 1;
alpha = s * Ts; 
a = exp(-alpha);
for i = 1:size(im_vert_gradient,2)
    x = im_vert_gradient(:,i);
    y_anticausal = zeros(size(x)) ;
    for k = size(x,1)-2 : -1 : 1
        y_anticausal(k) =  a*(alpha+1)*x(k+1) - (a^2)*x(k+2) + 2*a*y_anticausal(k+1) - (a^2)*y_anticausal(k+2) ;
    end
    im_vert_gradient_anticausal(:,i) = y_anticausal;
end

for i = 1:size(im_vert_gradient,2)
    x = im_vert_gradient(:,i);
    y_causal = zeros(size(x)); 
    for k = 3 : size(x,1)
        y_causal(k) =  x(k) + a*(alpha-1)*x(k-1) + 2*a*y_causal(k-1) - (a^2)*y_causal(k-2) ;
    end
    im_vert_gradient_causal(:,i) = y_causal;
end

im_vert_gradient = im_vert_gradient_anticausal + im_vert_gradient_causal;

for i = 1:size(im_vert_gradient,1)
    x = im_vert_gradient(i,:);
    y_anticausal = zeros(size(x)) ;
    for k = size(x,2)-2 : -1 : 1
        y_anticausal(k) = s*alpha*a*x(k+1) + 2*a*y_anticausal(k+1) - (a^2)*y_anticausal(k+2) ;
    end
    im_vert_gradient_anticausal(i,:) = y_anticausal;
end

for i = 1:size(im_vert_gradient,1)
    x = im_vert_gradient(i,:);
    y_causal = zeros(size(x)); 
    for k = 3 : size(x,2)
        y_causal(k) =  -s*alpha*a*x(k-1) + 2*a*y_causal(k-1) - (a^2)*y_causal(k-2) ;
    end
    im_vert_gradient_causal(i,:) = y_causal;
end

im_vert_gradient = im_vert_gradient_anticausal + im_vert_gradient_causal;

figure
imshow(im_vert_gradient)
title('Vertical gradient')
