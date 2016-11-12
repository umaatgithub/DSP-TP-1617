function y = convFn2D(img, h)
    
    % This function is generalised for any length of img and h

    % Midpoint of the filter is calculated
    hy_midpoint = floor((size(h,1)+1)/2);
    hx_midpoint = floor((size(h,2)+1)/2);
    
    % img_padded is the zero padded matrix of img
    img_padded = zeros( size(img,1)+size(h,1)-1, size(img,2)+size(h,2)-1 );
    img_padded(hy_midpoint:size(img,1)+hy_midpoint-1, hx_midpoint:size(img,2)+hx_midpoint-1) = img;
    
    % Initializing the convolution result matrix
    y = zeros(size(img));
    
    % Applying convolution
    for i = 1 : size(img,1)
        for j = 1 : size(img,2)
            y(i,j) = sum(sum(img_padded( i: i+size(h,1)-1, j:j+size(h,2)-1 ) .* h));
        end
    end
    
end