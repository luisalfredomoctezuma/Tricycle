global P triciclo theta alfa tiempo vAngular;
global simuDiferencial titulo;
global vAngularL vLinealL  vAngularR vLinealR;
disp('a meta final')
P=[(triciclo(1,1)+triciclo(1,3))/2, (triciclo(2,1)+triciclo(2,3))/2];  % centro del vehiculo
Meta(1)=str2double(get(handles.edit1,'String')); Meta(2)=str2double(get(handles.edit2,'String'));
LlantaDelantera=[triciclo(1,2),triciclo(2,2)];
d1=5;
recta2=0;
d2=sqrt( (Meta(1)-LlantaDelantera(1))^2 + (Meta(2)-LlantaDelantera(2))^2 );
d3=sqrt( (Meta(1)-P(1))^2 + (Meta(2)-P(2))^2 );
beta=(acos( (d2^2-d1^2-d3^2)/(-2*d1*d3) )*180/pi)+theta;
error=1.2;
error2=6.5;

if simuDiferencial==0
    if recta2==0
        while theta >= beta-error || theta<=beta+error
            if (theta >=beta-error && theta<=beta+error),tiempo=0;disp('Alineado2'),recta2=1;  break; end
            vAngular=20;
            alfa=beta*-1;
            tiempo=1;
            buscaInterseccion;
            TriciLoco;
        end
    end
    if recta2==1
        while (LlantaDelantera(1) ~= Meta(1) && LlantaDelantera(2)~=Meta(2))
            LlantaDelantera=[triciclo(1,2),triciclo(2,2)];
            vAngular=90;
            alfa=0;
            tiempo=1;
            buscaInterseccion;
            TriciLoco;        
            if (LlantaDelantera(1)>=(Meta(1)-error2-2) && LlantaDelantera(1)<=(Meta(1)+error2+2)) && (LlantaDelantera(2)>=(Meta(2)-error2) && LlantaDelantera(2)<=Meta(2)+error2)
                disp('ya se llego a la meta1'),vAngular=0; buscaInterseccion; break;
            end
        end
        if (LlantaDelantera(1)>=(Meta(1)-error2-2) && LlantaDelantera(1)<=(Meta(1)+error2+2)) && (LlantaDelantera(2)>=(Meta(2)-error2) && LlantaDelantera(2)<=Meta(2)+error2)
            disp('ya se llego a la meta2'),vAngular=0; buscaInterseccion;
        end
    %      buscaInterseccion;
        TriciLoco;  
    end
elseif simuDiferencial==1
    disp('Diferencial');error=1.2; error2=3.2;
        if recta2==0
            while theta >= beta-error || theta<=beta+error
                if (theta >=beta-error && theta<=beta+error),tiempo=0;disp('Alineado2'),recta2=1;  break; end
                %vAngular=20;
                %alfa=beta*-1;
                vAngularL=(beta/6);
                vAngularR=-(beta/6); 
                tiempo=1;
                buscaInterseccion;
                TriciLoco;
            end
        end
    
    if recta2==1
        while (LlantaDelantera(1) ~= Meta(1) && LlantaDelantera(2)~=Meta(2))
            LlantaDelantera=[triciclo(1,2),triciclo(2,2)];
            %vAngular=90;
            %alfa=0;
            vAngularL=90; vAngularR=90;
            tiempo=1;
            buscaInterseccion;
            TriciLoco;        
            if (LlantaDelantera(1)>=(Meta(1)-error2-2) && LlantaDelantera(1)<=(Meta(1)+error2)) && (LlantaDelantera(2)>=(Meta(2)-error2) && LlantaDelantera(2)<=Meta(2)+error2)
                disp('ya se llego a la meta1Dif'),vAngularL=0; vAngularR=0; buscaInterseccion; break;
            end
        end
        if (LlantaDelantera(1)>=(Meta(1)-error2-2) && LlantaDelantera(1)<=(Meta(1)+error2)) && (LlantaDelantera(2)>=(Meta(2)-error2) && LlantaDelantera(2)<=Meta(2)+error2)
            disp('ya se llego a la meta2Dif'),vAngularL=0; vAngularR=0; buscaInterseccion;
        end
    %      buscaInterseccion;
        TriciLoco;  
    end
    
end
