function Geo(N, n, a)
    if(n>=1 && n<=N)
       geo(1:n-1) = 0;
       for i=n:N
          geo(i) = a^(i-n); 
       end
       stem(geo);
       xlabel('k')
       ylabel('Geo(k-n)')
       title('GEOMETRIC FUNCTION')
    else
       disp('WARNING : The signal is not in correct range.'); 
    end
end