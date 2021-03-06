clc;
clear all;
close all;

% Subdivision 3.1

% Read 'a' image and convert to binary image by otsu thresholding
a_img = imread('../images/a.png');
a_bw = im2bw( a_img, graythresh(a_img));

% Read 'text' image and convert to binary image by otsu thresholding
text_img = imread('../images/text.png');
text_bw = im2bw( text_img, graythresh(text_img));

% Display the original images and binary images
figure
subplot(1,2,1)
imshow(a_img);
title('"a" IMAGE')

subplot(1,2,2)
imshow(a_bw);
title('"a" BINARY IMAGE')

figure
subplot(1,2,1)
imshow(text_img)
title('"text" IMAGE')

subplot(1,2,2)
imshow(text_bw)
title('"text" BINARY IMAGE')

% -------------------------------------------------------------------------

% Subdivision 3.2

% 2D cross correlation
cross_corr_matrix = xcorr2(1*text_bw, 1*a_bw);

figure
imshow(cross_corr_matrix, []);
title('CROSS CORRELATION "text" and "a"')

% -------------------------------------------------------------------------

% Subdivision 3.3

% Finding maximum value of cross correlation matrix
CrossCorrelationMaxValue = max(max(cross_corr_matrix))

% Matix with values '1' having cross correlation value > 90% of the maximum
% value in matrix 
corr_max_value_mask = cross_corr_matrix > CrossCorrelationMaxValue*0.90;

% Mask to filter the identified letters
letter_filter_mask = zeros(size(text_bw));
for i = 1:size(corr_max_value_mask, 1)
    for j = 1:size(corr_max_value_mask, 2)
        if corr_max_value_mask(i, j) == 1
            letter_filter_mask(i-floor(size(a_bw, 1)/2)-10:i-floor(size(a_bw, 1)/2)+10, j-floor(size(a_bw, 2)/2)-10:j-floor(size(a_bw, 2)/2)+10) = 1;
        end
    end 
end

% Apply filter on the text image
% The result is only an approximation
% Tried many methods but does not seem to work as expected
filtered_letters = letter_filter_mask .* text_bw;

% Display the results
figure
subplot(2,2,1)
imshow(text_bw)
title('"text" BINARY IMAGE')

subplot(2,2,2)
imshow(cross_corr_matrix, [])
title('CROSS CORRELATION "text" and "a"')

subplot(2,2,3)
imshow(letter_filter_mask)
title('LETTER FILTER MASK')

subplot(2,2,4)
imshow(filtered_letters)
title('LETTERS IDENTIFIED')

