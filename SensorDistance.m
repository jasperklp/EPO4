function [sensorL,sensorR,delay] = SensorDistance
%SENSORDISTANCE Summary of this function goes here
%   Detailed explanation goes here
tic
status = EPOCommunications('transmit','S');
delay = toc;

% status = '************************** * Audio Beacon: on * c: 0x00000000 * f_c: xxxxx * f_b: xxxxx * c_r: xxx ************************** * PWM: * Dir. xxx * Mot. xxx ************************** * Sensors: * Dist. L 323 R 2 * V_batt xx.x V **************************'
i = strfind(status,'Dist. L');

test = status([i+9,i+10,i+11]);
test2 = double(status([i+9,i+10,i+11]));
        
if(double(status(i+9)) == 32)
    sensorL = str2double(status(i+8));
    k = 0;
elseif(double(status(i+10) == 32))
    sensorL = str2double(status([i+8,i+9]));
    k = 1;
elseif(double(status(i+11)) == 32)
    sensorL = str2double(status([i+8,i+9,i+10]));
    k = 2;
else
    f = errordlg('COMS error')
    sensorL='Error';
end


% test = status([i+13+k,i+14+k,i+15+k]);
% test2 = double(status([i+13+k,i+14+k,i+15+k]));

if(double(status(i+13+k)) == 10)
    sensorR = str2double(status(i+12+k));
elseif(double(status(i+14+k)) == 10)
    sensorR = str2double(status([i+12+k,i+13+k]));
elseif(double(status(i+15+k)) == 10)
    sensorR = str2double(status([i+12+k,i+13+k,i+14+k]));
else
   f = errordlg('COMS error')
   sensorR = 'Error';
end
end

