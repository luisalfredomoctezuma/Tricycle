global triciclo alfa vAngular vLineal phi ICC;
for i=1:5

    hold off
    % otros datos
    d1=5; radio=1;  % radio de la llanta delantera
    R=d1*tan((90-alfa)*pi/180)
    %if R>100, R=0;end
    vLineal=(vAngular*pi/180)*radio;
    vLineal=(vLineal*cosd(alfa));

    phi=(atan((vAngular*pi/180)/sqrt(d1^2+R^2)))*180/pi;
    triciclo(3,:)=phi;
    %ICC=[R ((triciclo(2,1)+triciclo(2,3))/2)]  % CCI
    
    centro=[((triciclo(1,1)+triciclo(1,3))/2),((triciclo(2,1)+triciclo(2,3))/2) ]
    ICC=[centro(1)-R*sind(phi),centro(2)+R*cosd(phi)] 
if(R<10000000000000)

    %if alfa<0, phi=phi; end
    for j=1:3
        punto=[triciclo(1,j)-ICC(1);
               triciclo(2,j)-ICC(2);
               phi];

        ICCmas=[ICC(1);
                ICC(2);
                phi];
        mRot=[cosd(phi)  -sind(phi) 0;
              sind(phi)  cosd(phi)  0;
              0                    0                    0];  
        nx=mRot*punto+ICCmas;
        tempo(1,j)=nx(1);
        tempo(2,j)=nx(2);
        tempo(3,j)=nx(3);
    end
    triciclo=tempo;
else  % revisar para donde aumentar, para donde apunte la llanta delantera
	for i=1:3 
	triciclo(1,i)=triciclo(1,i)+ vLineal*sind(phi);
	triciclo(2,i)=triciclo(2,i)+ vLineal*cosd(phi);
    %phi=phi; % no es necesario, pero lo dejare asi
	end
end





    %Llantas
    plot(triciclo(1,1),triciclo(2,1),'ro','LineWidth',5), hold on
    plot(triciclo(1,2),triciclo(2,2),'ro','LineWidth',5), hold on
    plot(triciclo(1,3),triciclo(2,3),'ro','LineWidth',5), hold on

    line([triciclo(1,1) triciclo(1,2)],[triciclo(2,1) triciclo(2,2)],'color','black','LineWidth',2); hold on
    line([triciclo(1,1) triciclo(1,3)],[triciclo(2,1) triciclo(2,3)],'color','red','LineWidth',2); hold on
    line([triciclo(1,2) triciclo(1,3)],[triciclo(2,2) triciclo(2,3)],'color','black','LineWidth',2); hold on



    set(handles.text8,'string',vAngular)  
	set(handles.text9,'string',vLineal)  
    set(handles.text11,'string',alfa)  
    set(handles.text5,'string',triciclo(1,2))  
    set(handles.text6,'string',triciclo(2,2))  

    %axes(handles.axes1); 
    xlabel('x'); ylabel('y');
    title('Triciclo');axis([-100 100 0 100]),grid on
    pause(0.1)
end
