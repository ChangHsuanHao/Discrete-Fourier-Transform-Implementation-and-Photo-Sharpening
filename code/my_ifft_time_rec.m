function f = my_ifft_time_rec(F)
N = length(F);
[m,~] = size(F);
if m>1
    F = F.';
end
if mod(length(F),2)
    f = my_naive_idft(F);
else
    n = N/2;
    F_even = my_ifft_time_rec(F(1:2:N-1));
    F_odd = my_ifft_time_rec(F(2:2:N));
    F_odde = F_odd.*exp(1i*pi*(0:n-1)/n);
    f = [F_even + F_odde, F_even - F_odde]./2;
end
if m>1
    f = f.';
end
end
