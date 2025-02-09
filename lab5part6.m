% Parameters
f = 9e3;  % Signal frequency (9 kHz)
fs1 = 300e3;  % High sampling frequency (300 kHz)
fs2 = 3e3;  % Sampling frequency (3 kHz)
t = 0:1/fs1:1e-3;  % Time vector for 1 ms duration

% Step 1: Generate the original sine wave
x_t = sin(2*pi*f*t);

% Step 2: Plot the original signal in time and frequency domains
figure;
subplot(2,1,1);
plot(t, x_t, 'b');
title('Time Domain: Original 9 kHz Sine Wave');
xlabel('Time (s)');
ylabel('Amplitude');

f_axis = linspace(-fs1/2, fs1/2, length(t));  % Frequency axis
X_f = fftshift(fft(x_t));  % Fourier Transform of the original signal
subplot(2,1,2);
plot(f_axis, abs(X_f), 'r');
title('Frequency Domain: Original 9 kHz Sine Wave');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Step 3: Sampling process using impulse-train sampling
Ts = 1/fs2; % Sampling period
impulse_train = zeros(size(t));  % Create an impulse train
impulse_indices = 1:round(Ts*fs1):length(t);  % Indices for impulses
impulse_train(impulse_indices) = 1;  % Set impulses

xp_t = x_t .* impulse_train;  % Sampled signal

% Step 4: Plot the sampled signal in time and frequency domains
figure;
subplot(2,1,1);
stem(t, xp_t, 'g', 'Marker', 'o');
title('Time Domain: Sampled 9 kHz Signal');
xlabel('Time (s)');
ylabel('Amplitude');

Xp_f = fftshift(fft(xp_t));  % Fourier Transform of the sampled signal
subplot(2,1,2);
plot(f_axis, abs(Xp_f), 'm');
title('Frequency Domain: Sampled 9 kHz Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Step 5: Zero-Order Hold (ZOH) Reconstruction
T_recon = fs1/fs2;  % Reconstruction factor (ratio of sampling rates)
xr_t = repelem(xp_t(impulse_indices), T_recon);  % Repeat sampled values
xr_t = xr_t(1:length(t));  % Adjust the length to match the original signal

% Step 6: Plot the reconstructed signal in time and frequency domains
figure;
subplot(2,1,1);
plot(t, xr_t, 'c');
title('Time Domain: Reconstructed 9 kHz Signal using ZOH');
xlabel('Time (s)');
ylabel('Amplitude');

Xr_f = fftshift(fft(xr_t));  % Fourier Transform of the reconstructed signal
subplot(2,1,2);
plot(f_axis, abs(Xr_f), 'k');
title('Frequency Domain: Reconstructed 9 kHz Signal using ZOH');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;
