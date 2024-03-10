Fs = 1000; % Sampling frequency in Hz
T = 10; % Duration of the signal in seconds
t = 0:1/Fs:T-1/Fs; % Time vector
% Generate awake EEG signal with alpha and beta waves
awake_alpha_wave = 0.7 * sin(2*pi*10*t);
awake_beta_wave = 0.5 * sin(2*pi*20*t);
awake_eeg_signal = awake_alpha_wave + awake_beta_wave;
% Generate asleep EEG signal with lower amplitude alpha and beta waves
drowsy_alpha_wave = 0.3 * sin(2*pi*10*t);
drowsy_beta_wave = 0.2 * sin(2*pi*20*t);
drowsy_eeg_signal = drowsy_alpha_wave + drowsy_beta_wave;
% Add noise to simulate real-world EEG signals
noise_level = 0.1;
noisy_awake_alpha = awake_alpha_wave + noise_level * randn(size(t));
noisy_awake_beta = awake_beta_wave + noise_level * randn(size(t));
noisy_drowsy_alpha = drowsy_alpha_wave + noise_level * randn(size(t));
noisy_drowsy_beta = drowsy_beta_wave + noise_level * randn(size(t));
 
% Awake and Droswy EEG Signals with Noise
awakeEEGSignal = noisy_awake_alpha + noisy_awake_beta;
drowsyEEGSignal = noisy_drowsy_alpha + noisy_drowsy_beta;
 
% Amplify both signals
amplificationFactor = 2;
amplifiedAwakeSignal = awakeEEGSignal * amplificationFactor;
amplifiedDrowsySignal = drowsyEEGSignal * amplificationFactor;

Fc = 30;        % Cutoff frequency
order = 100;    % Filter order
 
% Design a low-pass FIR filter
d = designfilt('lowpassfir', 'FilterOrder', order, ...
               'CutoffFrequency', Fc, 'SampleRate', Fs, ...
               'DesignMethod', 'window', 'Window', 'hamming');
 
% Filter the amplified signals
filteredAmplifiedAwakeEEG = filter(d, amplifiedAwakeSignal);
filteredAmplifiedDrowsyEEG = filter(d, amplifiedDrowsySignal);
 
% Zero-phase filtering
filteredAmplifiedAwakeEEG_zeroPhase = filtfilt(d, amplifiedAwakeSignal);
filteredAmplifiedDrowsyEEG_zeroPhase = filtfilt(d, amplifiedDrowsySignal);
 
% Plotting
figure;
% Awake EEG Signals
subplot(4,2,1);
plot(t, awakeEEGSignal);
title('Awake EEG Signal');
xlabel('Time (s)');
ylabel('Amplitude');
 
subplot(4,2,3);
plot(t, amplifiedAwakeSignal);
title('Amplified Awake Signal');
xlabel('Time (s)');
ylabel('Amplitude');
 
subplot(4,2,5);
plot(t, filteredAmplifiedAwakeEEG);
title('Filtered Amplified Awake Signal');
xlabel('Time (s)');
ylabel('Amplitude');
 
subplot(4,2,7);
plot(t, filteredAmplifiedAwakeEEG_zeroPhase);
title('Zero-Phase Filtered Awake Signal');
xlabel('Time (s)');
ylabel('Amplitude');
 
% Drowsy EEG Signals
subplot(4,2,2);
plot(t, drowsyEEGSignal);
title('Drowsy EEG Signal');
xlabel('Time (s)');
ylabel('Amplitude');
 
subplot(4,2,4);
plot(t, amplifiedDrowsySignal);
title('Amplified Drowsy Signal');
xlabel('Time (s)');
ylabel('Amplitude');
 
subplot(4,2,6);
plot(t, filteredAmplifiedDrowsyEEG);
title('Filtered Amplified Drowsy Signal');
xlabel('Time (s)');
ylabel('Amplitude');
 
subplot(4,2,8);
plot(t, filteredAmplifiedDrowsyEEG_zeroPhase);
title('Zero-Phase Filtered Drowsy Signal');
xlabel('Time (s)');
ylabel('Amplitude');
 
sgtitle('EEG Signals Processing: Awake vs. Drowsy');