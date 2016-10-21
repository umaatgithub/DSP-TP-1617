function Step(N, n)
    if(n>=1 && n<=N)
       step(1:n-1) = 0;
       step(n:N) = 1;
       stem(step);
       xlabel('k')
       ylabel('Step(k-n)')
       title('STEP FUNCTION')
    else
       disp('WARNING : The signal is not in correct range.'); 
    end
end