function f = my_fft2(f)
[m,n] = size(f);
for y = 1:n
    f(:,y) = my_fft_time_rec(f(:,y));
end
for x = 1:m
    f(x,:) = my_fft_time_rec(f(x,:));
end
end
