data = load('test3b.mat');
forceReadings = data.data;

% Filtering out noise
forceReadings(forceReadings == -0.01) = [];
forceReadings(forceReadings == -0.02) = [];
forceReadings(forceReadings == 0) = [];
forceReadings(forceReadings == 0.01) = [];
forceReadings(forceReadings == 0.02) = [];
forceReadings(forceReadings == 0.03) = [];

% Calibrated values
offset = -0.254;
scaleFactor = 0.523;
calibrated = (forceReadings * scaleFactor) + offset;

% Adding timesstamps
dt = 0.1;
numReadings = length(calibrated);
timestamps = (0:dt:numReadings - 1)*dt;

% Locating maximums
numTrials = 30;
trialLength = floor(length(calibrated) / numTrials); % Ensure integer trial length
maxPerTrial = zeros(1, numTrials);

for i = 1:numTrials-1
    % Define start and end indices for each trial
    startIdx = (i-1)*trialLength + 1;
    if i == numTrials
        % Ensure last trial includes any leftover data
        endIdx = length(calibrated);
    else
        endIdx = i*trialLength;
    end
    
    trialData = calibrated(startIdx:endIdx); % Extract trial data
    
    % Find peaks and compute the maximum
    peaks = findpeaks(trialData);
    if ~isempty(peaks)
        maxPerTrial(i) = max(peaks); % Store the maximum peak
    else
        maxPerTrial(i) = NaN; % Handle case where no peaks are found
    end
end

disp(maxPerTrial);
