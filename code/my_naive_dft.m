% The O(N^2) direct computation of DFT.
function F = my_naive_dft(f)
N = length(f);
F = zeros(size(f));
for u = 0:N-1
    for x = 0:N-1
        F(u+1) = F(u+1) + f(x+1)*exp(-1i*2*pi*x*u/N);
    end
end
end
