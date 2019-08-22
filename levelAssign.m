function levelAssign(~,~,levelNum)

% Establish global variables for references in other functions
global objMtx1 objMtx2 objMtx3 bottomleftFront bottomrightFront bottomleftBack bottomrightBack topleftFront toprightFront topleftBack toprightBack solved 

% Reference matrix for a solved cube 
solved = [['y', 'k', 'r','k', 'k', 'g'];
    ['y', 'k', 'r', 'b','k', 'k'];
    ['k', 'w', 'r', 'k','k', 'g'];
    ['k', 'w', 'r','b', 'k', 'k'];
    ['y', 'k', 'k', 'k','m', 'g'];
    ['y', 'k', 'k', 'b','m', 'k'];
    ['k', 'w', 'k', 'k','m', 'g'];
    ['k', 'w', 'k', 'b','m', 'k']];

% The following matrices correspond to the colors that will be
% assigned to the cube objects for each level
% Level 1
list2(:,:,1) = [['g', 'k', 'r','k', 'k', 'w'];
    ['m', 'k', 'g', 'y','k', 'k'];
    ['k', 'w', 'b', 'k','k', 'r'];
    ['k', 'w', 'm','g', 'k', 'k'];
    ['y', 'k', 'k', 'k','b', 'm'];
    ['g', 'k', 'k', 'r','y', 'k'];
    ['k', 'b', 'k', 'k','m', 'w'];
    ['k', 'y', 'k', 'b','r', 'k']];

% Level 2
list2(:,:,2) = [['m', 'k', 'y','k', 'k', 'g'];
    ['w', 'k', 'm', 'b','k', 'k'];
    ['k', 'g', 'm', 'k','k', 'w'];
    ['k', 'y', 'b','r', 'k', 'k'];
    ['y', 'k', 'k', 'k','b', 'm'];
    ['w', 'k', 'k', 'b','r', 'k'];
    ['k', 'r', 'k', 'k','w', 'g'];
    ['k', 'y', 'k', 'r','g', 'k']];

% Level 3
list2(:,:,3) = [['g', 'k', 'r','k', 'k', 'w'];
    ['b', 'k', 'r', 'w','k', 'k'];
    ['k', 'y', 'm', 'k','k', 'g'];
    ['k', 'm', 'w','b', 'k', 'k'];
    ['y', 'k', 'k', 'k','b', 'm'];
    ['r', 'k', 'k', 'b','y', 'k'];
    ['k', 'r', 'k', 'k','g', 'y'];
    ['k', 'm', 'k', 'g','w', 'k']];

% Level 4
list2(:,:,4) = [['w', 'k', 'm','k', 'k', 'g'];
    ['m', 'k', 'b', 'w','k', 'k'];
    ['k', 'r', 'b', 'k','k', 'y'];
    ['k', 'r', 'g','y', 'k', 'k'];
    ['y', 'k', 'k', 'k','b', 'm'];
    ['r', 'k', 'k', 'w','b', 'm'];
    ['k', 'm', 'k', 'k','y', 'g'];
    ['k', 'g', 'k', 'r','w', 'k']];

% Level 5
list2(:,:,5) = [['w', 'k', 'g','k', 'k', 'r'];
    ['y', 'k', 'g', 'r','k', 'k'];
    ['k', 'y', 'r', 'k','k', 'b'];
    ['k', 'w', 'm','g', 'k', 'k'];
    ['y', 'k', 'k', 'k','b', 'm'];
    ['b', 'k', 'k', 'r','w', 'k'];
    ['k', 'y', 'k', 'k','g', 'm'];
    ['k', 'b', 'k', 'm','w', 'k']];

% Level 6
list2(:,:,6) = [['w', 'k', 'b','k', 'k', 'm'];
    ['w', 'k', 'g', 'm','k', 'k'];
    ['k', 'y', 'g', 'k','k', 'r'];
    ['k', 'g', 'r','w', 'k', 'k'];
    ['y', 'k', 'k', 'k','b', 'm'];
    ['b', 'k', 'k', 'r','w', 'k'];
    ['k', 'm', 'k', 'k','y', 'g'];
    ['k', 'b', 'k', 'r','y', 'k']];

% Level 7
list2(:,:,7) = [['w', 'k', 'b','k', 'k', 'm'];
    ['w', 'k', 'g', 'm','k', 'k'];
    ['k', 'r', 'g', 'k','k', 'w'];
    ['k', 'r', 'y','b', 'k', 'k'];
    ['y', 'k', 'k', 'k','b', 'm'];
    ['g', 'k', 'k', 'r','m', 'k'];
    ['k', 'w', 'k', 'k','r', 'b'];
    ['k', 'r', 'k', 'g','y', 'k']];

% Level 8
list2(:,:,8) = [['g', 'k', 'r','k', 'k', 'w'];
    ['b', 'k', 'w', 'm','k', 'k'];
    ['k', 'y', 'r', 'k','k', 'b'];
    ['k', 'r', 'y','b', 'k', 'k'];
    ['y', 'k', 'k', 'k','b', 'm'];
    ['y', 'k', 'k', 'm','g', 'k'];
    ['k', 'r', 'k', 'k','b', 'w'];
    ['k', 'g', 'k', 'w','m', 'k']];


% Gets current figure and clears for use in the current function
fig = gcf;
clf(fig,'reset');
ax = axes(fig);
set(ax, 'visible', 'off');
set(fig, 'color', 'white');


% Using the above matrices for the color of each cube, global
% cube objects are created with specific names and references
bottomleftFront = rPiece(list2(1,:,levelNum), [0,0,0],'bottomLeftFront');
bottomrightFront = rPiece(list2(2,:,levelNum), [1,0,0],'bottomRightFront');
topleftFront = rPiece(list2(3,:,levelNum), [0,0,1],'topLeftFront');
toprightFront = rPiece(list2(4,:,levelNum), [1,0,1],'topRightFront');

bottomleftBack = rPiece(list2(5,:,levelNum), [0,1,0],'bottomLeftBack');
bottomrightBack = rPiece(list2(6,:,levelNum), [1,1,0],'bottomrightBack');
topleftBack = rPiece(list2(7,:,levelNum), [0,1,1],'topleftBack');
toprightBack = rPiece(list2(8,:,levelNum), [1,1,1],'toprightBack');

% In order to reference movement in the three degrees of freedom
% allowed in a rubik's cube, three 3D matrices are created to
% represent the order of the cube objects in these layers
% 
% X-dir turns 
objMtx1 = {};
objMtx1(:,:,1)= {topleftFront, toprightFront; bottomleftFront, bottomrightFront;};
objMtx1(:,:,2)= {topleftBack, toprightBack; bottomleftBack, bottomrightBack;};

% Y-dir turns 
objMtx2 = {};
objMtx2(:,:,1)= {topleftBack, topleftFront; bottomleftBack, bottomleftFront;};
objMtx2(:,:,2)= {toprightBack, toprightFront; bottomrightBack, bottomrightFront;};

% Z-dir turns 
objMtx3 = {};
objMtx3(:,:,1)= {bottomleftBack, bottomrightBack; bottomleftFront, bottomrightFront;};
objMtx3(:,:,2)= {topleftBack, toprightBack; topleftFront, toprightFront;};

hold on

% Call to the twoByTwo function which will handle what move is
% made
twoByTwo();
