function horzShift(layerArray, dir,indic,numLayer)

% establish global variables 
global objMtx1 objMtx2 objMtx3 bottomleftFront bottomrightFront bottomleftBack bottomrightBack topleftFront toprightFront topleftBack toprightBack solved

% establsh vector of the color matrices of each cube object that is
% being changed and rotated 
objColorArray = {layerArray{1,1}.colors , layerArray{1,2}.colors ,layerArray{2,2}.colors , layerArray{2,1}.colors};  

% for each vector in objColorArray rotate the color assignments
% in each vector 
for i = 1:4
    a{1,i} = rotateArray(dir,objColorArray{1,i},indic);
end

% based on the direction of the turn, reorder the color vectors
% accordingly   
if strcmp(dir,'clock')
    b = {a{:,4} a{:,1:3}};
elseif strcmp(dir,'counter')
    b = {a{:,2}, a{:,3}, a{:,4}, a{:,1}};
end

% reassign the color array property of the cube objects 
layerArray{1,1}.colors = b{1,1};
layerArray{1,2}.colors = b{1,2};
layerArray{2,2}.colors = b{1,3};
layerArray{2,1}.colors = b{1,4};

% based on the type of rotation (x,y,or z) and the layer that was
% rotated,reset the colors property of the cube objects 
if indic == 1
    if numLayer == 1
        topleftBack.colors = layerArray{1,1}.colors;
        toprightBack.colors = layerArray{1,2}.colors;
        bottomrightBack.colors = layerArray{2,2}.colors;
        bottomleftBack.colors = layerArray{2,1}.colors;  
    elseif numLayer == 0
        topleftFront.colors = layerArray{1,1}.colors;
        toprightFront.colors = layerArray{1,2}.colors;
        bottomrightFront.colors = layerArray{2,2}.colors;
        bottomleftFront.colors = layerArray{2,1}.colors;   
    end
elseif indic == 2
    if numLayer ==1 
        toprightBack.colors = layerArray{1,1}.colors;
        toprightFront.colors = layerArray{1,2}.colors;
        bottomrightFront.colors = layerArray{2,2}.colors;
        bottomrightBack.colors = layerArray{2,1}.colors;
    elseif numLayer == 0
        topleftBack.colors = layerArray{1,1}.colors;
        topleftFront.colors = layerArray{1,2}.colors;
        bottomleftFront.colors = layerArray{2,2}.colors;
        bottomleftBack.colors = layerArray{2,1}.colors;
    end
elseif indic == 3
    if numLayer == 1
        topleftBack.colors = layerArray{1,1}.colors;
        toprightBack.colors = layerArray{1,2}.colors;
        toprightFront.colors = layerArray{2,2}.colors;
        topleftFront.colors = layerArray{2,1}.colors;    
    elseif numLayer == 0 
        bottomleftBack.colors = layerArray{1,1}.colors;
        bottomrightBack.colors = layerArray{1,2}.colors;
        bottomrightFront.colors = layerArray{2,2}.colors;
        bottomleftFront.colors = layerArray{2,1}.colors;
    end
end
% Update/reassign the turn direction object vectors 
objMtx1(:,:,1)= {topleftFront, toprightFront; bottomleftFront, bottomrightFront;};
objMtx1(:,:,2)= {topleftBack, toprightBack; bottomleftBack, bottomrightBack;};

objMtx2(:,:,1)= {topleftBack, topleftFront; bottomleftBack, bottomleftFront;};
objMtx2(:,:,2)= {toprightBack, toprightFront; bottomrightBack, bottomrightFront;};

objMtx3(:,:,1)= {bottomleftBack, bottomrightBack; bottomleftFront, bottomrightFront;};
objMtx3(:,:,2)= {topleftBack, toprightBack; topleftFront, toprightFront;};

% Update the cube visualization 
rightRectPrism(layerArray{1,1}.x0, layerArray{1,1}.y0, layerArray{1,1}.z0, layerArray{1,1}.W, layerArray{1,1}.L, layerArray{1,1}.T, layerArray{1,1}.colors)
rightRectPrism(layerArray{1,2}.x0, layerArray{1,2}.y0, layerArray{1,2}.z0, layerArray{1,2}.W, layerArray{1,2}.L, layerArray{1,2}.T, layerArray{1,2}.colors)
rightRectPrism(layerArray{2,2}.x0, layerArray{2,2}.y0, layerArray{2,2}.z0, layerArray{2,2}.W, layerArray{2,2}.L, layerArray{2,2}.T, layerArray{2,2}.colors)
rightRectPrism(layerArray{2,1}.x0, layerArray{2,1}.y0, layerArray{2,1}.z0, layerArray{2,1}.W, layerArray{2,1}.L, layerArray{2,1}.T, layerArray{2,1}.colors)


actual = [bottomleftFront.colors;
bottomrightFront.colors;
topleftFront.colors;
toprightFront.colors;
bottomleftBack.colors;
bottomrightBack.colors;
topleftBack.colors;
toprightBack.colors]; 


if all(all((actual == solved))) 
    finishMessage()
end 
    