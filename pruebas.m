clear,clc
triciclo=[-3 0 3;
           1 6 1;
           0 0 0];
% teta es el angulo que lleva rotado el vehiculo
alfa=22.5; teta=90;
d1=5; radio=1;
R=d1*tan((90-alfa)*pi/180)

vAngular=180;
vLineal=(vAngular*pi/180)*radio;
vLineal=(vLineal*cosd(alfa))
if R>100, R=0;end

ICC=[R triciclo(2,1)]  % CCI

phi=(atan((vAngular*pi/180)/sqrt(d1^2+R^2)))*180/pi
%triciclo(3,:)=phi;

    
% 
if(R>0)
%     mRot=[cosd(phi) -sind(phi) 0;
%           sind(phi) cosd(phi)  0;
%           0              0            0];      
    for j=1:3
        punto=[triciclo(1,j)-ICC(1);
               triciclo(2,j)-ICC(2);
               vAngular];

        ICCmas=[ICC(1);
                ICC(2);
                vAngular];
        mRot=[cosd(vAngular)  sind(vAngular) 0;
              -sind(vAngular)  cosd(vAngular)  0;
              0                    0                    0];  
        nx=mRot*punto+ICCmas;
        tempo(1,j)=nx(1);
        tempo(2,j)=nx(2);
        tempo(3,j)=nx(3);
    end
    triciclo=tempo;
else
 triciclo(1,1)=triciclo(1,1)+ vLineal*cosd(90);
 triciclo(2,1)=triciclo(2,1)+ vLineal*sind(90);
 triciclo(1,2)=triciclo(1,2)+ vLineal*cosd(90);
 triciclo(2,2)=triciclo(2,2)+ vLineal*sind(90);
 triciclo(1,3)=triciclo(1,3)+ vLineal*cosd(90);
 triciclo(2,3)=triciclo(2,3)+ vLineal*sind(90);
%teta=teta; % en este caso teta se tiene que quedar igual
end


if R>100, R=0;end
ICC
for i=1:3
p1=[triciclo(1,i);
    triciclo(2,i);
    teta];
       
ICCmas=[ICC(1);
        ICC(2);
        vAngular];
mRot=[cosd(teta)  -sind(teta) 0;
      sind(teta)  cosd(teta)  0;
      0          0            0];  
%nx=mRot*p1+ICCmas;
nx=mRot*p1+ICCmas;
hola(1,i)=nx(1);
hola(2,i)=nx(2);
hola(3,i)=nx(3);
end
hola
%Llantas
    plot(triciclo(1,1),triciclo(2,1),'ro','LineWidth',5), hold on
    plot(triciclo(1,2),triciclo(2,2),'ro','LineWidth',5), hold on
    plot(triciclo(1,3),triciclo(2,3),'ro','LineWidth',5), hold on

    line([triciclo(1,1) triciclo(1,2)],[triciclo(2,1) triciclo(2,2)],'color','black','LineWidth',2); hold on
    line([triciclo(1,1) triciclo(1,3)],[triciclo(2,1) triciclo(2,3)],'color','red','LineWidth',2); hold on
    line([triciclo(1,2) triciclo(1,3)],[triciclo(2,2) triciclo(2,3)],'color','black','LineWidth',2); hold on

    plot(hola(1,1),hola(2,1),'ro','LineWidth',5), hold on
    plot(hola(1,2),hola(2,2),'ro','LineWidth',5), hold on
    plot(hola(1,3),hola(2,3),'ro','LineWidth',5), hold on

    line([hola(1,1) hola(1,2)],[hola(2,1) hola(2,2)],'color','green','LineWidth',2); hold on
    line([hola(1,1) hola(1,3)],[hola(2,1) hola(2,3)],'color','m','LineWidth',2); hold on
    line([hola(1,2) hola(1,3)],[hola(2,2) hola(2,3)],'color','green','LineWidth',2); hold on    
    

    xlabel('x'); ylabel('y');
    title('Triciclo');axis([-20 20 -20 20]),grid on