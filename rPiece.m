classdef rPiece
%     object that stores the properties of each of the cubes in
%     order to identify them throughout the processe of solving
%     the cube
    properties
        colors %matrix of the colors of the sides of each cube 
        x0 %intital x position 
        y0 %initial y position 
        z0 %intital z position
        W  %width
        L  %length
        T  %height
        name %cube name 
    end
    methods
        %constructor to establish each cube 
        function cube = rPiece(c, xyz,name)
            cube.colors = c; %colors defined as top bottom front right back left of cube  
            cube.x0 = xyz(1);
            cube.y0 = xyz(2);
            cube.z0 = xyz(3); 
            cube.W = 1; 
            cube.L = 1; 
            cube.T = 1; 
            cube.name = name; 
            rightRectPrism(cube.x0, cube.y0, cube.z0, cube.W, cube.L, cube.T, cube.colors) % visulaize cube 
            
        end
    end
end