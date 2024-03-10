%Parameters
numChannels = 5;
numSamples = 1000;
depressedProbability = 0.3;


% Initialize synthetic EEG data matrix
 syntheticEEGData = zeros(numChannels, numSamples);

    for channel = 1:numChannels
        % Randomly choose if the channel exhibits depression features
        isDepressedChannel = rand() < depressedProbability;

        % Generate synthetic EEG signal based on depression status
        if isDepressedChannel
            % Simulate depressed EEG with random characteristics
            syntheticEEGData(channel, :) = generateDepressedSignal(numSamples);
        else
            % Simulate healthy EEG with random characteristics
            syntheticEEGData(channel, :) = generateHealthySignal(numSamples);
        end
    end
end

function signal = generateDepressedSignal(numSamples)
    % Simulate depressed EEG signal (example characteristics)
    baseline = randn(1, numSamples);  % Random baseline signal
    depressionAmplitude = rand() * 2;  % Random depression amplitude
    depressionDuration = rand() * numSamples / 2;  % Random depression duration

    % Create depression feature
    depressionFeature = linspace(0, depressionAmplitude, depressionDuration);
    depressionFeature = [depressionFeature, fliplr(depressionFeature)];

    % Add depression feature to the baseline signal
    signal = baseline + depressionFeature;
end

function signal = generateHealthySignal(numSamples)
    % Simulate healthy EEG signal (example characteristics)
    baseline = randn(1, numSamples);  % Random baseline signal
    noiseAmplitude = rand() * 0.5;  % Random noise amplitude

    % Add random noise to the baseline signal
    noise = noiseAmplitude * randn(1, numSamples);
    signal = baseline + noise;
end