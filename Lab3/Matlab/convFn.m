function y = convFn(x, h, padding)
    
    % h function is inverted for applyting convolution
    hInverted = h(end:-1:1);
    
    % xPadded is zero padded function of x
    xPadded = zeros(1, size(x,2) + (2*(size(h,2)-1)));
    xPadded( size(h,2) : size(h,2)+size(x,2)-1) = x(:);
    
    % xPadded modified for symmetry padding
    if(strcmp(padding, 'symmetry'))
        xPadded(1:size(h,2)-1) = x(size(h,2)-1:-1:1);
        xRotated = x(end:-1:1);
        xPadded(size(xPadded,2)-size(h,2)+2:end) = xRotated(1:size(h,2)-1);
    end
    
    % xPadded modified for periodic padding
    if(strcmp(padding, 'periodic'))
        xPadded(1:size(h,2)-1) = x(1:size(h,2)-1);
        xPadded(size(xPadded,2)-size(h,2)+2:end) = x(1:size(h,2)-1);
    end
    
    % xPadded modified for constant padding
    if(strcmp(padding, 'constant'))
        xPadded(1:size(h,2)-1) = x(1);
        xPadded(size(xPadded,2)-size(h,2)+2:end) = x(end);
    end
    
    % Applying convolution
    for i = 1 : size(xPadded,2)-(size(h,2)-1)
       y(i) =  sum(xPadded(i:i+size(h,2)-1) .* hInverted);
    end
    
end