function [new_speed, new_direction] = drive(speed, direction, extra)
prompt = 'What is your action?';
x = input(prompt,'s');
if x== 'a'
    new_speed = speed;
    new_direction = direction+extra;
elseif x=='d'
    new_speed = speed;
    new_direction = direction-extra;
elseif x== 'w'
    new_speed = speed+extra;
    new_direction = direction;
elseif x== 's'
    new_speed = speed-extra;
    new_direction = direction;
elseif x== 'p'
    new_speed = 150;
    new_direction = 150;
end
d = int2str(new_direction);
s = int2str(new_speed);

signal = ['D',d];
EPOCommunications('transmit',signal);
signal = ['M',s];
EPOCommunications('transmit',signal);
end