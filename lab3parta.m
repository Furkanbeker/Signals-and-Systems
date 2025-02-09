f = 1000;
fs = f * 40;
nCyl = 5;
A = 20;

t = 0:1/fs:nCyl*1/f;

sine_wave = A * sin(2 * pi * f * t);
square_wave = A * square(2 * pi * f * t);
triangular_wave = A * sawtooth(2 * pi * f * t, 0.5);

nfft = 1024;
f_vector = (0:nfft/2-1) * fs / nfft;

X_sine = fft(sine_wave, nfft);
X_sine = X_sine(1:nfft/2);
mx_sine = abs(X_sine);

X_square = fft(square_wave, nfft);
X_square = X_square(1:nfft/2);
mx_square = abs(X_square);

X_triangular = fft(triangular_wave, nfft);
X_triangular = X_triangular(1:nfft/2);
mx_triangular = abs(X_triangular);

figure;

subplot(3, 2, 1);
plot(t, sine_wave);
title('Sine Wave Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3, 2, 2);
plot(f_vector, mx_sine);
title('Power Spectrum of a Sine Wave');
xlabel('Frequency (Hz)');
ylabel('Power');

subplot(3, 2, 3);
plot(t, square_wave);
title('Square Wave Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3, 2, 4);
plot(f_vector, mx_square);
title('Power Spectrum of a Square Wave');
xlabel('Frequency (Hz)');
ylabel('Power');

subplot(3, 2, 5);
plot(t, triangular_wave);
title('Triangular Wave Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3, 2, 6);
plot(f_vector, mx_triangular);
title('Power Spectrum of a Triangular Wave');
xlabel('Frequency (Hz)');
ylabel('Power');
