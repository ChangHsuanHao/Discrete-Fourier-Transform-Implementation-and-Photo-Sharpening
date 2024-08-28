# Discrete Fourier Transform Implementation and Photo Sharpening
## Part 1: 1-D DFT and IDFT
The functions implemented in this part takes a single input x of size N. Ideally x could be either
a row or column vector.
### Functions
#### *my_naive_dft(x)* and *my_naive_idft(x)* :
  * The O(N2) direct computation of DFT and IDFT.
#### *my_fft_time_rec(x)* and *my_ifft_time_rec(x)* :
  * The decimation-in-time FFT algorithm.
  * If N is even, then break the task down to two N/2-point decimation-in-time FFTs.
  * Otherwise call my_naive_dft or my_naive_idft.
#### *my_fft_freq_rec(x)* and *my_ifft_freq_rec(x)* :
  * The decimation-in-frequency FFT algorithm.
  * If N is even, then break the task down to two N/2-point decimation-in-frequency FFTs.
  * Otherwise call my_naive_dft or my_naive_idft.

### Experiments : Comparison among Matlab function and my own functions
The following results is from “test1D.m”.
#### DFT
*fft()* is a Matlab funtion.
* runtime table (sec.)

![image](https://github.com/user-attachments/assets/d2ceeec6-d783-4008-a7d8-66d2a62531bf)

* size v.s. runtime loglog graph

![image](https://github.com/user-attachments/assets/41abfe8d-9d0b-4c7a-b74d-1b6958a5a7c4)

#### IDFT
*ifft()* is a Matlab funtion.
* runtime table (sec.)

![image](https://github.com/user-attachments/assets/d86b75bb-1b16-47cc-a394-ebadc9996241)

* size v.s. runtime loglog graph

![image](https://github.com/user-attachments/assets/67662ef3-6b4f-44c2-8aad-6c7a83adc23f)

#### Description
In the DFT section, it is evident from the line graph that MATLAB's `fft()` function requires less time than a custom-written function. Ignoring the case where \(N < 100\), the time differences among the three algorithms are not significant. However, when \(N > 100\), the naïve algorithm becomes increasingly slower and its execution time is directly proportional to \(N\). In contrast, the other two algorithms do not show such a clear relationship.

The trends of the two algorithms, `My_fft_time_rec()` and `My_fft_freq_rec()`, are similar. For instance, when \(N = 4032\), both algorithms take approximately 0.05 seconds, while for \(N = 5120\), they both take around 0.01 seconds, which is less than before. This can be inferred to be because 5120 is divisible by 2 repeatedly, leaving a remainder of 5. In the algorithm, when \(N\) is even, the input is recursively split in half; when \(N\) is odd, the naïve function is called.

The IDFT section is very similar to the DFT section, with nearly identical results, so there is no need for further elaboration.
