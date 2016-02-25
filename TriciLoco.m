global triciclo alfa vAngular vLineal phi P theta tiempo ruta contador pintaRuta obs1 obs2 obs3 navegar;
for i=1:tiempo
    hold off
    % otros datos
    d1=5; radio=1;
    R=d1*tan((90-alfa)*pi/180);
    P=[(triciclo(1,1)+triciclo(1,3))/2, (triciclo(2,1)+triciclo(2,3))/2];  % centro del vehiculo
    
    MetaP(1)=str2double(get(handles.edit1,'String')); MetaP(2)=str2double(get(handles.edit2,'String'));
    LlantaDelanteraP=[triciclo(1,2),triciclo(2,2)];
    
contador=contador+1;
ruta(contador,1)=(P(1));
ruta(contador,2)=(P(2));
if pintaRuta==1
    for kk=1:contador
        plot(ruta(kk,1),ruta(kk,2),'black.'), hold on
    end
end
    
    vLineal=(vAngular*pi/180)*radio;
    phi=(atan((vAngular*pi/180)/sqrt(d1^2+R^2)))*180/pi;
    CCI=[(P(1)+R*cosd(theta)) , (P(2)-R*sind(theta)) ];    
    
    
     if(R>1000000)
         for j=1:3
             triciclo(1,j)=triciclo(1,j)+vLineal*sind(theta);
             triciclo(2,j)=triciclo(2,j)+vLineal*cosd(theta);
         end
     else
         if alfa<0,phi=phi*-1;end
            for jj=1:3
                punto=[triciclo(1,jj)-CCI(1);
                       triciclo(2,jj)-CCI(2);
                       0];
                ICCmas=[CCI(1);
                        CCI(2);
                        0];
                mRot=[cosd(phi)   sind(phi)   0;
                      -sind(phi)  cosd(phi)   0;
                      0                0    1]; 
                nx=mRot*punto+ICCmas;
                tempo(1,jj)=nx(1);
                tempo(2,jj)=nx(2);
                tempo(3,jj)=nx(3);
            end
            triciclo=tempo;
            theta=theta+phi;
            
            if(theta>=360),theta=theta-360;end
            if(theta<-360),theta=theta+360;end
            %theta=mod(theta,360);
     end
    P=[(triciclo(1,1)+triciclo(1,3))/2, (triciclo(2,1)+triciclo(2,3))/2];  % centro del vehiculo, para actualizar en el mismo tiempo
    for k=1:3
        plot(triciclo(1,k),triciclo(2,k),'ro','LineWidth',5), hold on
    end
    
    % obs1
    fill(obs1(1,:),obs1(2,:),'black'); hold on
    % obs2    
    fill(obs2(1,:),obs2(2,:),'black'); hold on
 	% obs2    
    fill(obs3(1,:),obs3(2,:),'black'); hold on
    
    line([triciclo(1,1) triciclo(1,2)],[triciclo(2,1) triciclo(2,2)],'color','black','LineWidth',2); hold on
    line([triciclo(1,1) triciclo(1,3)],[triciclo(2,1) triciclo(2,3)],'color','red','LineWidth',2); hold on
    line([triciclo(1,2) triciclo(1,3)],[triciclo(2,2) triciclo(2,3)],'color','black','LineWidth',2); hold on

    % meta   
    if(MetaP(1) ~=0 && MetaP(2) ~=0)
       plot(MetaP(1),MetaP(2),'greenx')
    end
    
    if(CCI(1)>1000000),CCIP='inf';else CCIP=CCI(1);end
    set(handles.text5,'string', P(1))  
    set(handles.text6,'string',P(2))  
    set(handles.text8,'string', vAngular)  
	set(handles.text9,'string', vLineal)  
    set(handles.text11,'string',alfa) 
	set(handles.text13,'string',theta)
	set(handles.text15,'string',CCIP)
	set(handles.text16,'string',CCI(2))    
    xlabel('x'); ylabel('y');
    title('Triciclo');axis([-100 100 -100 100]),grid on
    pause(0.2)
end