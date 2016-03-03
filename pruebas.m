% bug1 resp

global triciclo alfa vAngular vLineal phi P theta tiempo ruta contador pintaRuta obs1 obs2 obs3 navegar;
global sensorL sensorLL sensorR sensorRR sensorD sensorDD sensorA sensorAA sensorB sensorBB;
global DO2SD DO2SDD DO2SR DO2SRR DO2SL DO2SLL DO2SA DO2SAA DO2SB DO2SBB;
global I1SD I2SD I3SD I4SD;

P=[(triciclo(1,1)+triciclo(1,3))/2, (triciclo(2,1)+triciclo(2,3))/2];  % centro del vehiculo
Meta(1)=str2double(get(handles.edit1,'String')); Meta(2)=str2double(get(handles.edit2,'String'));
LlantaDelantera=[triciclo(1,2),triciclo(2,2)];
d1=5;
d2=sqrt( (Meta(1)-LlantaDelantera(1))^2 + (Meta(2)-LlantaDelantera(2))^2 );
d3=sqrt( (Meta(1)-P(1))^2 + (Meta(2)-P(2))^2 );
beta=acos( (d2^2-d1^2-d3^2)/(-2*d1*d3) )*180/pi;
error=0.8;
circunnavegar=0; recta=0;
RdistanciaAmeta=0; distanciaAmeta=100000000; % la distancia inicial a la meta la inicio en infinito y se mejora en cada iteracion

PuntoM=[triciclo(1,2) triciclo(2,2)]; % punto guardado de lo cerca que estaba del objetivo

if(Meta(1)<0),beta=beta*-1;end
%beta
if recta==0;
    while theta >= beta-error || theta<=beta+error
        if (theta >=beta-error && theta<=beta+error),tiempo=0;disp('Alineado'),recta=1; break; end
        vAngular=10;
        alfa=beta*3;
        tiempo=1;
        TriciLoco;    
        buscaInterseccion;
    end
end


% navegar de r a g hasta que r==g o se encuentre un obstaculo
if recta==1
    while (LlantaDelantera(1) ~= Meta(1) && LlantaDelantera(2)~=Meta(2))
        vAngular=45;
        alfa=0;
        tiempo=1;
        LlantaDelantera=[triciclo(1,2),triciclo(2,2)];
        if DO2SD(1)<10||DO2SDD(1)<10
            while DO2SD(1)<9||DO2SDD(1)<9
                alfa=90;
                buscaInterseccion;
                TriciLoco;
            end
             PuntoP=[sensorD(1,1) sensorD(2,1)];  % Guardar el punto de contacto con el obstaculo
             disp('Obstaculo encontrado')
        else
            %if min(DO2SD)>12 && min(DO2SDD)>12 && min(DO2SR)>12 && min(DO2SRR)>12 && min(DO2SL)>12 && min(DO2SLL)>12 && min(DO2SA)>12 && min(DO2SAA)>12 && min(DO2SB)>12 && min(DO2SBB)>12 
                if (LlantaDelantera(1)>=(Meta(1)-error) && LlantaDelantera(1)<=(Meta(1)+error)) || (LlantaDelantera(2)>=(Meta(2)-error) && LlantaDelantera(2)<=Meta(2)+error)
                    disp('ya se llego a la meta'),vAngular=0; buscaInterseccion;break
                end
            %end
        end
        while DO2SA(1)>100 && DO2SLL(1)<12
            disp('Rotar para quedar con la segunda pared')
            tiempo=1;
            TriciLoco;    
            alfa=-30;
            buscaInterseccion;
            TriciLoco;
        end           
        RdistanciaAmeta=distanciaAmeta;
        distanciaAmeta=sqrt((triciclo(1,2)-Meta(1))^2 +(triciclo(2,2)-Meta(2))^2 );
        if(distanciaAmeta<RdistanciaAmeta)
            PuntoM=[triciclo(1,2) triciclo(2,2)]; % punto guardado de lo cerca que estaba del objetivo, si es menor la nueva distancia, se actualiza
        end
        TriciLoco;
        buscaInterseccion;
    end
end




%             % sensorR sensorRR DO2SR DO2SRR 
%             if DO2SR(1)<20 && DO2SR(1)>6
%                 disp('Mantener en linea')
%             elseif DO2SR(1)<6
%                 disp('Rotar 10 grados y regresar a cero alfa')
%             end
 
            %PuntoP=[sensorD(1,1) sensorD(2,1)];  % Guardar el punto de contacto con el obstaculo
            %disp('Obstaculo encontrado')  
