global alfa vAngular vLineal phi ICC P Pnew;
for i=1:20
    hold off
    % otros datos
    d1=4; radio=1;  % radio de la llanta delantera
    R=d1*tan((90-alfa)*pi/180);
    vLineal=(vAngular*pi/180)*radio;
    vLineal=(vLineal*cosd(alfa));
    
    ICC=[R;P(2);0]
    mRotR=[cosd(vAngular) -sind(vAngular) 0;
           sind(vAngular) cosd(vAngular)  0;
           0              0            0];    
    %ICC=mRotR*ICC
    theta=0;
    ICC=[(P(1)+R*cosd(theta)) , (P(2)-R*sind(theta)) ]
%     traslada=[1,0,Pnew(1);
%               0,1,Pnew(2);
%               0,0,1];
%     test=traslada*ICC
    
    
    %phi=(atan((vAngular*pi/180)/sqrt(d1^2+R^2)))*180/pi;

    if(R<10000000000)
    mRot=[cosd(vAngular) -sind(vAngular) 0;
          sind(vAngular) cosd(vAngular)  0;
          0              0            0];
    pp=[Pnew(1)-ICC(1);
        Pnew(2)-ICC(2);
        Pnew(3)];
    mov=[ICC(1);
         ICC(2);
         vAngular];
    Pnew=mRot*pp+mov
      
    else
    Pnew(1)=Pnew(1)+ vLineal*cosd(vAngular);
    Pnew(2)=Pnew(2)+ vLineal*sind(vAngular);
    end


    % Punto de referencia 
	plot(P(1),P(2),'blacko','LineWidth',5), hold on
    plot(Pnew(1),Pnew(2),'ro','LineWidth',5), hold on


    %Llantas
%     plot(triciclo(1,1),triciclo(2,1),'ro','LineWidth',5), hold on
%     plot(triciclo(1,2),triciclo(2,2),'ro','LineWidth',5), hold on
%     plot(triciclo(1,3),triciclo(2,3),'ro','LineWidth',5), hold on
% 
%     line([triciclo(1,1) triciclo(1,2)],[triciclo(2,1) triciclo(2,2)],'color','black','LineWidth',2); hold on
%     line([triciclo(1,1) triciclo(1,3)],[triciclo(2,1) triciclo(2,3)],'color','red','LineWidth',2); hold on
%     line([triciclo(1,2) triciclo(1,3)],[triciclo(2,2) triciclo(2,3)],'color','black','LineWidth',2); hold on



    set(handles.text7,'string',vAngular)  
	set(handles.text8,'string',vLineal)  
    set(handles.text9,'string',Pnew(1))  
    set(handles.text10,'string',Pnew(2))  
    set(handles.text11,'string',phi)  
    set(handles.text13,'string',alfa)  
    %axes(handles.axes1); 
    xlabel('x'); ylabel('y');
    title('Triciclo');axis([-100 100 0 100]),grid on
    pause(0.1)
end
