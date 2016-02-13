global llanta1A llanta1B llanta2A llanta2B llanta3A llanta3B;
global alfa alfaR theta;
global tiempo vAngular vLineal;
global E1 E2 E3 E4;
global arrancar;
hold off
% otros datos
d1=4;  d2=6; radio=0.5;  % radio de la llanta delantera 

% % centro de la llanta
% Xc=(llanta3B(1)+llanta3A(1))/2;  Yc=(llanta3B(2)+llanta3A(2))/2;
%     % Rotacion de parte A de la llanta
%     x1=llanta3A(1); y1=llanta3A(2);
%     Nx1=Xc+(x1-Xc)*cosd(alfa)-(y1-Yc)*sind(alfa);  Ny1=Yc+(x1-Xc)*sind(alfa)+(y1-Yc)*cosd(alfa);
%     plot(Nx1,Ny1,'ro'), hold on
%     % Rotacion de parte B de la llanta
%     x2=llanta3B(1); y2=llanta3B(2);
%     Nx2=Xc+(x2-Xc)*cosd(alfa)-(y2-Yc)*sind(alfa);  Ny2=Yc+(x2-Xc)*sind(alfa)+(y2-Yc)*cosd(alfa);
%     plot(Nx2,Ny2,'ro'), hold on

% % Eje L1
% E1(1)=(llanta1B(1)+llanta1A(1))/2;  E1(2)=(llanta1B(2)+llanta1A(2))/2;
% E2(1)=(llanta2B(1)+llanta2A(1))/2;  E2(2)=(llanta2B(2)+llanta2A(2))/2;
% 
% % Eje L2
% E3(1)=(E1(1)+E2(1))/2;  E3(2)=(E1(2)+E2(2))/2;
% E4(1)=(llanta3B(1)+llanta3A(1))/2;  E4(2)=(llanta3B(2)+llanta3A(2))/2;



% % Grafica llantas
% line([llanta1A(1) llanta1B(1)],[llanta1A(2) llanta1B(2)],'color','black','LineWidth',15)
% hold on
% line([llanta2A(1) llanta2B(1)],[llanta2A(2) llanta2B(2)],'color','black','LineWidth',15)
% hold on
% line([Nx1 Nx2],[Ny1 Ny2],'color','red','LineWidth',15)
% hold on
% 
% % grafica ejes
% line([E1(1) E2(1)],[E1(2) E2(2)],'color','black','LineWidth',5)
% hold on
% line([E3(1) E4(1)],[E3(2) E4(2)],'color','black','LineWidth',5)
% hold on    
    

%if(arrancar==1)
    for i=1:tiempo
        hold off
        R=-1*d1*tan((90-alfa)*pi/180);
        vAngular=vLineal/sqrt(d1^2+R^2)
        
        llanta3A(1)= llanta3A(1)+ vLineal*cosd(alfa+90);
        llanta3A(2)= llanta3A(2)+ vLineal*sind(alfa+90);
        llanta3B(1)= llanta3B(1)+ vLineal*cosd(alfa+90);
        llanta3B(2)= llanta3B(2)+ vLineal*sind(alfa+90);
        
        llanta1A(1)= llanta1A(1)+ vLineal*cosd(alfa+90);
        llanta1A(2)= llanta1A(2)+ vLineal*sind(alfa+90);
        llanta1B(1)= llanta1B(1)+ vLineal*cosd(alfa+90);
        llanta1B(2)= llanta1B(2)+ vLineal*sind(alfa+90);
        
        llanta2A(1)= llanta2A(1)+ vLineal*cosd(alfa+90);
        llanta2A(2)= llanta2A(2)+ vLineal*sind(alfa+90);
        llanta2B(1)= llanta2B(1)+ vLineal*cosd(alfa+90);
        llanta2B(2)= llanta2B(2)+ vLineal*sind(alfa+90);
        
        
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
        % line([Nx1 Nx2],[Ny1 Ny2],'color','red','LineWidth',15)
        % hold on

        % grafica ejes
        line([E1(1) E2(1)],[E1(2) E2(2)],'color','black','LineWidth',5)
        hold on
        line([E3(1) E4(1)],[E3(2) E4(2)],'color','black','LineWidth',5)
        hold on    
        
        
        Xc=(llanta3B(1)+llanta3A(1))/2;  Yc=(llanta3B(2)+llanta3A(2))/2;
        % Rotacion de parte A de la llanta
        x1=llanta3A(1); y1=llanta3A(2);
        Nx1=Xc+(x1-Xc)*cosd(alfa)-(y1-Yc)*sind(alfa);  Ny1=Yc+(x1-Xc)*sind(alfa)+(y1-Yc)*cosd(alfa);
        plot(Nx1,Ny1,'ro'), hold on
        % Rotacion de parte B de la llanta
        x2=llanta3B(1); y2=llanta3B(2);
        Nx2=Xc+(x2-Xc)*cosd(alfa)-(y2-Yc)*sind(alfa);  Ny2=Yc+(x2-Xc)*sind(alfa)+(y2-Yc)*cosd(alfa);
        plot(Nx2,Ny2,'ro'), hold on
        line([Nx1 Nx2],[Ny1 Ny2],'color','red','LineWidth',15)
        hold on

    end
%end




% % Eje L1
% E1(1)=(llanta1B(1)+llanta1A(1))/2;  E1(2)=(llanta1B(2)+llanta1A(2))/2;
% E2(1)=(llanta2B(1)+llanta2A(1))/2;  E2(2)=(llanta2B(2)+llanta2A(2))/2;
% 
% % Eje L2
% E3(1)=(E1(1)+E2(1))/2;  E3(2)=(E1(2)+E2(2))/2;
% E4(1)=(llanta3B(1)+llanta3A(1))/2;  E4(2)=(llanta3B(2)+llanta3A(2))/2;
% 
% 
% 
% % Grafica llantas
% line([llanta1A(1) llanta1B(1)],[llanta1A(2) llanta1B(2)],'color','black','LineWidth',15)
% hold on
% line([llanta2A(1) llanta2B(1)],[llanta2A(2) llanta2B(2)],'color','black','LineWidth',15)
% hold on
% line([Nx1 Nx2],[Ny1 Ny2],'color','red','LineWidth',15)
% hold on
% 
% % grafica ejes
% line([E1(1) E2(1)],[E1(2) E2(2)],'color','black','LineWidth',5)
% hold on
% line([E3(1) E4(1)],[E3(2) E4(2)],'color','black','LineWidth',5)
% hold on

set(handles.text7,'string',alfa)  
set(handles.text11,'string',E4(1))
set(handles.text12,'string',E4(2))

axes(handles.axes1); xlabel('x'); ylabel('y'); %zlabel('z')
title('Triciclo');axis([-30 30 0 30]),grid on