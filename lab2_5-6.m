original_signal = audioread('1kHzSineWave.mp3'); 

noise = 0.5 *- randn(size(original_signal));  
noisy_signal = original_signal + noise; 

audiowrite('noisy_signal2.wav', noisy_signal, 44100); 

sound(noisy_signal, 44100);


L = 5; 
rectangular_window = ones(1, L) / L; 

figure; 
plot(rectangular_window); 
title('Rectangular Window Function'); 
xlabel('window length'); 
ylabel('Amplitude'); 
filtered_signal = conv(noisy_signal, rectangular_window, 'same'); 
sound(filtered_signal, 44100); 
audiowrite('filtered_signal.wav', filtered_signal, 44100); 
num_samples = 200;  
time = (0:num_samples-1) / 44100; 

figure; 
plot(time, original_signal(1:num_samples), 'b', 'LineWidth', 1.5); 
hold on; 
plot(time, noisy_signal(1:num_samples), 'r', 'LineWidth', 1.5); 
plot(time, filtered_signal(1:num_samples), 'g', 'LineWidth', 1.5); 
title('Original, Noisy, and Filtered Signals'); 
xlabel('Time (s)'); 
ylabel('Amplitude'); 
legend('Original Signal', 'Noisy Signal', 'Filtered Signal'); 
hold off