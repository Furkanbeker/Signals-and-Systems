f1 = 300;
f2 = 5000;
f3 = 18000;
fs = 100000; 

A = 1;

t = 0:1/fs:0.01;

x1 = A * sin(2 * pi * f1 * t);
x2 = A * sin(2 * pi * f2 * t);
x3 = A * sin(2 * pi * f3 * t);

sum = x1 + x2 + x3;

figure;
subplot(2, 1, 1);
plot(t, x1, 'r', 'DisplayName', 'f1 = 300 Hz');
hold on;
plot(t, x2, 'g', 'DisplayName', 'f2 = 5 kHz');
plot(t, x3, 'b', 'DisplayName', 'f3 = 18 kHz');
title('Sine Wave Signals in Time Domain');
xlabel('Time (s)');
ylabel('Amplitude');
legend;
grid on;

subplot(2, 1, 2);
plot(t, sum, 'k', 'DisplayName', 'Sum of Signals');
title('Sum of Sine Wave Signals in Time Domain');
xlabel('Time (s)');
ylabel('Amplitude');
legend;
grid on;

figure;
frequencies = linspace(-fs/2, fs/2, length(sum));
spectrum = fftshift(fft(sum));
plot(frequencies, abs(spectrum), 'k');
title('Frequency Spectrum of Sum of Sine Wave Signals');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
grid on;
