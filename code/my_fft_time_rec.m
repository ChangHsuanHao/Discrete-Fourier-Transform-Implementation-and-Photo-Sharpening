function F = my_fft_time_rec(f)
N = length(f);
[m,~] = size(f);
if m>1
    f = f.';
end
if mod(N,2)
    F = my_naive_dft(f);
else
    n = N/2;
    F_even = my_fft_time_rec(f(1:2:N-1));
    F_odd = my_fft_time_rec(f(2:2:N));
    F_odde = F_odd.*exp(-1i*pi*(0:n-1)/n);
    F = [F_even + F_odde, F_even - F_odde];
end
if m>1
    F = F.';
end
end

