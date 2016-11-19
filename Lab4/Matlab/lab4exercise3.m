clc;
clear all;
close all;

% Observation:
% 1. The frequecy components of the bar code profiles are distributed
%    across the whole frequency range and thereby we observe many small 
%    peaks in the magnitude plot for bar code images.
% 2. The distribution of the frequency across the whole range for the bar
%    code images causes the magnitude of the '0' frequency component to be 
%    less compared to the magnitude of the '0' frequency component of the
%    non bar code images.
% 3. Exceptions : The FFTs of few non bar code profiles appear similar to
%    FFT of the bar code profile because of their pattern and when we
%    consider the 1D profile of those images they look similar to a bar
%    code image. Ex: 43


% Reading all the images from the specified folder
folder_name = '../images/1D-DFT';
files = dir(folder_name);
j = 1;
smallest_row_size = 512;
smallest_column_size = 512;
for i = 1:size(files, 1)
    fileName = files(i).name;
    if fileName(1,1) ~= '.'
        sample_images{j} = imread(fullfile(folder_name, files(i).name));
        sample_images{j} = sample_images{j}(:,:,1);
        if size(sample_images{j}, 1) < smallest_row_size
            smallest_row_size = size(sample_images{j}, 1);    
        end
        if size(sample_images{j}, 2) < smallest_column_size
            smallest_column_size = size(sample_images{j}, 2);
        end
        j = j + 1;
    end
end

% Resizing all the images to the smallest image size and taking the profile
% along the image center
image_profiles = zeros(size(sample_images, 2), smallest_column_size);
for i = 1:size(sample_images, 2)
    sample_images{i} = imresize(sample_images{i}, [smallest_row_size, smallest_column_size]);
    image_profiles(i,:) = sample_images{i}(floor(smallest_row_size/2), :);
end

% Plotting all the image profiles stored as one image
figure
imshow(image_profiles, []);
title('PROFILES OF ALL IMAGES');

% Calculating the FFT's of the all the profiles and plotting
for i = 1:size(image_profiles,1)
    n = 1:size(image_profiles,2);
    image_profiles_frequency(i,:) = fftshift(fft(image_profiles(i,:)));
    N = length(image_profiles(i,:));
    fr = (-N/2 : N/2-1)* 25/N;
    
    figure
    subplot(221); plot(n, image_profiles(i, :)); title('Profile'); xlabel('n'); ylabel('Amplitude');
    subplot(222); plot(fr, abs(image_profiles_frequency(i,:))); title('Magnitude'); xlabel('Frequency'); ylabel('|X(f)|');
    subplot(223); plot(fr, real(image_profiles_frequency(i,:))); title('Real'); xlabel('Frequency'); ylabel('Re(X(f))');
    subplot(224); plot(fr, imag(image_profiles_frequency(i,:))); title('Imaginary'); xlabel('Frequency'); ylabel('Im(X(f))');

end




    