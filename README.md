# Discrete Fourier Transform Implementation and Photo Sharpening
## Part 1: 1-D DFT and IDFT
The functions implemented in this part takes a single input $$x$$ of size $$N$$. Ideally $$x$$ could be either a row or column vector.
### Functions
#### `my_naive_dft()` and `my_naive_idft()` :
  * The $$O(N^2)$$ direct computation of DFT and IDFT.
#### `my_fft_time_rec()` and `my_ifft_time_rec()` :
  * The decimation-in-time FFT algorithm.
  * If $$N$$ is even, then break the task down to two $$\frac{N}{2}$$-point decimation-in-time FFTs.
  * Otherwise call `my_naive_dft()` or `my_naive_idft()` respectively.
#### `my_fft_freq_rec()` and `my_ifft_freq_rec()` :
  * The decimation-in-frequency FFT algorithm.
  * If $$N$$ is even, then break the task down to two $$\frac{N}{2}$$-point decimation-in-frequency FFTs.
  * Otherwise call `my_naive_dft()` or `my_naive_idft()`.

### Experiments : Comparison among Matlab function and my own functions
The following results is from `test1D.m`.
#### DFT
`fft()` is a Matlab funtion.
* runtime table (sec.)

![image](https://github.com/user-attachments/assets/d2ceeec6-d783-4008-a7d8-66d2a62531bf)

* size v.s. runtime loglog graph

![image](https://github.com/user-attachments/assets/41abfe8d-9d0b-4c7a-b74d-1b6958a5a7c4)

#### IDFT
`ifft()` is a Matlab funtion.
* runtime table (sec.)

![image](https://github.com/user-attachments/assets/d86b75bb-1b16-47cc-a394-ebadc9996241)

* size v.s. runtime loglog graph

![image](https://github.com/user-attachments/assets/67662ef3-6b4f-44c2-8aad-6c7a83adc23f)

#### Description
In the DFT analysis, MATLAB's `fft()` function is noticeably faster than a custom-written function, particularly when $$\(N > 100\)$$. For smaller values of $$N < 100$$, the time differences among the algorithms are minimal. As $$N$$ increases, the naïve algorithm becomes increasingly slower, while the other two algorithms, `My_fft_time_rec()` and `My_fft_freq_rec()`, display similar trends. Notably, when $$N = 4032$$, both algorithms take around 0.05 seconds, but for $$N = 5120$$, they require only about 0.01 seconds due to efficient recursive division. The IDFT results are nearly identical to those of the DFT, so further discussion is unnecessary.

## Part 2: 2-D DFT and IDFT
The functions implemented in this part takes a single input x, which is an N × N matrix.

### Functions
#### `my_super_naive_dft2()` and `my_super_naive_idft2()` :
* The $$O(N^4)$$ direct computation of 2-D DFT and IDFT.
#### `my_naive_dft2()` and `my_naive_idft2()` :
* The $$O(N^3)$$ approach that performs `my_naive_dft()` per column followed by `my_naive_dft()` per row on the input matrix to obtain 2-D DFT.
#### `my_fft2()` and `my_ifft2()` :
* Perform `my_fft_time_rec()` per column followed by `my_fft_time_rec()` per row on the input matrix to obtain 2-D DFT.

### Experiments : Comparison among Matlab function and my own functions
The following results is from my own file `test2D.m`.
#### DFT
`fft2()` is a Matlab funtion.
* runtime table (sec.)

![image](https://github.com/user-attachments/assets/a5def8b8-07d9-47ab-b8a9-0942e21dcf39)

* size v.s. runtime loglog graph

![image](https://github.com/user-attachments/assets/89d31d1e-ad45-4cb6-9b34-7fc900744767)

#### IDFT
`ifft2()` is a Matlab funtion.

(The results of `my_super_naive_idft2()` are not displayed due to the large runtime.)
* runtime table (sec.)

![image](https://github.com/user-attachments/assets/af8cef52-f283-461a-a2ba-0cc77f030f7b)

* size v.s. runtime loglog graph

![image](https://github.com/user-attachments/assets/20e6dcfd-a523-4bf3-9b77-7d1f23653c50)

#### Description
In the DFT analysis, the lines in the 2D case are more separated compared to the 1D case, indicating greater time differences due to the exponential increase in time complexity when both rows and columns exceed one. As usual, MATLAB's `fft2()` is the fastest, followed by the naïve and super naïve algorithms. The super naïve algorithm has a time complexity of $$O(n^4)$$, while the naïve one is $$O(n^3)$$, with the difference increasing as $$N$$ grows. The `my_fft_time_rec()` function takes no longer than the naïve algorithm and follows its design of splitting inputs recursively when $$N$$ is even. In the IDFT analysis, the separation between `my_naive_idft2()` and `my_ifft2()` is less distinct but still follows similar trends as in the DFT.

## Part 3: Photo Sharpening
Apply `my_fft2()` and `my_ifft2()` to image processing instead of `fft2()` and `ifft2()`.

(The following results is from my own file `test2D.m` and `sharpen_by_frequency_laplacian.m`. The original photo is `blurry-moon.tif`.)
### Process:
1.	Turn the input photo into doubles and normalize them to the range [0, 1].
2.	Do $$g\left(x,y\right)=f\left(x,y\right)+c\nabla^2f\left(x,y\right)$$, where $$\nabla^2f\left(x,y\right)$$ is approximated by $$F^{-1}\left(-4\pi^2\left(u^2+v^2\right)F\left(u,v\right)\right)$$.
3.	Use my own function my_fft2_time_rec for Discrete Fourier Transform (DFT).
4.	Use my own function my_ifft2_time_rec for inverse Discrete Fourier Transform (IDFT).
5.	Normalize $$\nabla^2f\left(x,y\right)$$ to the range [−1, 1].
6.	Show the modified photo.
### Result:

![image](https://github.com/user-attachments/assets/e7980de7-e606-4eb3-8ab4-37bdcb498d8e)

(Runtime : 101.033236 seconds)
