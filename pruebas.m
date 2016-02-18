clear,clc
triciclo=[-3  0  3;
           1  6  1;
           90 90 90]
ICC=[4 1];
phi=90;
vAngular=90;
d1=5; radio=1;
R=d1*tan((90-alfa)*pi/180);

if R>100, R=0;end
vLineal=(vAngular*pi/180)*radio;
vLineal=(vLineal*cosd(alfa));
CCI=[R triciclo(2,1)]  % CCI

for i=1:3
p1=[triciclo(1,i)-ICC(1);
    triciclo(2,i)-ICC(2);
    phi];
       
ICCmas=[ICC(1);
        ICC(2);
        vAngular];
mRot=[cosd(vAngular)  -sind(vAngular) 0;
      sind(vAngular)  cosd(vAngular)  0;
      0                    0                    0];  
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

    line([hola(1,1) hola(1,2)],[hola(2,1) hola(2,2)],'color','black','LineWidth',2); hold on
    line([hola(1,1) hola(1,3)],[hola(2,1) hola(2,3)],'color','red','LineWidth',2); hold on
    line([hola(1,2) hola(1,3)],[hola(2,2) hola(2,3)],'color','black','LineWidth',2); hold on    
    

    xlabel('x'); ylabel('y');
    title('Triciclo');axis([-100 100 0 100]),grid on