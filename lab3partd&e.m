[soundData, sampleRate] = audioread("SumAudio.wav");
time = (0:length(soundData)-1)/sampleRate;

lowFreq = 2 * (1000 / sampleRate);
highFreq = 2 * (15000 / sampleRate);
freqBounds = [lowFreq, highFreq];

lowPassFilter = fir1(48, lowFreq, "low", hamming(49));
highPassFilter = fir1(48, highFreq, "high", hamming(49));
bandPassFilter = fir1(48, freqBounds, "bandpass", hamming(49));

lowPassOutput = filter(lowPassFilter, 1, soundData);
highPassOutput = filter(highPassFilter, 1, soundData);
bandPassOutput = filter(bandPassFilter, 1, soundData);

zoomTimeRange = time <= 0.005;

figure;

subplot(4, 2, 1);
plot(time(zoomTimeRange), soundData(zoomTimeRange), 'b', 'LineWidth', 1.5);
xlabel("Time (s)");
ylabel("Amplitude");
title("Original Signal");
grid on;

subplot(4, 2, 2);
plotFrequencyResponse(soundData, sampleRate, 'b');
title("Original Signal Frequency Response");

subplot(4, 2, 3);
plot(time(zoomTimeRange), lowPassOutput(zoomTimeRange), 'g', 'LineWidth', 1.5);
xlabel("Time (s)");
ylabel("Amplitude");
title("Low-pass Filtered Signal");
grid on;

subplot(4, 2, 4);
plotFrequencyResponse(lowPassOutput, sampleRate, 'g');
title("Low-pass Filtered Frequency Response");

subplot(4, 2, 5);
plot(time(zoomTimeRange), highPassOutput(zoomTimeRange), 'm', 'LineWidth', 1.5);
xlabel("Time (s)");
ylabel("Amplitude");
title("High-pass Filtered Signal");
grid on;

subplot(4, 2, 6);
plotFrequencyResponse(highPassOutput, sampleRate, 'm');
title("High-pass Filtered Frequency Response");

subplot(4, 2, 7);
plot(time(zoomTimeRange), bandPassOutput(zoomTimeRange), 'r', 'LineWidth', 1.5);
xlabel("Time (s)");
ylabel("Amplitude");
title("Band-pass Filtered Signal");
grid on;

subplot(4, 2, 8);
plotFrequencyResponse(bandPassOutput, sampleRate, 'r');
title("Band-pass Filtered Frequency Response");

function plotFrequencyResponse(signal, fs, color)
    fftSignal = fft(signal);
    powerSpectrum = abs(fftSignal / length(signal));
    singleSidedSpectrum = powerSpectrum(1:floor(length(signal) / 2) + 1);
    frequency = fs / length(signal) * (0:(length(singleSidedSpectrum) - 1));
    plot(frequency, singleSidedSpectrum, color, 'LineWidth', 1.5);
    xlabel("Frequency (Hz)");
    ylabel("Power");
    grid on;
    xlim([0, fs/2]);
end
