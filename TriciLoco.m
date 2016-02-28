global triciclo alfa vAngular vLineal phi P theta tiempo ruta contador pintaRuta obs1 obs2 obs3 navegar;
global sensorL sensorLL sensorR sensorRR sensorD sensorDD sensorA sensorAA sensorB sensorBB;
for i=1:tiempo
    hold off
    % otros datos
    d1=5; radio=1;
    R=d1*tan((90-alfa)*pi/180);
    P=[(triciclo(1,1)+triciclo(1,3))/2, (triciclo(2,1)+triciclo(2,3))/2];  % centro del vehiculo
    
	% Sensores    

    
    
    
    
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
         for ii=1:2
            sensorD(1,ii)=sensorD(1,ii)+vLineal*sind(theta);   sensorD(2,ii)=sensorD(2,ii)+vLineal*cosd(theta);
            sensorDD(1,ii)=sensorDD(1,ii)+vLineal*sind(theta); sensorDD(2,ii)=sensorDD(2,ii)+vLineal*cosd(theta); 
            sensorR(1,ii)=sensorR(1,ii)+vLineal*sind(theta);   sensorR(2,ii)=sensorR(2,ii)+vLineal*cosd(theta);  
            sensorRR(1,ii)=sensorRR(1,ii)+vLineal*sind(theta); sensorRR(2,ii)=sensorRR(2,ii)+vLineal*cosd(theta); 
            sensorL(1,ii)=sensorL(1,ii)+vLineal*sind(theta);   sensorL(2,ii)=sensorL(2,ii)+vLineal*cosd(theta);  
            sensorLL(1,ii)=sensorLL(1,ii)+vLineal*sind(theta); sensorLL(2,ii)=sensorLL(2,ii)+vLineal*cosd(theta); 
            sensorA(1,ii)=sensorA(1,ii)+vLineal*sind(theta); sensorA(2,ii)=sensorA(2,ii)+vLineal*cosd(theta);
            sensorAA(1,ii)=sensorAA(1,ii)+vLineal*sind(theta); sensorAA(2,ii)=sensorAA(2,ii)+vLineal*cosd(theta);
            sensorB(1,ii)=sensorB(1,ii)+vLineal*sind(theta); sensorB(2,ii)=sensorB(2,ii)+vLineal*cosd(theta);
            sensorBB(1,ii)=sensorBB(1,ii)+vLineal*sind(theta); sensorBB(2,ii)=sensorBB(2,ii)+vLineal*cosd(theta);
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
                triciclo(1,jj)=nx(1);
                triciclo(2,jj)=nx(2);
                triciclo(3,jj)=nx(3);
            end
            %triciclo=tempo;
            for ii=1:2
                puntoSD =[sensorD(1,ii)-CCI(1);sensorD(2,ii)-CCI(2);0];
                puntoSDD=[sensorDD(1,ii)-CCI(1);sensorDD(2,ii)-CCI(2);0];
                puntoSI =[sensorR(1,ii)-CCI(1);sensorR(2,ii)-CCI(2);0];
                puntoSII=[sensorRR(1,ii)-CCI(1);sensorRR(2,ii)-CCI(2);0];
                puntoSL=[sensorL(1,ii)-CCI(1);sensorL(2,ii)-CCI(2);0];
                puntoSLL=[sensorLL(1,ii)-CCI(1);sensorLL(2,ii)-CCI(2);0];
                puntoSA=[sensorA(1,ii)-CCI(1);sensorA(2,ii)-CCI(2);0];
                puntoSAA=[sensorAA(1,ii)-CCI(1);sensorAA(2,ii)-CCI(2);0];                
                puntoSB=[sensorB(1,ii)-CCI(1);sensorB(2,ii)-CCI(2);0];
                puntoSBB=[sensorBB(1,ii)-CCI(1);sensorBB(2,ii)-CCI(2);0];
                ICCmas=[CCI(1);
                        CCI(2);
                        0];
                mRot=[cosd(phi)   sind(phi)   0;
                      -sind(phi)  cosd(phi)   0;
                      0                0    1]; 
                nppSD=mRot*puntoSD+ICCmas;
                nppSDD=mRot*puntoSDD+ICCmas;
                nppSR=mRot*puntoSI+ICCmas;
                nppSRR=mRot*puntoSII+ICCmas;
                nppSL=mRot*puntoSL+ICCmas;
                nppSLL=mRot*puntoSLL+ICCmas;
                nppSA=mRot*puntoSA+ICCmas;                
                nppSAA=mRot*puntoSAA+ICCmas;                
                nppSB=mRot*puntoSB+ICCmas;                
                nppSBB=mRot*puntoSBB+ICCmas;                
                sensorD(1,ii)=nppSD(1); sensorD(2,ii)=nppSD(2); sensorD(3,ii)=nppSD(3); 
                sensorDD(1,ii)=nppSDD(1); sensorDD(2,ii)=nppSDD(2); sensorDD(3,ii)=nppSDD(3);
                sensorR(1,ii)=nppSR(1); sensorR(2,ii)=nppSR(2); sensorR(3,ii)=nppSR(3);
                sensorRR(1,ii)=nppSRR(1); sensorRR(2,ii)=nppSRR(2); sensorRR(3,ii)=nppSRR(3);
                sensorL(1,ii)=nppSL(1); sensorL(2,ii)=nppSL(2); sensorL(3,ii)=nppSL(3);
                sensorLL(1,ii)=nppSLL(1); sensorLL(2,ii)=nppSLL(2); sensorLL(3,ii)=nppSLL(3);                
                sensorA(1,ii)=nppSA(1); sensorA(2,ii)=nppSA(2); sensorA(3,ii)=nppSA(3);               
                sensorAA(1,ii)=nppSAA(1); sensorAA(2,ii)=nppSAA(2); sensorAA(3,ii)=nppSAA(3);
                sensorB(1,ii)=nppSB(1); sensorB(2,ii)=nppSB(2); sensorB(3,ii)=nppSB(3);               
                sensorBB(1,ii)=nppSBB(1); sensorBB(2,ii)=nppSBB(2); sensorBB(3,ii)=nppSBB(3);                
            end
            theta=theta+phi;
            
            if(theta>=360),theta=theta-360;end
            if(theta<-360),theta=theta+360;end
             if(alfa>=360),alfa=alfa-360;end
            if(alfa<-360),alfa=alfa+360;end
            
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

	if(navegar==1)
        %Sensores
        line([sensorD(1,1) sensorD(1,2)],[sensorD(2,1) sensorD(2,2)],'color','green','LineStyle','--','LineWidth',1); hold on    
        line([sensorDD(1,1) sensorDD(1,2)],[sensorDD(2,1) sensorDD(2,2)],'color','green','LineStyle','--','LineWidth',1); hold on    
        line([sensorR(1,1) sensorR(1,2)],[sensorR(2,1) sensorR(2,2)],'color','green','LineStyle','--','LineWidth',1); hold on    
        line([sensorRR(1,1) sensorRR(1,2)],[sensorRR(2,1) sensorRR(2,2)],'color','green','LineStyle','--','LineWidth',1); hold on    
        line([sensorL(1,1) sensorL(1,2)],[sensorL(2,1) sensorL(2,2)],'color','green','LineStyle','--','LineWidth',1); hold on    
        line([sensorLL(1,1) sensorLL(1,2)],[sensorLL(2,1) sensorLL(2,2)],'color','green','LineStyle','--','LineWidth',1); hold on        
        line([sensorA(1,1) sensorA(1,2)],[sensorA(2,1) sensorA(2,2)],'color','green','LineStyle','--','LineWidth',1); hold on            
        line([sensorAA(1,1) sensorAA(1,2)],[sensorAA(2,1) sensorAA(2,2)],'color','green','LineStyle','--','LineWidth',1); hold on        
        line([sensorB(1,1) sensorB(1,2)],[sensorB(2,1) sensorB(2,2)],'color','green','LineStyle','--','LineWidth',1); hold on            
        line([sensorBB(1,1) sensorBB(1,2)],[sensorBB(2,1) sensorBB(2,2)],'color','green','LineStyle','--','LineWidth',1); hold on            
    end
    
    
    % meta
    if(MetaP(1) ~=0 && MetaP(2) ~=0)
       plot(MetaP(1),MetaP(2),'rX','LineWidth',2)
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