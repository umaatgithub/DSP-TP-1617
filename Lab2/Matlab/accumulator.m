function y = accumulator(f)
    accumulate(1) = 0;
    if(size(f) > 0)
        for i = 1:size(f,2);
            accumulate(i+1) = accumulate(i) + f(i);
        end
        y = accumulate(2:end);
    end
end