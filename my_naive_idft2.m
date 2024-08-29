function F = my_naive_idft2(F)
[m,n] = size(F);
for y = 1:n
    F(:,y) = my_naive_idft(F(:,y));
end
for x = 1:m
    F(x,:) = my_naive_idft(F(x,:));
end
end