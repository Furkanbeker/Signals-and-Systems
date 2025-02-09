f = 500e3;  
samp = 300e3;  

t = 0:1/samp:1e-3;  


x_t = sin(2*pi*f*t);


figure;
subplot(2,1,1);
plot(t, x_t);
title('Time Domain: Sine Wave');
xlabel('Time (s)');
ylabel('Amplitude');

f_axis = linspace(-samp/2, samp/2, length(t));  
X_f = fftshift(fft(x_t));  


subplot(2,1,2);
plot(f_axis, abs(X_f));
title('Frequency Domain: Sine Wave');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

xlim([-samp/2, samp/2]);  
grid on;


