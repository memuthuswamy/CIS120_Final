function colors = rotateArray(dir,color,indic)

% Based on the turn direction and the layer that was being turned, reorder the values in the color arrays to account for the rotation of the layer  
switch dir
    case 'clock'
        if indic == 1
            colors = [color(4) ,color(6), color(3) ,color(2) ,color(5) ,color(1)]; 
%             colors
        elseif indic == 2
            colors = [color(3), color(5) ,color(2) ,color(4), color(1), color(6)]; 
        elseif indic == 3
            colors = [color(1) ,color(2) ,color(4), color(5), color(6) ,color(3)]; 
        end
    case 'counter'
        if indic == 1
            colors = [color(6), color(4), color(3) ,color(1), color(5), color(2)]; 
        elseif indic == 2            
            colors = [color(5), color(3), color(1), color(4) ,color(2), color(6)];
        elseif indic == 3
            colors = [color(1), color(2), color(6) ,color(3), color(4), color(5)]; 
        end
end