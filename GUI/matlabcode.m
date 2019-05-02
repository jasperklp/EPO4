Port = '.\\COM3'; %Outgoing COM port 
result = EPOCommunications('open',Port); %Check the value of result 
direction = 150;
speed = 150;
while(1)
prompt = 'What is your action?';
x = input(prompt,'s');
if x== 'a'
    direction = 180;
elseif x=='d'
    direction = 120;
elseif x== 'w'
    speed = 160;
elseif x== 's'
    speed = 140;
elseif x== 'p'
    break
end
d = int2str(direction);
s = int2str(speed);

signal = ['D',d];
EPOCommunications('transmit',signal);
signal = ['M',s];
EPOCommunications('transmit',signal);


end

result = EPOCommunications('close'); %Check the value of result 