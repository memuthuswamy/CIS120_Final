function levelPick(~,~)
 
% Gets current axes and figure and clears for use in this
% function 
fig = gcf; 
clf(fig,'reset'); 
ax = axes(fig); 
set(ax, 'visible', 'off');
set(fig, 'color', 'k'); 

% page title 
text(.5,1,'Pick a Level:', 'HorizontalAlignment', 'center','FontSize',32,'FontName' , 'Impact', 'Color', 'b')

% All pushbuttons call the levelAssign function with the identity
% of the button pressed 
% Pushbutton to choose level 1
uicontrol('Style','pushbutton','Units','Normalized','Position',...
    [0.15 0.6 0.1 0.2],'String','1','Callback',{@levelAssign,1});

% Pushbutton to choose level 2
uicontrol('Style','pushbutton','Units','Normalized','Position',...
    [0.35 0.6 0.1 0.2],'String','2','Callback',{@levelAssign,2});

% Pushbutton to choose level 3
uicontrol('Style','pushbutton','Units','Normalized','Position',...
    [0.55 0.6 0.1 0.2],'String','3','Callback',{@levelAssign,3});

% Pushbutton to choose level 4
uicontrol('Style','pushbutton','Units','Normalized','Position',...
    [0.75 0.6 0.1 0.2],'String','4','Callback',{@levelAssign,4});

% Pushbutton to choose level 5
uicontrol('Style','pushbutton','Units','Normalized','Position',...
    [0.15 0.3 0.1 0.2],'String','5','Callback',{@levelAssign,5});

% Pushbutton to choose level 6
uicontrol('Style','pushbutton','Units','Normalized','Position',...
    [0.35 0.3 0.1 0.2],'String','6','Callback',{@levelAssign,6});

% Pushbutton to choose level 7
uicontrol('Style','pushbutton','Units','Normalized','Position',...
    [0.55 0.3 0.1 0.2],'String','7','Callback',{@levelAssign,7});

% Pushbutton to choose level 8
uicontrol('Style','pushbutton','Units','Normalized','Position',...
    [0.75 0.3 0.1 0.2],'String','8','Callback',{@levelAssign,8});




