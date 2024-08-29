% The O(N^2) direct computation of IDFT.
function f = my_naive_idft(F)
N = length(F);
f = zeros(size(F));
for x = 0:N-1
    for u = 0:N-1
        f(x+1) = f(x+1) + F(u+1)*exp(1i*2*pi*u*x/N);
    end
    f(x+1) = f(x+1)/N;
end
end