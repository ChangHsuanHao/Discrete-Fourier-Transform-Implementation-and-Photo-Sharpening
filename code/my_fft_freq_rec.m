function F = my_fft_freq_rec(f)
N = length(f);
[m,~] = size(f);
if m>1
    f = f.';
end
if mod(N,2)
    F = my_naive_dft(f);
else
    n = N/2;
    TF = exp(-1i*2*pi/N).^(0:n-1);
    F_front = my_fft_freq_rec(f(1:n) + f(n+1:N));
    F_back = my_fft_freq_rec((f(1:n) - f(n+1:N)).*TF);
    F = reshape([F_front; F_back], 1, []);
end
if m>1
    F = F.';
end
end
