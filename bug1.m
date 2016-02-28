global triciclo alfa vAngular vLineal phi P theta tiempo ruta contador pintaRuta obs1 obs2 obs3 navegar;
global sensorL sensorLL sensorR sensorRR sensorD sensorDD sensorA sensorAA sensorB sensorBB;

P=[(triciclo(1,1)+triciclo(1,3))/2, (triciclo(2,1)+triciclo(2,3))/2];  % centro del vehiculo
Meta(1)=str2double(get(handles.edit1,'String')); Meta(2)=str2double(get(handles.edit2,'String'));
LlantaDelantera=[triciclo(1,2),triciclo(2,2)];
d1=5;
d2=sqrt( (Meta(1)-LlantaDelantera(1))^2 + (Meta(2)-LlantaDelantera(2))^2 )
d3=sqrt( (Meta(1)-P(1))^2 + (Meta(2)-P(2))^2 )
beta=acos( (d2^2-d1^2-d3^2)/(-2*d1*d3) )*180/pi;
error=0.8;

if(Meta(1)<0),beta=beta*-1;end
beta
while theta >= beta-error || theta<=beta+error
	if (theta >=beta-error && theta<=beta+error),tiempo=0;disp('Alineado'),recta=1; break; end
    vAngular=10;
    alfa=beta*3;
    tiempo=1;
    TriciLoco;
end

% navegar de r a g hasta que r==g o se encuentre un obstaculo
if recta==1
    while (LlantaDelantera(1) ~= Meta(1) && LlantaDelantera(2)~=Meta(2))
        LlantaDelantera=[triciclo(1,2),triciclo(2,2)];
        if (LlantaDelantera(1)>=(Meta(1)-error) && LlantaDelantera(1)<=(Meta(1)+error)) || (LlantaDelantera(2)>=(Meta(2)-error) && LlantaDelantera(2)<=Meta(2)+error)
            disp('ya se llego a la meta'),break
        end
        vAngular=45;
        alfa=0;
        tiempo=1;
        TriciLoco;
    end
end

