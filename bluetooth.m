direction = 150;
speed = 150;
Beacon = 'A1';
BeaconCode = 'C0x12345678';
BitFreq = 'B5000';
CarrierFreq = 'F15000';
RepetitionCount = 'R2500';

% result = EPOCommunications('close'); %Check the value of result
Port = '.\\COM3'; %Outgoing COM port 
result = EPOCommunications('open',Port); %Check the value of result 

d = int2str(direction); 
s = int2str(speed); 
signal = ['D',d]; 
EPOCommunications('transmit',signal)

signal = ['M',s]; 
EPOCommunications('transmit',signal);

EPOCommunications('transmit', BitFreq);
EPOCommunications('transmit', CarrierFreq);
EPOCommunications('transmit', RepetitionCount);
EPOCommunications('transmit', BeaconCode);
EPOCommunications('transmit', Beacon);


pause(2);

result = EPOCommunications('close'); %Check the value of result




