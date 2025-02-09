% Time vector for plotting the impulse response
t = 0:0.0001:0.01; % Time vector from 0 to 0.01 seconds with 0.1ms resolution

% Given circuit parameters
R = 1e3; % Resistor value in Ohms
C = 10e-6; % Capacitor value in Farads
fc = 16; % Cutoff frequency in Hz

% Calculate the impulse response of the system using the formula for an RC circuit
h_t = (1/(R*C)) * exp(-t/(R*C)); % Impulse response equation

% Plot the impulse response
figure;
plot(t, h_t, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('h(t)');
title('Impulse Response of the Filter h(t)');
grid on;
