%The needed files: MyserialfunRead
clear
close all
%Set up serial port
%select COM option for mac
availablePorts = serialportlist;
arduinoObj = serialport("/dev/cu.usbmodem11401",57600);
pause(5)
configureTerminator(arduinoObj,"CR")
%configureCallback(arduinoObj,"byte",50,@myserialfun3D_v2a)

%warning off
warning on
counter = 0; % loop set up counter

% Set up for array data collection
data=[];

%This is the main while loop
% Will run for a maximum of 17 minutes continuously (arbitrary)
while(counter<10000)
   counter=counter+1;
   % Calling the output values from serialFunRead
   [d]=MyserialFunRead(arduinoObj);
%     %Collecting data
%     Data_1=acquireData();
%     %kk = [kk; Data_1];
    data(counter) = d;
    disp(counter + ": "+d);
    save('FtestAfter.mat', 'data');

end

% CHANGE FILE NAME EACH TIME!

clear arduinoObj;
