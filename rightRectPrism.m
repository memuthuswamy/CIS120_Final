function rightRectPrism(x0, y0, z0, W, L, T, c)
% The function creates 3D right rectangular prisms
% Melina Muthuswamy 

% global fig 

%Bottom Rectangle
X = [x0,x0+W,x0+W,x0];
Y = [y0,y0,y0+L,y0+L];
Z = [z0,z0,z0,z0];

fill3(X,Y,Z,c(1)); 

hold on 
%Top Rectangle
X = [x0,x0+W,x0+W,x0];
Y = [y0,y0,y0+L,y0+L];
Z = [z0+T,z0+T,z0+T,z0+T];

fill3(X,Y,Z,c(2)); 

hold on
%Front Rectangle
X = [x0,x0,x0+W,x0+W];
Y = [y0,y0,y0,y0];
Z = [z0,z0+T,z0+T,z0];

fill3(X,Y,Z,c(3)); 

hold on

% Right Rectangle 
X = [x0+W,x0+W,x0+W,x0+W];
Y = [y0,y0,y0+L,y0+L];
Z = [z0,z0+T,z0+T,z0];

fill3(X,Y,Z,c(4)); 

hold on

%Back Rectangle
X = [x0,x0,x0+W,x0+W];
Y = [y0+L,y0+L,y0+L,y0+L];
Z = [z0,z0+T,z0+T,z0];

fill3(X,Y,Z,c(5)); 

hold on

% Left Rectangle
X = [x0,x0,x0,x0];
Y = [y0,y0,y0+L,y0+L];
Z = [z0,z0+T,z0+T,z0];

fill3(X,Y,Z,c(6)); 


grid off
set(gca, 'xtick', [], 'ytick', [],'ztick', []); 
 

