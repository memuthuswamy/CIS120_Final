function finishMessage()
% Gets current axes and figure and clears for use in this
% function 
fig = gcf; 
clf(fig,'reset'); 
ax = axes(fig); 
set(ax, 'visible', 'off');
set(fig, 'color', 'k'); 


% finish message
text(.5,1,'YAY! You''ve solved the cube!', 'HorizontalAlignment', 'center','FontSize',32,'FontName' , 'Impact', 'Color', 'b')
text(.5,.8,'Try another level!', 'HorizontalAlignment', 'center','FontSize',32,'FontName' , 'Impact', 'Color', 'b')


% Button to go back to the levelPick page
uicontrol('Style','pushbutton','Units','Normalized','Position',...
    [0.4 .3 0.20 .2],'String','Back to Levels','FontSize', 14,'Callback',@levelPick);