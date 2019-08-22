function twoByTwo(varargin)

% Get current figure for use in this function 
fig = gcf;
ax = axes(fig);
set(ax, 'visible', 'off');
set(fig, 'color', 'k');

% Establish global matrix
global objMtx1

% Button to go back to the levelPick page
uicontrol('Style','pushbutton','Units','Normalized','Position',...
    [0.8 0 0.20 .2],'String','Back to Levels','FontSize', 14,'Callback',@levelPick);


% key press function to allow user to change cube view
fig.KeyPressFcn = @viewChange;

% key press function to get identity of the first cube 
fig.WindowButtonDownFcn = @firstLoc;

    function firstLoc(varargin)
%         current axes established as the axes for reference for
%         CurrentPoint
        ax = gca;
        cp1 = ax.CurrentPoint;
        x1 = cp1(1,1);
        y1 = cp1(1,2);
        z1 = cp1(1,3);
%         if x1, y1, and z1 are within the bounds of any of the
%         cube objects the assign the WindowButtonUpFcn to SecondLoc function  
        for j = 1:numel(objMtx1)
            if x1 >= (objMtx1{j}.x0 - eps) && x1 <= (objMtx1{j}.x0 + 1 + eps)
                if y1 >= (objMtx1{j}.y0 - eps) && y1 <= (objMtx1{j}.y0 + 1 + eps)
                    if z1 >= (objMtx1{j}.z0 - eps) && z1 <= (objMtx1{j}.z0 + 1 + eps)
                        fig.WindowButtonUpFcn = {@secondLoc, x1, y1, z1};
                    end
                end
            end
        end
        
        function secondLoc(varargin)
%         current axes established as the axes for reference for
%         CurrentPoint
            ax = gca;
            cp2 = ax.CurrentPoint;
            x2 = cp2(1,1);
            y2 = cp2(1,2);
            z2 = cp2(1,3);
%             if x2, y2, z2 are within the bounds of any of the
%             cube objects then call the turnDecide function
            for i = 1:numel(objMtx1)
                if x2 >= (objMtx1{i}.x0 - eps) && x2 <= (objMtx1{i}.x0 + 1 + eps)
                    if y2 >= (objMtx1{i}.y0 - eps) && y2 <= (objMtx1{i}.y0 + 1 + eps)
                        if z2 >= (objMtx1{i}.z0 - eps) && z2 <= (objMtx1{i}.z0 + 1 + eps)
                            turnDecide(x1,y1,z1,x2,y2,z2)
                        end
                    end
                end
            end
        end
        
    end

end






