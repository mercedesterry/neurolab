clear
% Parameters
num_samples = 1000; % Number of samples per EEG signal
num_signals = 10;   % Number of signals to generate
% Preallocate arrays to store signals
depressed_signals = zeros(num_signals, num_samples);
healthy_signals = zeros(num_signals, num_samples);

% Time vector
fs = 1000; % Sampling frequency (Hz)
t = 0:1/fs:(num_samples-1)/fs;

% Ensure monotonicity and remove duplicate values
t = unique(t);

% Check if time vector is monotonically increasing
if ~issorted(t)
    error('Time vector is not monotonically increasing.');
end

% Loop to generate signals
for i = 1:num_signals
    % Randomly decide whether the current signal is depressed or healthy
    is_depressed = rand() > 0.5; % Adjust probability as needed
    % Generate EEG components based on condition
    if is_depressed
        alpha_wave = 1.0 * sin(2*pi*10*t);
        beta_wave = 0.6 * sin(2*pi*20*t);
        theta_wave = 0.2 * sin(2*pi*6*t);
        delta_wave = 0.1 * sin(2*pi*2*t);
        signal = alpha_wave + beta_wave + theta_wave + delta_wave;
        
        % Add differences in Hjorth activity and band power alpha/tsallis entropy
        diff_hjorth = rand() * 0.5; % Random difference in Hjorth activity
        diff_band_power = rand() * 0.7; % Random difference in band power alpha/tsallis entropy
        
        % Modify EEG signal based on differences
        signal = signal + diff_hjorth * alpha_wave + diff_band_power * beta_wave;
    else
        alpha_wave = 0.4 * sin(2*pi*15*t); % Adjusted frequency for healthy condition
        beta_wave = 0.2 * sin(2*pi*25*t);
        theta_wave = 0.1 * sin(2*pi*9*t);
        delta_wave = 0.3 * sin(2*pi*5*t);
        signal = alpha_wave + beta_wave + theta_wave + delta_wave;
    end
    % Add noise to simulate real-world EEG signals
    noise_level = 0.1;
    noisy_signal = signal + noise_level * randn(size(t));
    % Store the generated signal
    if is_depressed
        depressed_signals(i, :) = noisy_signal;
    else
        healthy_signals(i, :) = noisy_signal;
    end
end

% Plot the generated signals
figure;
subplot(2,1,1);
plot(t, depressed_signals', 'b', 'LineWidth', 1.5);
title('Simulated Noisy EEG Signals for Depressed Condition');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;
subplot(2,1,2);
plot(t, healthy_signals', 'r', 'LineWidth', 1.5);
title('Simulated Noisy EEG Signals for Healthy Condition');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

% Save signals in folder
save_folder = 'C:\Users\17656\MATLAB Drive\eegforsimulink';
save(fullfile(save_folder,'depressed_singals.mat'), 'depressed_signals');
save(fullfile(save_folder, 'healthy_signals.mat'), 'healthy_signals');