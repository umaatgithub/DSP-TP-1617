function Dirac(N, n)
    if(n>=1 && n<=N)
       dirac(1:N) = 0;
       dirac(n) = 1;
       stem(dirac);
       xlabel('k')
       ylabel('Delta(k-n)')
       title('DIRAC FUNCTION')
    else
       disp('WARNING : The signal is not in correct range.'); 
    end
end