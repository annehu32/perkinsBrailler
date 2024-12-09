allData = ['test1b.mat', 'test1c.mat',
            'test2a.mat', 'test2b.mat', 'test2c.mat',
            'test3a.mat', 'test3b.mat',
            'test4c.mat',
            'test5a.mat', 'test5b.mat', 'test5c.mat'];
averageForce = [];

for test = 0 :(length(allData) - 1)
    data = load('test1b.mat');
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
    
    plot(timestamps,timeDerivative,'r', 'LineWidth', 2); % Derivative in Red
    hold on;
    plot(timestamps, calibrated, 'b--', 'LineWidth', 2); % Force in Blue
    
    maxIndex = [];
    maxVals = [];
    
    for index = 1: (length(timeDerivative) - 1)
         curr = timeDerivative(index);
         next = timeDerivative(index+1);
         disp("current: "+curr+", next: "+next)
    
         if curr > 0
             if next < 0
                maxIndex(end+1) = index;
                maxVals(end+1)=forceReadings(index+1);
             end
         end
     
    end

    averageForce(test)
end
