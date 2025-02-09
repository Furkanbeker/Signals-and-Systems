% Parameters
f1 = 500;  % Frequency of the first sine wave (500 Hz)
f2 = 9000; % Frequency of the second sine wave (9 kHz)
fs1 = 300e3;  % High sampling frequency (300 kHz)
fs2 = 3e3;  % Sampling frequency for impulse-train sampling (3 kHz)
t = 0:1/fs1:1e-3;  % Time vector for 1 ms duration
f_axis = linspace(-fs1/2, fs1/2, length(t));  % Frequency axis for original signal

% Step 1: Generate the mixed sinusoidal signal
x_t_mixed = sin(2*pi*f1*t) + sin(2*pi*f2*t);

% Step 2: Plot the mixed signal in time domain
figure;
subplot(2,1,1);
plot(t, x_t_mixed);
title('Mixed Sinusoidal Signal in Time Domain');
xlabel('Time (s)');
ylabel('Amplitude');

% Step 3: Plot the mixed signal in frequency domain
X_mixed_f = fftshift(fft(x_t_mixed));
subplot(2,1,2);
plot(f_axis, abs(X_mixed_f));
title('Mixed Sinusoidal Signal in Frequency Domain');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Step 4(a): Sample the mixed signal using impulse-train sampling
Ts = 1/fs2;  % Sampling period
p_t = zeros(size(t));  % Initialize impulse train
impulse_indices = 1:round(Ts*fs1):length(t);  % Indices for impulses
p_t(impulse_indices) = 1;  % Set impulses at the correct indices

% Sample the signal using the impulse train
xp_t_mixed = x_t_mixed .* p_t;

% Step 4(b): Plot the sampled mixed signal in time domain
figure;
subplot(2,1,1);
stem(t, xp_t_mixed);
title('Sampled Mixed Signal in Time Domain');
xlabel('Time (s)');
ylabel('Amplitude');

% Step 4(b): Plot the Fourier Transform of the sampled mixed signal
f_axis_sampled = linspace(-fs2/2, fs2/2, length(t));  % Frequency axis for sampled signal
Xp_f_mixed = fftshift(fft(xp_t_mixed));
subplot(2,1,2);
plot(f_axis_sampled, abs(Xp_f_mixed));
title('Fourier Transform of Sampled Mixed Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Step 4(c): Use Zero-Order Hold (ZOH) to recover the mixed signal
T = fs1/fs2;  % Length of the rectangular impulse response for ZOH
h0_t = ones(1, T);  % Create rectangular pulse for ZOH

% Use convolution to simulate ZOH
xr_t_mixed = conv(xp_t_mixed, h0_t, 'full');
xr_t_mixed = xr_t_mixed(1:length(t));  % Truncate to match the original signal length

% Step 4(c): Plot the recovered mixed signal in time domain
figure;
subplot(2,1,1);
plot(t, xr_t_mixed);
title('Recovered Mixed Signal using ZOH in Time Domain');
xlabel('Time (s)');
ylabel('Amplitude');

% Step 4(c): Plot the Fourier Transform of the recovered mixed signal
Xr_f_mixed = fftshift(fft(xr_t_mixed));
subplot(2,1,2);
plot(f_axis, abs(Xr_f_mixed));
title('Fourier Transform of Recovered Mixed Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
