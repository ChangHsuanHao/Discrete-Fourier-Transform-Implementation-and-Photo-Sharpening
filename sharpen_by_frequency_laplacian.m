function mim = sharpen_by_frequency_laplacian(filename, c)
clc;close;
im = imread(filename); 
im =  mat2gray(im2double(im));
[m,n] = size(im);
F= fftshift(my_fft2(im)); 
for u=1:m
    for v=1:n
        H(u,v) = -4*pi^2*((u-m/2)^2+(v-n/2)^2);
    end
end
G = H.*F;
g=real(my_ifft2(ifftshift(G)));
g = mat2gray(g)*2-1;
mim = im + c*g;
subplot(1, 2, 1),imshow(im);title('original')
subplot(1, 2, 2),imshow(mim);title('motified')
end