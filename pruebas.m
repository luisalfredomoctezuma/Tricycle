clear,clc
% % v=1;
% % alfa=45;
% % d1=4;
% % t=5;
% %R=-d1*tan((90-alfa)*pi/180)
% % W=v/sqrt( d1^2+ R^2)
% % 
% % x=1;   y=2;
% % 
% % for i=1:t-1
% %     t=t-1;
% % 	x=x -R*W*sind(alfa)
% %     y=y +R*W*cosd(alfa)
% % 	W=(R*W*sind(alfa))/d1  % en 90 no se incrementa
% %     R=-d1*tan((90-alfa)*pi/180)
% %     
% %     v=v*cosd(alfa)
% %     alfa=W*alfa
% %     pause(0.5)
% % end
% 
% theta=45;
% v=1;  w=1;
% alfa=45;
% 
% x=4; y=6;
% 
% tiempo=4;
%              
% for i=1: tiempo
%     R=4*tan((90-alfa)*pi/180);
%         coordenadas=[x;y;theta];
%     MRot=[cosd(theta)   0;
%           sind(theta)  0;
%           0             1];
%     velocidades=[v;
%                  w];
%     ope=MRot*velocidades;
%     coordenadas=coordenadas+ope
%     x=coordenadas(1);
%     y=coordenadas(2);
%     theta=coordenadas(3);
%     %v=R*w;
%     %alfa=w*alfa;
%     %w=(v/4)*(sind(alfa))
% end


punto=[0 1,1];
llanta1A=[1,0,0;
         0,1,0;
         3,-1,1];
llanta1B=[1,0,0;
         0,1,0;
         3,1,1];
llanta2A=[1,0,0;
         0,1,0;
         -3,-1,1];
llanta2B=[1,0,0;
         0,1,0;
         -3,1,1];
llanta3A=[1,0,0;
         0,1,0;
         0,3,1];     
llanta3B=[1,0,0;
         0,1,0;
         0,5,1];     
     
pLlanta1A=punto*llanta1A; pLlanta1B=punto*llanta1B;
pLlanta2A=punto*llanta2A; pLlanta2B=punto*llanta2B;
pLlanta3A=punto*llanta3A; pLlanta3B=punto*llanta3B;

centroLl3X=(pLlanta3A(1)+pLlanta3B(1))/2;
centroLl3Y=(pLlanta3A(2)+pLlanta3B(2))/2;
%Xc=(llanta3B(1)+llanta3A(1))/2;  Yc=(llanta3B(2)+llanta3A(2))/2;

mrot=[cosd(alfa) 0;
      sind(alfa) 0;
      0          1];
velocidades=[ vLineal;
              w];

npunto=
