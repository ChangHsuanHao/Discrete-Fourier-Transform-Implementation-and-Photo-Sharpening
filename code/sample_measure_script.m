clear;close all;clc;

n = 256;

disp('Input size:');
disp(n);

num_test = 20;
x = cell(1, num_test);
for i = 1: num_test
  x{1, i} = rand(n, 1) + j * rand(n, 1);
end

[t_ref, std_ref] = measure_runtime(@fft, x);
disp('fft: ');
t_ref
[t_ref, std_ref] = measure_runtime(@my_naive_dft, x);
disp('naive dft: ');
t_ref
[t_ref, std_ref] = measure_runtime(@my_fft_time_rec, x);
disp('recursive fft decimation in time  ');
t_ref
% [t_ref, std_ref] = measure_runtime(@my_fft_time_iter, x);
% disp('iterative fft decimation in time  ');
% t_ref
[t_ref, std_ref] = measure_runtime(@my_fft_freq_rec, x);
disp('recursive fft decimation in frequency  ');
t_ref
% [t_ref, std_ref] = measure_runtime(@my_fft_freq_iter, x);
% disp('iterative fft decimation in frequency  ');
% t_ref
