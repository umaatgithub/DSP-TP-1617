function y = Exponential(N, n)
    if(n>=1 && n<=N)
       ramp(1:n-1) = 0;
       for i=n:N
          ramp(i) = exp(i-n); 
       end
       y = ramp;
%        stem(ramp);
%        xlabel('k')
%        ylabel('Ramp(k-n)')
%        title('RAMP FUNCTION')
    else
       disp('WARNING : The signal is not in correct range.'); 
    end
end