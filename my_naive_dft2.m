function f = my_naive_dft2(f)
[m,n] = size(f);
for y = 1:n
    f(:,y) = my_naive_dft(f(:,y));
end
for x = 1:m
    f(x,:) = my_naive_dft(f(x,:));
end
end