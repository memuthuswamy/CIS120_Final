function viewChange(~, eventdata)

% Get current view
[az, el] = view;

% Change figure view based on key preshObj 
switch eventdata.Character
%     Turn left
    case 'a'
        az = az + 5;
        view(az,el)
%     Turn right
    case 'd'
        az = az - 5;
        view(az, el)
%     Turn down
    case 's'
        el = el - 5; 
        view(az, el)
%     Turn up 
    case 'w'
        el = el + 5; 
        view(az, el)
end