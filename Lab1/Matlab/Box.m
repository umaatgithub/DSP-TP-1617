function Box(N, n, a)
    if(n>=1+a && n<=N-a)
       box(1:N) = 0;
       box(n-a:n+a) = 1;
       stem(box);
       xlabel('k')
       ylabel('Box(k-n)')
       title('BOX FUNCTION')
    else
       disp('WARNING : The signal is not in correct range.'); 
    end
end