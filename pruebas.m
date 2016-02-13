clear,clc
% v=1;
% alfa=45;
% d1=4;
% t=5;
%R=-d1*tan((90-alfa)*pi/180)
% W=v/sqrt( d1^2+ R^2)
% 
% x=1;   y=2;
% 
% for i=1:t-1
%     t=t-1;
% 	x=x -R*W*sind(alfa)
%     y=y +R*W*cosd(alfa)
% 	W=(R*W*sind(alfa))/d1  % en 90 no se incrementa
%     R=-d1*tan((90-alfa)*pi/180)
%     
%     v=v*cosd(alfa)
%     alfa=W*alfa
%     pause(0.5)
% end

theta=45;
v=1;  w=1;
alfa=45;

x=4; y=6;

tiempo=4;
             
for i=1: tiempo
    R=4*tan((90-alfa)*pi/180);
        coordenadas=[x;y;theta];
    MRot=[cosd(theta)   0;
          sind(theta)  0;
          0             1];
    velocidades=[v;
                 w];
    ope=MRot*velocidades;
    coordenadas=coordenadas+ope
    x=coordenadas(1);
    y=coordenadas(2);
    theta=coordenadas(3);
    %v=R*w;
    %alfa=w*alfa;
    %w=(v/4)*(sind(alfa))
end

