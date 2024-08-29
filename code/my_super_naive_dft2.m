function F = my_super_naive_dft2(f)
[m,n] = size(f);
F = zeros(m,n);
for u = 0:m-1
    for v = 0:n-1
        for x = 0:m-1
            for y = 0:n-1
                F(u+1,v+1) = F(u+1,v+1) + f(x+1,y+1)*exp(-1i*2*pi*(x*u/m + y*v/n));
            end
        end
    end
end
end
