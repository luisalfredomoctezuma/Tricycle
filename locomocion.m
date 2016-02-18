global punto llanta1A llanta1B llanta2A llanta2B llanta3A llanta3B;
global  alfa phi;
global vAngular vLineal reversa
hold off

% otros datos
d1=4;  d2=6; radio=1;  % radio de la llanta delantera
R=0;
if reversa==1, adelanteAtras=-90;else adelanteAtras=+90; end

if(arrancar==1)
        R=-1*d1*tan((90-alfa)*pi/180);
        vLineal=(vAngular*pi/180)*radio;
        Vs=vAngular;
        vLineal=(vLineal*cosd(alfa));
                
        if alfa>0, vAngular=vAngular*pi/180; elseif(alfa<0),vAngular=-1*(vAngular*pi/180); elseif(alfa==0),vAngular=0;  end
       % Cambio de orientacion del robot 
        phii=((vLineal*180/pi)/d1)*sind(alfa)
        phi=vAngular*180/pi;
        
        punto(1)= punto(1)+ vLineal*cosd(alfa+adelanteAtras);
        punto(2)= punto(2)+ vLineal*sind(alfa+adelanteAtras);

        %alfa=(vAngular*pi/180)*alfa
        pRotacion=[R punto(2)]
        rotar=[punto(1) punto(2)]        
        
        vAngular=Vs;       
%         punto(1)=pRotacion(1)+(rotar(1)-pRotacion(1))*cosd(phii) - (rotar(2)-pRotacion(2))*sind(phii);
%         punto(2)=pRotacion(2)+(rotar(1)-pRotacion(1))*sind(phii) - (rotar(2)-pRotacion(2))*cosd(phii);        
%         
        %if(phi==0),vAngular=Vs;else vAngular=Vs; end

end

% centro de Ejes
plot(punto(1),punto(2),'ro','LineWidth',3)

pllanta1A=punto*llanta1A; pllanta1B=punto*llanta1B;
pllanta2A=punto*llanta2A; pllanta2B=punto*llanta2B;
pllanta3A=punto*llanta3A; pllanta3B=punto*llanta3B;


centroLl1X=(pllanta1A(1)+pllanta1B(1))/2; centroLl1Y=(pllanta1A(2)+pllanta1B(2))/2;  % centro de llanta1
centroLl2X=(pllanta2A(1)+pllanta2B(1))/2; centroLl2Y=(pllanta2A(2)+pllanta2B(2))/2;  % centro de llanta2
centroLl3X=(pllanta3A(1)+pllanta3B(1))/2; centroLl3Y=(pllanta3A(2)+pllanta3B(2))/2;  % centro de llanta3

% Rotacion de parte A de la llanta delantera
x1=pllanta3A(1); y1=pllanta3A(2);
Nx1=centroLl3X+(x1-centroLl3X)*cosd(alfa)-(y1-centroLl3Y)*sind(alfa);  Ny1=centroLl3Y+(x1-centroLl3X)*sind(alfa)+(y1-centroLl3Y)*cosd(alfa);
% Rotacion de parte B de la llanta
x2=pllanta3B(1); y2=pllanta3B(2);
Nx2=centroLl3X+(x2-centroLl3X)*cosd(alfa)-(y2-centroLl3Y)*sind(alfa);  Ny2=centroLl3Y+(x2-centroLl3X)*sind(alfa)+(y2-centroLl3Y)*cosd(alfa);

% centro de Ejes
plot(punto(1),punto(2),'ro','LineWidth',5)

% Grafica llantas
line([pllanta1A(1) pllanta1B(1)],[pllanta1A(2) pllanta1B(2)],'color','black','LineWidth',10); hold on
line([pllanta2A(1) pllanta2B(1)],[pllanta2A(2) pllanta2B(2)],'color','black','LineWidth',10); hold on
line([Nx1 Nx2],[Ny1 Ny2],'color','red','LineWidth',10); hold on
% Graficar ejes
line([centroLl1X centroLl2X],[centroLl1Y centroLl2Y],'color','black','LineWidth',4); hold on
line([punto(1) centroLl3X],[punto(2) centroLl3Y],'color','black','LineWidth',4)

set(handles.text2,'string',alfa)  
set(handles.text10,'string',punto(1))  
set(handles.text11,'string',punto(2))  

axes(handles.axes1); xlabel('x'); ylabel('y');
title('Triciclo');axis([-50 50 0 50]),grid on