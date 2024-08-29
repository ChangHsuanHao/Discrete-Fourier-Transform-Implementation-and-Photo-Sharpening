%% 2D FT
clc;clear;close;format short e
cnt = 0;
n = [1, 8, 56, 64, 93, 112, 255, 256];
for k = n
    cnt = cnt+1;
    disp('-------------------------------------')
    disp(k)
    for i=1:5
        f = rand(k, k) + 1i * rand(k, k);
        disp('fft2: ')
        tic
        F = fft2(f);
        t1(i) = toc;
        disp('2D super naive:')
        tic
        F1 = my_super_naive_dft2(f);
        assert(norm(F1-F)<1e-6);
        t2(i) = toc;
        disp('2D naive:')
        tic
        F2 = my_naive_dft2(f);
        assert(norm(F2-F)<1e-6);
        t3(i) = toc;
        disp('2D time rec:')
        tic
        F3 = my_fft2(f);
        assert(norm(F3-F)<1e-6);
        t4(i) = toc;
    end
    t_fft(cnt) = mean(t1);
    t_supernaive(cnt) = mean(t2);
    t_naive(cnt) = mean(t3);
    t_time_rec(cnt) = mean(t4);
end
T = table(n',t_fft',t_supernaive' ,t_naive',t_time_rec');
T.Properties.VariableNames = ["size","fft2","super naive","naive","time_rec"];
T
title('Fourier transform')
loglog(n, t_fft, '-', 'LineWidth', 3);
hold on
loglog(n, t_supernaive, '-', 'LineWidth', 3);
loglog(n, t_naive, '-', 'LineWidth', 3);
loglog(n, t_time_rec, '-', 'LineWidth', 3);
xlabel('input size N');
ylabel('runtime (s)');

legend('fft2', 'super naive', 'naive', 'time-rec');

%% 2D IFT
clc;clear;close;format short e
cnt = 0;
n = [1, 8, 56, 64, 93, 112, 255, 256];
for k = n
    cnt = cnt+1;
    disp('-------------------------------------')
    disp(k)
    for i=1:5
        f = rand(k, k) + 1i * rand(k, k);
        disp('ifft2: ')
        tic
        F = ifft2(f);
        t1(i) = toc;
        disp('2D naive:')
        tic
        F1 = my_naive_idft2(f);
        assert(norm(F1-F)<1e-6);
        t2(i) = toc;
        disp('2D time rec:')
        tic
        F2 = my_ifft2(f);
        assert(norm(F2-F)<1e-6);
        t3(i) = toc;
    end
    t_ifft(cnt) = mean(t1);
    t_naive(cnt) = mean(t2);
    t_time_rec(cnt) = mean(t3);
end
T = table(n',t_ifft',t_naive',t_time_rec');
T.Properties.VariableNames = ["size","ifft2","naive","time_rec"];
T
title('Fourier transform')
loglog(n, t_ifft, '-', 'LineWidth', 3);
hold on
loglog(n, t_naive, '-', 'LineWidth', 3);
loglog(n, t_time_rec, '-', 'LineWidth', 3);
xlabel('input size N');
ylabel('runtime (s)');

legend('ifft2', 'naive', 'time-rec');

%% sharpen the photo
clc; clear all; close all;
tic
sharpen_by_frequency_laplacian('blurry-moon.tif', -1);
toc