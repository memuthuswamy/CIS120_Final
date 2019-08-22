function start()

% close all existing open figure windows
clear; close all; clc; 

%create a global figure window and axes 
global fig ax

% Initialize the figure/gui window and center
ss = get(0,'ScreenSize');
fig = figure('Position',ss.*.5);
set(fig, 'color', 'k'); 
ax = axes(fig); 
set(ax, 'visible', 'off'); 
movegui(fig,'center')

% Game title
text(.5,1,'Beginner''s Rubik''s Cube', 'HorizontalAlignment', 'center','FontSize',32,'FontName' , 'Impact', 'Color', 'b')
text(.5,.8,'The 2x2 for You', 'HorizontalAlignment', 'center','FontSize',32,'FontName' , 'Impact', 'Color', 'b')


% Pushbutton to levelPick
uicontrol('Style','pushbutton','Units','Normalized','Position',...
    [0.4 0.4 0.2 0.2],'String','Start!','FontSize', 20,'Callback',@levelPick);

% Pushbutton to choose howToPlay
uicontrol('Style','pushbutton','Units','Normalized','Position',...
    [0.35 0.1 0.3 0.2],'String','How to Play','FontSize', 20,'Callback',@howToPlay);





