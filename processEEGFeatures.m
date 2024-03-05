% File: processEEGFeatures.m
function pulseControl = processEEGFeatures(filtered_eeg_data)
    % Process filtered EEG data
    X = filtered_eeg_data;

    % Define opts structure with all necessary fields before using it
    opts = struct('fs', 500, 'alpha', 2);

    % Hjorth Activity, Mobility, Complexity
    f1 = jfeeg('ha', X, opts);
    f2 = jfeeg('hm', X, opts);
    f3 = jfeeg('hc', X, opts);

    % Feature vector for Hjorth features
    hjorth_feat = [f1, f2, f3];

    % Band Power Alpha
    f4 = jfeeg('bpa', X, opts);

    % Tsallis Entropy
    f5 = jfeeg('te', X, opts);

    % Feature vector for additional features
    additional_feat = [f4, f5];

    % Combine all features into a single feature vector
    feat = [hjorth_feat, additional_feat];  % feat is not used further in this function

    % Decide pulse generation based on extracted features
    threshold_activity = 0.5; % Adjust as needed
    threshold_tsallis_entropy = 0.7; % Adjust as needed

    % Evaluate the condition for pulse generation
    pulseControl = (f1 > threshold_activity) && (f5 > threshold_tsallis_entropy);
end
