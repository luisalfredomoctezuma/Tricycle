global llanta1A llanta1B llanta2A llanta2B llanta3A llanta3B;
global  alfa phi;
global vAngular vLineal reversa
hold off
R=0;
% otros datos
d1=4; radio=1;  % radio de la llanta delantera 

if reversa==1, adelanteAtras=-90;else adelanteAtras=+90; end

if(arrancar==1)
        R=-1*d1*tan((90-alfa)*pi/180);
        vLineal=(vAngular*pi/180)*radio; 
        Vs=vAngular;
        vLineal=(vLineal*cosd(alfa));        
%         % Cambio de orientacion del robot, cuanto debe rotar el punto-ref
         phi=((vLineal*180/pi)/d1)*sind(alfa)         
%         if(phi==0),vAngular=Vs;else vAngular=Vs; end
end

% en este punto, rotar phi grados
% centro de la llanta1 para rotacion phi
% este debe ser el R,Y
Xc1=R;  Yc1=(llanta1B(2)+llanta1A(2))/2;
    % Rotacion de parte A de la llanta
    x11=llanta1A(1); y11=llanta1A(2);
    Nx11=Xc1+(x11-Xc1)*cosd(phi)-(y11-Yc1)*sind(phi);  Ny11=Yc1+(x11-Xc1)*sind(phi)+(y11-Yc1)*cosd(phi);
    plot(Nx11,Ny11,'ro'), hold on
    % Rotacion de parte B de la llanta
    x22=llanta1B(1); y2=llanta1B(2);
    Nx22=Xc1+(x22-Xc1)*cosd(phi)-(y2-Yc1)*sind(phi);  Ny22=Yc1+(x22-Xc1)*sind(phi)+(y2-Yc1)*cosd(phi);
    plot(Nx22,Ny22,'ro'), hold on




% centro de la llanta para rotacion alfa
Xc=(llanta3B(1)+llanta3A(1))/2;  Yc=(llanta3B(2)+llanta3A(2))/2;
    % Rotacion de parte A de la llanta
    x1=llanta3A(1); y1=llanta3A(2);
    Nx1=Xc+(x1-Xc)*cosd(alfa)-(y1-Yc)*sind(alfa);  Ny1=Yc+(x1-Xc)*sind(alfa)+(y1-Yc)*cosd(alfa);
    plot(Nx1,Ny1,'ro'), hold on
    % Rotacion de parte B de la llanta
    x2=llanta3B(1); y2=llanta3B(2);
    Nx2=Xc+(x2-Xc)*cosd(alfa)-(y2-Yc)*sind(alfa);  Ny2=Yc+(x2-Xc)*sind(alfa)+(y2-Yc)*cosd(alfa);
    plot(Nx2,Ny2,'ro'), hold on

    
    
% Eje L1
E1(1)=(llanta1B(1)+llanta1A(1))/2;  E1(2)=(llanta1B(2)+llanta1A(2))/2;
E2(1)=(llanta2B(1)+llanta2A(1))/2;  E2(2)=(llanta2B(2)+llanta2A(2))/2;

% Eje L2
E3(1)=(E1(1)+E2(1))/2;  E3(2)=(E1(2)+E2(2))/2;
E4(1)=(llanta3B(1)+llanta3A(1))/2;  E4(2)=(llanta3B(2)+llanta3A(2))/2;


% Grafica llantas
line([llanta1A(1) llanta1B(1)],[llanta1A(2) llanta1B(2)],'color','black','LineWidth',15)
hold on
line([llanta2A(1) llanta2B(1)],[llanta2A(2) llanta2B(2)],'color','black','LineWidth',15)
hold on
line([Nx1 Nx2],[Ny1 Ny2],'color','red','LineWidth',15)
hold on

% grafica ejes
line([E1(1) E2(1)],[E1(2) E2(2)],'color','black','LineWidth',5)
hold on
line([E3(1) E4(1)],[E3(2) E4(2)],'color','black','LineWidth',5)
hold on    



set(handles.text2,'string',alfa)  

axes(handles.axes1); xlabel('x'); ylabel('y');
title('Rueda');axis([-30 30 0 30]),grid on