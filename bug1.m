global triciclo alfa vAngular vLineal phi P theta tiempo ruta contador pintaRuta obs1 obs2 obs3 navegar;
global sensorL sensorLL sensorR sensorRR sensorD sensorDD sensorA sensorAA sensorB sensorBB;
global DO2SD DO2SDD DO2SR DO2SRR DO2SL DO2SLL DO2SA DO2SAA DO2SB DO2SBB;
global I1SD I2SD I3SD I4SD; 
global PuntoM;
P=[(triciclo(1,1)+triciclo(1,3))/2, (triciclo(2,1)+triciclo(2,3))/2];  % centro del vehiculo
Meta(1)=str2double(get(handles.edit1,'String')); Meta(2)=str2double(get(handles.edit2,'String'));
LlantaDelantera=[triciclo(1,2),triciclo(2,2)];
d1=5; error=0.8;   SeEncontroObs=0; circunnavegar=0; recta=0;   conta=0; conta2=0;

d2=sqrt( (Meta(1)-LlantaDelantera(1))^2 + (Meta(2)-LlantaDelantera(2))^2 );
d3=sqrt( (Meta(1)-P(1))^2 + (Meta(2)-P(2))^2 );
beta=acos( (d2^2-d1^2-d3^2)/(-2*d1*d3) )*180/pi;


RdistanciaAmeta=0; distanciaAmeta=100000000; % la distancia inicial a la meta la inicio en infinito y se mejora en cada iteracion
PuntoM=[triciclo(1,2) triciclo(2,2)]; % punto guardado de lo cerca que estaba del objetivo
PuntoMR=PuntoM;

if(Meta(1)<0),beta=beta*-1;end

%Alineación
if recta==0;
    while theta >= beta-error || theta<=beta+error
        if (theta >=beta-error && theta<=beta+error),tiempo=0;disp('Alineado'),recta=1; break; end
        vAngular=5;
        alfa=beta*1;
        tiempo=1;
        buscaInterseccion;
        TriciLoco;
    end
end

% navegar de r a g hasta que r==g o se encuentre un obstaculo
if recta==1
    while (LlantaDelantera(1) ~= Meta(1) && LlantaDelantera(2)~=Meta(2))
        vAngular=45;
        alfa=0;
        tiempo=1;
        LlantaDelantera=[triciclo(1,2),triciclo(2,2)];
        while DO2SD(1)<9||DO2SDD(1)<9
        	alfa=90;
            buscaInterseccion;
            TriciLoco;
            %disp('Obstaculo encontrado')
            SeEncontroObs=1;
        end
        TriciLoco;
        buscaInterseccion;
        if SeEncontroObs==1
            while DO2SA(1)>14 && DO2SAA(1)>14
                buscaInterseccion;                    %disp('SensorA SensorAA mayores a 30')
                conta=conta+1;
                if conta>=7
                    if (DO2SL(1)>12 && DO2SLL(1)>12)&&(DO2SL(2)>12 && DO2SLL(2)>12)&&(DO2SL(3)>12 && DO2SLL(3)>12)&&(DO2SL(4)>12  && DO2SLL(4)>12)
                        if (DO2SA(1)<20 && DO2SAA(1)<20)&&(DO2SA(2)<20 && DO2SAA(2)<20)&&(DO2SA(3)<20&& DO2SAA(3)<20)&&(DO2SA(4)<20&& DO2SAA(4)<15)                            
                            tiempo=1; %disp('ReAlinea')
                            alfa=85;
                            buscaInterseccion;
                            RdistanciaAmeta=sqrt((Meta(1)-PuntoM(1))^2 +(Meta(2)-PuntoM(2))^2 );
                            distanciaAmeta=sqrt((Meta(1)-triciclo(1,2))^2 +(Meta(2)-triciclo(2,2))^2 );
                            if(distanciaAmeta<RdistanciaAmeta)
                                PuntoM=[triciclo(1,2) triciclo(2,2)]; 
                            conta2=conta2+1;                                
                            end
                            PuntoMR=[triciclo(1,2) triciclo(2,2)];                            
                            if (PuntoMR(1)>=(PuntoM(1)-0.6) && PuntoMR(1)<=(PuntoM(1)+0.6)) && (PuntoMR(2)>=(PuntoM(2)-0.6) && PuntoMR(2)<=(PuntoM(2)+0.6))
                            	disp('Llego al puntoM')
                            end
                            TriciLoco;
                        end
                        
                        tiempo=1;
                        alfa=-85;
                        buscaInterseccion;
                        RdistanciaAmeta=sqrt((Meta(1)-PuntoM(1))^2 +(Meta(2)-PuntoM(2))^2 );
                        distanciaAmeta=sqrt((Meta(1)-triciclo(1,2))^2 +(Meta(2)-triciclo(2,2))^2 );
                        if(distanciaAmeta<RdistanciaAmeta)
                            PuntoM=[triciclo(1,2) triciclo(2,2)];                           
                        end
                       	PuntoMR=[triciclo(1,2) triciclo(2,2)]; 
                        if (PuntoMR(1)>=(PuntoM(1)-0.6) && PuntoMR(1)<=(PuntoM(1)+0.6)) && (PuntoMR(2)>=(PuntoM(2)-0.6) && PuntoMR(2)<=(PuntoM(2)+0.6))
                        	disp('Llego al puntoM')
                        end
                        TriciLoco;
                    end
                end
                RdistanciaAmeta=sqrt((Meta(1)-PuntoM(1))^2 +(Meta(2)-PuntoM(2))^2 );
                distanciaAmeta=sqrt((Meta(1)-triciclo(1,2))^2 +(Meta(2)-triciclo(2,2))^2 );
                if(distanciaAmeta<RdistanciaAmeta)
                	PuntoM=[triciclo(1,2) triciclo(2,2)];
                end
              	PuntoMR=[triciclo(1,2) triciclo(2,2)]; 
                vAngular=45;   % avanzar en linea recta
                alfa=0;
                TriciLoco;
                if (PuntoMR(1)>=(PuntoM(1)-error) && PuntoMR(1)<=(PuntoM(1)+error)) && (PuntoMR(2)>=(PuntoM(2)-error) && PuntoMR(2)<=(PuntoM(2)+error))
                	disp('Llego al puntoM')
                end                                
            end
        end
    end
end

        


% Cuando alla llegado al puntoM dos veces, alinear nuevamente y viajar en
% recta hacia el objetivo
%             if (LlantaDelantera(1)>=(Meta(1)-error) && LlantaDelantera(1)<=(Meta(1)+error)) || (LlantaDelantera(2)>=(Meta(2)-error) && LlantaDelantera(2)<=Meta(2)+error)
%                 disp('ya se llego a la meta'),vAngular=0; buscaInterseccion;break
%             end


