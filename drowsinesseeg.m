
% MATLAB code to generate simulated EEG signal with multiple waveforms during drowsiness

% Parameters
fs = 1000; % Sampling frequency (Hz)
t = 0:1/fs:10; % Time vector (10 seconds)

% Generate different EEG components
alpha_wave = 0.5 * sin(2*pi*10*t);
beta_wave = 0.3 * sin(2*pi*20*t);
theta_wave = 0.2 * sin(2*pi*6*t);
delta_wave = 0.1 * sin(2*pi*2*t);

% Combine the waves to simulate EEG during drowsiness
drowsy_signal = alpha_wave + beta_wave + theta_wave + delta_wave;

% Add noise to simulate real-world EEG signals
noise_level = 0.1;
noisy_drowsy_signal = drowsy_signal + noise_level * randn(size(t));

% Plot the simulated EEG signal during drowsiness
figure;
subplot(2,1,1);
plot(t, drowsy_signal, 'b', 'LineWidth', 1.5);
title('Simulated EEG Signal during Drowsiness');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(t, noisy_drowsy_signal, 'r', 'LineWidth', 1.5);
title('Simulated Noisy EEG Signal during Drowsiness');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

% Display legend
legend('Clean EEG Signal', 'Noisy EEG Signal', 'Location', 'best');

