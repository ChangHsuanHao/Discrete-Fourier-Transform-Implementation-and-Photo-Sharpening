%% 1D FT
clc;clear;close;format short e
cnt = 0;
n = [1, 8, 64, 256, 301, 4032, 5120];
for k = n
    cnt = cnt+1;
    disp('-------------------------------------')
    disp(k)
    for i=1:5
        f = rand(k, 1) + 1i * rand(k, 1);
        disp('fft: ')
        tic
        F = fft(f);
        t1(i) = toc;
        disp('1D naive:')
        tic
        F1 = my_naive_dft(f);
        assert(norm(F1-F)<1e-6);
        t2(i) = toc;
        disp('1D time rec:')
        tic
        F2 = my_fft_time_rec(f);
        assert(norm(F2-F)<1e-6);
        t3(i) = toc;
        disp('1D freq rec:')
        tic
        F3 = my_fft_freq_rec(f);
        assert(norm(F3-F)<1e-6);
        t4(i) = toc;
    end
    t_fft(cnt) = mean(t1);
    t_naive(cnt) = mean(t2);
    t_time_rec(cnt) = mean(t3);
    t_freq_rec(cnt) = mean(t4);
end
T = table(n',t_fft',t_naive',t_time_rec',t_freq_rec');
T.Properties.VariableNames = ["size","fft","naive","time_rec","freq_rec"];
T
title('Fourier transform')
loglog(n, t_fft, '-', 'LineWidth', 3);
hold on
loglog(n, t_naive, '-', 'LineWidth', 3);
loglog(n, t_time_rec, '-', 'LineWidth', 3);
loglog(n, t_freq_rec, '-', 'LineWidth', 3);
xlabel('input size N');
ylabel('runtime (s)');

legend('fft', 'naive', 'time-rec', 'freq-rec');

%% 1D IFT
clc;clear;close;format short e
cnt = 0;
n = [1, 8, 64, 256, 301, 4032, 5120];
for k = n
    cnt = cnt+1;
    disp('-------------------------------------')
    disp(k)
    for i=1:5
        f = rand(k, 1) + 1i * rand(k, 1);
        disp('ifft: ')
        tic
        F = ifft(f);
        t1(i) = toc;
        disp('1D naive:')
        tic
        F1 = my_naive_idft(f);
        assert(norm(F1-F)<1e-6);
        t2(i) = toc;
        disp('1D time rec:')
        tic
        F2 = my_ifft_time_rec(f);
        assert(norm(F2-F)<1e-6);
        t3(i) = toc;
        disp('1D freq rec:')
        tic
        F3 = my_ifft_freq_rec(f);
        assert(norm(F3-F)<1e-6);
        t4(i) = toc;
    end
    t_ifft(cnt) = mean(t1);
    t_naive(cnt) = mean(t2);
    t_time_rec(cnt) = mean(t3);
    t_freq_rec(cnt) = mean(t4);
end
T = table(n',t_ifft',t_naive',t_time_rec',t_freq_rec');
T.Properties.VariableNames = ["size","ifft","naive","time_rec","freq_rec"];
T
title('Fourier transform')
loglog(n, t_ifft, '-', 'LineWidth', 3);
hold on
loglog(n, t_naive, '-', 'LineWidth', 3);
loglog(n, t_time_rec, '-', 'LineWidth', 3);
loglog(n, t_freq_rec, '-', 'LineWidth', 3);
xlabel('input size N');
ylabel('runtime (s)');

legend('ifft', 'naive', 'time-rec', 'freq-rec');
