% function Sinus(f, n, Fs)
%     N = 2*pi*f*n;
%     step = 0:N/Fs:N;
%     for i = 1:length(step)
%         sinus(i) = sin(step(i));
%     end
%     stem(step,sinus);
%     xlabel('k')
%     ylabel('sin(k)')
%     title('SINUSOIDAL FUNCTION')
% end

function Sinus(f, N, Fs)
    T = 1/f;
    Ts = 1/Fs;
    n = 0:Ts:N*T;
    for i = 1:length(n)
        sinus(i) = sin(2*pi*f*n(i));
    end
    stem(sinus);
    xlabel('k')
    ylabel('sin(k)')
end
