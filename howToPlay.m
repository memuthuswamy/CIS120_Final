function howToPlay(varargin)

% Gets current axes and figure and clears for use in this
% function 
fig = gcf; 
clf(fig,'reset'); 
ax = axes(fig); 
set(ax, 'visible', 'off');
set(fig, 'color', 'white'); 

% Text that estblishes the rules for the game 
text(.5,.95,'How to Play', 'HorizontalAlignment', 'center','FontSize',32,'FontName' , 'Impact', 'Color', 'r')
text(0,.7,{'1. Click and drag from CORNER TO CORNER of layer', 'you wish to turn in the direction you wish', 'to turn and then release'}, 'HorizontalAlignment', 'left','FontSize',20,'FontName' , 'Impact', 'Color', 'k')
text(0,.5,'2. Use ''AWSD'' keys to rotate cube left,up,right,and down', 'HorizontalAlignment', 'left','FontSize',20,'FontName' , 'Impact', 'Color', 'k')
text(.5,.3,'That''s it have fun playing!', 'HorizontalAlignment', 'center','FontSize',24,'FontName' , 'Impact', 'Color', 'g')

% Pushbutton to levelPick
uicontrol('Style','pushbutton','Units','Normalized','Position',...
    [0.4 0 0.20 .2],'String','Pick a Level','FontSize', 14,'Callback',@levelPick);


