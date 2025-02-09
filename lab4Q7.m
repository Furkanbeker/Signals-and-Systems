% Generate unit step signal u(t)
u_t = ones(1, length(t)); % Unit step function

% Convolve the impulse response with the unit step function to get the system's response
h_step_t = conv(u_t, h_t) * delta_t; % Convolution with time scaling

% Plot the resulting impulse response
figure;
plot(t, h_step_t(1:length(t)), 'LineWidth', 2);
xlabel('Time (s)');
ylabel('h(t) from u(t)');
title('Impulse Response Using Unit Step Signal u(t)');
grid on;
