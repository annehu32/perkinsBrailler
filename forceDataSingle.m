allData = {'test5c.mat'};
averageForce = [];

for test = 1 :(length(allData))
    toLoad = allData{test};
    disp(toLoad)
    data = load(toLoad);
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
    timestamps = 0:dt:(numReadings - 1)*dt;
    
    % Locating maximums
    timeDerivative = gradient(calibrated(:))./gradient(timestamps(:));
    
%     plot(timestamps,timeDerivative,'r', 'LineWidth', 2); % Derivative in Red
%     hold on;
%     plot(timestamps, calibrated, 'b--', 'LineWidth', 2); % Force in Blue
     
    maxIndex = [];
    maxVals = [];
    
    for index = 1: (length(timeDerivative) - 1)
         curr = timeDerivative(index);
         next = timeDerivative(index+1);
    
         if curr > 0
             if next < 0
                if calibrated(index+1) >2
                    maxIndex(end+1) = index;
                    maxVals(end+1)= calibrated(index+1);
                end

             end
         end
     
    end

    averageForce(test) = mean(maxVals,'omitnan');
end

% Final results
results = table(allData(:), averageForce(:), 'VariableNames', {'TestName', 'AverageForce'});
disp(results);
