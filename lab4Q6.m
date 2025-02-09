% Time vector for generating impulse signal approximation
t = 0:0.0001:0.01; % Time from 0 to 0.01s with 0.1ms step

% Approximate impulse using a very narrow pulse
delta_t = 0.0001; % Small time step for impulse approximation
delta_signal = [1, zeros(1, length(t)-1)]; % Approximated impulse

% Convolve the system's impulse response with the delta function
h_delta_t = conv(delta_signal, h_t) * delta_t; % Convolution with time scaling

% Plot the resulting impulse response
figure;
plot(t, h_delta_t(1:length(t)), 'LineWidth', 2);
xlabel('Time (s)');
ylabel('h(t) from \delta(t)');
title('Impulse Response Using Impulse Signal \delta(t)');
grid on;
