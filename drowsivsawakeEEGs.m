% MATLAB code to simulate EEG signals for awake and asleep states

% Parameters
fs = 1000; % Sampling frequency (Hz)
t = 0:1/fs:10; % Time vector (10 seconds)

% Generate awake EEG signal with alpha and beta waves
awake_alpha_wave = 0.7 * sin(2*pi*10*t);
awake_beta_wave = 0.5 * sin(2*pi*20*t);
awake_eeg_signal = awake_alpha_wave + awake_beta_wave;

% Generate asleep EEG signal with lower amplitude alpha and beta waves
asleep_alpha_wave = 0.3 * sin(2*pi*10*t);
asleep_beta_wave = 0.2 * sin(2*pi*20*t);
asleep_eeg_signal = asleep_alpha_wave + asleep_beta_wave;

% Add noise to simulate real-world EEG signals
noise_level = 0.1;
noisy_awake_alpha = awake_alpha_wave + noise_level * randn(size(t));
noisy_awake_beta = awake_beta_wave + noise_level * randn(size(t));
noisy_asleep_alpha = asleep_alpha_wave + noise_level * randn(size(t));
noisy_asleep_beta = asleep_beta_wave + noise_level * randn(size(t));

% Plot the simulated EEG signals with legends
figure;
subplot(4,1,1);
plot(t, noisy_awake_alpha, 'b', 'LineWidth', 1.5);
title('Simulated EEG Signal - Awake State (Alpha Waves)');
xlabel('Time (seconds)');
ylabel('Amplitude');
legend('Awake Alpha EEG Signal');
grid on;

subplot(4,1,2);
plot(t, noisy_awake_beta, 'g', 'LineWidth', 1.5);
title('Simulated EEG Signal - Awake State (Beta Waves)');
xlabel('Time (seconds)');
ylabel('Amplitude');
legend('Awake Beta EEG Signal');
grid on;

subplot(4,1,3);
plot(t, noisy_asleep_alpha, 'm', 'LineWidth', 1.5);
title('Simulated EEG Signal - Asleep State (Alpha Waves)');
xlabel('Time (seconds)');
ylabel('Amplitude');
legend('Asleep Alpha EEG Signal');
grid on;

subplot(4,1,4);
plot(t, noisy_asleep_beta, 'c', 'LineWidth', 1.5);
title('Simulated EEG Signal - Asleep State (Beta Waves)');
xlabel('Time (seconds)');
ylabel('Amplitude');
legend('Asleep Beta EEG Signal');
grid on;





