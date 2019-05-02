function [new_speed, new_direction] = drive(input)
extraspeed= 10;
extradirection = 10;
if (strcmp(input,'leftarrow'))
    new_speed = 150;
    new_direction = 150+extradirection;
elseif (strcmp(input,'rightarrow'))
    new_speed = 150;
    new_direction = 150-extradirection;
elseif (strcmp(input,'uparrow'))
    new_speed = 150+extraspeed;
    new_direction = 150;
elseif (strcmp(input, 'downarrow'))
    new_speed = 150-extraspeed;
    new_direction = 150;
else
    new_speed = 150;
    new_direction = 150;
end
d = int2str(new_direction);
s = int2str(new_speed);

% signal = ['D',d];
% EPOCommunications('transmit',signal);
% signal = ['M',s];
% EPOCommunications('transmit',signal);
end