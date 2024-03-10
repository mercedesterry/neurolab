% MATLAB code to generate simulated EEG signal with multiple waveforms for depressed and healthy conditions

% Parameters
fs = 500; % Sampling frequency (Hz)
t = 0:1/fs:10; % Time vector (10 seconds)

% Generate different EEG components for depressed condition
alpha_wave_depressed = 0.5 * sin(2*pi*10*t);
beta_wave_depressed = 0.3 * sin(2*pi*20*t);
theta_wave_depressed = 0.2 * sin(2*pi*6*t);
delta_wave_depressed = 0.1 * sin(2*pi*2*t);

% Combine the waves to simulate EEG during depression
depressed_signal = alpha_wave_depressed + beta_wave_depressed + theta_wave_depressed + delta_wave_depressed;

% Generate different EEG components for healthy condition
alpha_wave_healthy = 0.4 * sin(2*pi*12*t);
beta_wave_healthy = 0.2 * sin(2*pi*18*t);
theta_wave_healthy = 0.1 * sin(2*pi*7*t);
delta_wave_healthy = 0.3 * sin(2*pi*3*t);

% Combine the waves to simulate EEG for a healthy individual
healthy_signal = alpha_wave_healthy + beta_wave_healthy + theta_wave_healthy + delta_wave_healthy;

% Add noise to simulate real-world EEG signals for both conditions
noise_level = 0.1;
noisy_depressed_signal = depressed_signal + noise_level * randn(size(t));
noisy_healthy_signal = healthy_signal + noise_level * randn(size(t));

% Plot the simulated EEG signals for depressed and healthy conditions
figure;
subplot(2,1,1);
plot(t, noisy_depressed_signal, 'b', 'LineWidth', 1.5);
title('Simulated Noisy EEG Signal for Depressed Condition');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(t, noisy_healthy_signal, 'r', 'LineWidth', 1.5);
title('Simulated Noisy EEG Signal for Healthy Condition');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

% Display legend
legend('Depressed Condition', 'Healthy Condition', 'Location', 'best');
