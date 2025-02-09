f = 500e3;  
samp = 300e3;  

t = 0:1/samp:1e-3;  

x_t = sin(2*pi*f*t);

% Plot the original sine wave in the time domain
figure;
subplot(2,1,1);
plot(t, x_t, 'b');
title('Time Domain: Sine Wave');
xlabel('Time (s)');
ylabel('Amplitude');

% Frequency axis and Fourier Transform
f_axis = linspace(-samp/2, samp/2, length(t));  
X_f = fftshift(fft(x_t));

% Plot the Fourier Transform of the original signal
subplot(2,1,2);
plot(f_axis, abs(X_f), 'r');
title('Frequency Domain: Sine Wave');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Sampling process
fs2 = 3e3;  % New sampling rate (3 kHz)
Ts = 1/fs2; % Sampling period

% Generate impulse train
impulse_train = zeros(size(t));
sample_indices = 1:round(Ts*samp):length(t);
impulse_train(sample_indices) = 1;

% Perform impulse-train sampling
x_sampled = x_t .* impulse_train;

% Plot the sampled signal in the time domain
figure;
subplot(2,1,1);
stem(t, x_sampled, 'g', 'Marker', 'o');
title('Time Domain: Sampled Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Fourier Transform of the sampled signal
X_sampled_f = fftshift(fft(x_sampled));
subplot(2,1,2);
plot(f_axis, abs(X_sampled_f), 'm');
title('Frequency Domain: Sampled Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;
