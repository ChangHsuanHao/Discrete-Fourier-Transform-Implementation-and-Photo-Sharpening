function f = my_super_naive_idft2(F)
[m,n] = size(F);
f = zeros(m,n);
for x = 0:m-1
    for y = 0:n-1
        for u = 0:m-1
            for v = 0:n-1
                f(x+1,y+1) = f(x+1,y+1) + F(u+1,v+1)*exp(1i*2*pi*(u*x/m + v*y/n));
            end
        end
        f(x+1,y+1) = f(x+1,y+1)/m/n;
    end
end
end