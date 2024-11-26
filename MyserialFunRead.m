function kk =MyserialFunRead(arduinoObj)
data = readline(arduinoObj);
%disp(data);
 kk=str2double(data);
