original_signal = audioread('1kHzSineWave.mp3'); 

noise = 0.5 *- randn(size(original_signal));  
noisy_signal = original_signal + noise; 

audiowrite('noisy_signal2.wav', noisy_signal, 44100); 

sound(noisy_signal, 44100);
