function f = my_ifft_freq_rec(F)
N = length(F);
[m,~] = size(F);
if m>1
    F = F.';
end
if mod(N,2)
    f = my_naive_idft(F);
else
    n = N/2;
    TF = exp(1i*2*pi/N).^(0:n-1);
    F_front = my_ifft_freq_rec(F(1:n) + F(n+1:N));
    F_back = my_ifft_freq_rec((F(1:n) - F(n+1:N)).*TF);
    f = reshape([F_front; F_back], 1, [])./2;
end
if m>1
    f = f.';
end
end