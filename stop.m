Port = '.\\COM3'; %Outgoing COM port 
result = EPOCommunications('open',Port); %Check the value of result 

speed = 150;
direction = 150;
while(1)

[L,R, delay] = SensorDistance;
speed = 154;
if((L+R)/2 < 50)
    speed = 150;
    break
end

d = int2str(direction); 
s = int2str(speed); 
signal = ['D',d]; 
EPOCommunications('transmit',signal)

signal = ['M',s]; 
EPOCommunications('transmit',signal);


end

d = int2str(direction); 
s = int2str(speed); 
signal = ['D',d]; 
EPOCommunications('transmit',signal)

signal = ['M',s]; 
EPOCommunications('transmit',signal);

result = EPOCommunications('close'); %Check the value of result 
