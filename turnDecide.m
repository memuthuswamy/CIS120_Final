function turnDecide(x1,y1,z1,x2,y2,z2)

% establish global variables 
global objMtx1 objMtx2 objMtx3 %bottomleftFront bottomrightFront bottomleftBack bottomrightBack topleftFront toprightFront topleftBack toprightBack 

% identify the first and second cubes that were first clicked
% and assign them to variable 
for i = 1:numel(objMtx1)
    if x1 >= (objMtx1{i}.x0 - eps) && x1 <= (objMtx1{i}.x0 + 1 + eps)
        if y1 >= (objMtx1{i}.y0 - eps) && y1 <= (objMtx1{i}.y0 + 1 +eps)
            if z1 >= (objMtx1{i}.z0 - eps) && z1 <= (objMtx1{i}.z0 + 1 + eps)
                iOne = objMtx1{i}; 
            end
        end
    end
    if x2 >= (objMtx1{i}.x0 - eps) && x2 <= (objMtx1{i}.x0 + 1 + eps)
        if y2 >= (objMtx1{i}.y0 - eps) && y2 <= (objMtx1{i}.y0 + 1 + eps)
            if z2 >= (objMtx1{i}.z0 - eps) && z2 <= (objMtx1{i}.z0 + 1 + eps)
                iTwo = objMtx1{i};
            end
        end
    end
end

% iOne 
% iTwo

% For a different combination of first and second clicks, a
% different set of rotations need to take place

% if the y-coordinate is the same between the two cubes, then a
% y-rot needs to take place
if iOne.x0 ~= iTwo.x0 && iOne.z0 ~= iTwo.z0 
%     based on the layer that was clicked a variable is assigned
%     and the objArray is set to the matrix of that layer
    if iOne.y0 == 0
        numLayer = 0;
        objArray = objMtx1(:,:,1);
    else
        numLayer = 1;
        objArray = objMtx1(:,:,2);
    end
%     if the x-coord of the first cube is greater than the second
%     then a counterclockwise turn should occur, otherwise
%     clockwise
%     horzShift is called with the object layer array, the
%     direction turned, an idicators of the layer
    if iOne.x0 > iTwo.x0
        horzShift(objArray,'counter',1,numLayer) 
    else
        horzShift(objArray,'clock',1,numLayer) 
    end
% if the x-coordinate is the same between the two cubes, then a
% x-rot needs to take place
elseif iOne.y0 ~= iTwo.y0 && iOne.z0 ~= iTwo.z0
%     based on the layer that was clicked a variable is assigned
%     and the objArray is set to the matrix of that layer
    if iOne.x0 == 0
        numLayer = 0;
        objArray = objMtx2(:,:,1);
    else
        numLayer = 1;
        objArray = objMtx2(:,:,2);
    end
%     if the z-coord of the first cube is greater than the second
%     then a counterclockwise turn should occur, otherwise
%     clockwise
%     horzShift is called with the object layer array, the
%     direction turned, an idicators of the layer
     if iOne.z0 > iTwo.z0
        horzShift(objArray,'counter',2,numLayer)
     else
        horzShift(objArray,'clock',2,numLayer)
     end
% if the z-coordinate is the same between the two cubes, then a
% z-rot needs to take place
elseif iOne.x0 ~= iTwo.x0 && iOne.y0 ~= iTwo.y0
%     based on the layer that was clicked a variable is assigned
%     and the objArray is set to the matrix of that layer
    if iOne.z0 == 0
        numLayer = 0;
        objArray = objMtx3(:,:,1);
    else
        numLayer = 1;
        objArray = objMtx3(:,:,2);
    end
%     if the y-coord of the first cube is greater than the second
%     then a counterclockwise turn should occur, otherwise
%     clockwise
%     horzShift is called with the object layer array, the
%     direction turned, an idicators of the layer
    if iOne.y0 > iTwo.y0
        horzShift(objArray,'counter',3,numLayer)
    else
        horzShift(objArray,'clock',3,numLayer)
    end
end

