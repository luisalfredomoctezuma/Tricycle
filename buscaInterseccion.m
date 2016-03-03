global sensorL sensorLL sensorR sensorRR sensorD sensorDD sensorA sensorAA sensorB sensorBB;
global DO2SD DO2SDD DO2SR DO2SRR DO2SL DO2SLL DO2SA DO2SAA DO2SB DO2SBB;
% intersecciones
global I1SD I2SD I3SD I4SD;
%% Obstáculos
%E1 obstáculo 1
E1O1 =[40,-30];
bE1O1=800;
%E2 obstáculo 1
E2O1 =[-10,-10];
bE2O1=-1200;
%E3 obstáculo 1
E3O1 =[-20,10];
bE3O1=-300;
%E4 obstáculo 1
E4O1 =[-10,-20];
bE4O1=-1400;
%E5 obstáculo 1
E5O1 =[-20,10];
bE5O1=-800;
%E6 obstáculo 1
E6O1 =[20,30];
bE6O1=1600;


%E1 obstáculo 2
E1O2 =[-10,60];
bE1O2=2600;
%E2 obstáculo 2
E2O2 =[30,-10];
bE2O2=-2700;
%E3 obstáculo 2
E3O2 =[10,-40];
bE3O2=-3100;
%E4 obstáculo 2
E4O2 =[-30,-10];
bE4O2=200;

%% Sensores
%ecuacion de sensord, sensor1 delantero
x1d=sensorD(1,1); y1d=sensorD(2,1);   x2d=sensorD(1,2); y2d=sensorD(2,2);
E1SD =[(y2d-y1d),-(x2d-x1d)];
bE1SD=(x1d*(y2d-y1d))-(y1d*(x2d-x1d));
    %interseccion sensorD, con E1O2
    E1O2SD =[E1O2(1) E1O2(2);E1SD(1) E1SD(2)];    bE1O2SD=[bE1O2;bE1SD];   I1SD=E1O2SD\bE1O2SD;	    
    % Si el sensor esta en el rango del obstaculo (-20,40)(-80,30),sino no hay interseccion o poner infinito
    if ((I1SD(1)>-80)&& (I1SD(1)<-20))
        DO2SD(1)=sqrt(((sensorD(1,1))-(I1SD(1)))^2 +((sensorD(2,1))-(I1SD(2)))^2);  % distancia del sensor al obstaculo
        %disp('rango valido')
    else
        DO2SD(1)=9999; %disp('fuera de rango')
    end       
    %interseccion sensorD, con E2O2
    E2O2SD =[E2O2(1) E2O2(2);E1SD(1) E1SD(2)];    bE2O2SD=[bE2O2;bE1SD];   I2SD=E2O2SD\bE2O2SD;
    % Si el sensor esta en el rango del obstaculo (-80,30)(-70,60),sino no hay interseccion o poner infinito    
    if ((I2SD(2)>30)&& (I2SD(2)<60))
	    DO2SD(2)=sqrt(((sensorD(1,1))-(I2SD(1)))^2 +((sensorD(2,1))-(I2SD(2)))^2);
        %disp('rango valido')
    else
        DO2SD(2)=9999; %disp('fuera de rango')
    end
    %interseccion sensorD, con E3O2
    E3O2SD =[E3O2(1) E3O2(2);E1SD(1) E1SD(2)];    bE3O2SD=[bE3O2;bE1SD];   I3SD=E3O2SD\bE3O2SD;
    % Si el sensor esta en el rango del obstaculo(-70,60)(-30,70),sino no hay interseccion o poner infinito        
    if ((I3SD(1)>-70)&& (I3SD(1)<-30))
        DO2SD(3)=sqrt(((sensorD(1,1))-(I3SD(1)))^2 +((sensorD(2,1))-(I3SD(2)))^2);
        %disp('rango valido')
    else
        DO2SD(3)=9999; %disp('fuera de rango')        
    end
    
    %interseccion sensorD, con E4O2
    E4O2SD =[E4O2(1) E4O2(2);E1SD(1) E1SD(2)];    bE4O2SD=[bE4O2;bE1SD];   I4SD=E4O2SD\bE4O2SD;
	% Si el sensor esta en el rango del obstaculo (-30,70)(-20,40),sino no hay interseccion o poner infinito    
     if ((I4SD(2)>40)&& (I4SD(2)<70))
        DO2SD(4)=sqrt(((sensorD(1,1))-(I4SD(1)))^2 +((sensorD(2,1))-(I4SD(2)))^2);
        %disp('rango valido')
     else
        DO2SD(4)=9999;  
     end        
%DO2SD


%ecuacion de sensorDd, sensor2 delantero    
x1dd=sensorDD(1,1); y1dd=sensorDD(2,1);   x2dd=sensorDD(1,2); y2dd=sensorDD(2,2);
E1SDD =[(y2dd-y1dd),-(x2dd-x1dd)];
bE1SDD=(x1dd*(y2dd-y1dd))-(y1dd*(x2dd-x1dd));
    %interseccion sensorDD, con E1O2
    E1O2SDD =[E1O2(1) E1O2(2);E1SDD(1) E1SDD(2)];    bE1O2SDD=[bE1O2;bE1SDD];   I1SDD=E1O2SDD\bE1O2SDD;
	% Si el sensor esta en el rango del obstaculo (-20,40)(-80,30),sino no hay interseccion o poner infinito
    if ((I1SDD(1)>-80)&& (I1SDD(1)<-20))
        DO2SDD(1)=sqrt(((sensorDD(1,1))-(I1SDD(1)))^2 +((sensorDD(2,1))-(I1SDD(2)))^2);  % distancia del sensor al obstaculo
        %disp('rango valido')
    else
        DO2SDD(1)=9999; %disp('fuera de rango')
    end    
    %interseccion sensorDD, con E2O2
    E2O2SDD =[E2O2(1) E2O2(2);E1SDD(1) E1SDD(2)];    bE2O2SDD=[bE2O2;bE1SDD];   I2SDD=E2O2SDD\bE2O2SDD;
    % Si el sensor esta en el rango del obstaculo (-80,30)(-70,60),sino no hay interseccion o poner infinito    
    if ((I2SDD(2)>30)&& (I2SDD(2)<60))
        DO2SDD(2)=sqrt(((sensorDD(1,1))-(I2SDD(1)))^2 +((sensorDD(2,1))-(I2SDD(2)))^2);
       % disp('rango valido')
    else
        DO2SDD(2)=9999; %disp('fuera de rango')
    end
    %interseccion sensorDD, con E3O2
    E3O2SDD =[E3O2(1) E3O2(2);E1SDD(1) E1SDD(2)];    bE3O2SDD=[bE3O2;bE1SDD];   I3SDD=E3O2SDD\bE3O2SDD;
    % Si el sensor esta en el rango del obstaculo(-70,60)(-30,70),sino no hay interseccion o poner infinito        
    if ((I3SDD(1)>-70)&& (I3SDD(1)<-30))
        DO2SDD(3)=sqrt(((sensorDD(1,1))-(I3SDD(1)))^2 +((sensorDD(2,1))-(I3SDD(2)))^2);
        %disp('rango valido')
    else
        DO2SDD(3)=9999; %disp('fuera de rango')        
    end    
    %interseccion sensorDD, con E4O2
    E4O2SDD =[E4O2(1) E4O2(2);E1SDD(1) E1SDD(2)];    bE4O2SDD=[bE4O2;bE1SDD];   I4SDD=E4O2SDD\bE4O2SDD;
    % Si el sensor esta en el rango del obstaculo (-30,70)(-20,40),sino no hay interseccion o poner infinito    
     if ((I4SDD(2)>40)&& (I4SDD(2)<70))
        DO2SDD(4)=sqrt(((sensorDD(1,1))-(I4SDD(1)))^2 +((sensorDD(2,1))-(I4SDD(2)))^2);
        %disp('rango valido')
     else
        DO2SDD(4)=9999;  
     end    
%DO2SDD


%ecuacion de sensorR, sensor1
x1r=sensorR(1,1); y1r=sensorR(2,1);   x2r=sensorR(1,2); y2r=sensorR(2,2);
E1SR =[(y2r-y1r),-(x2r-x1r)];
bE1SR=(x1r*(y2r-y1r))-(y1r*(x2r-x1r));
    %interseccion sensorR, con E1O2
    E1O2SR =[E1O2(1) E1O2(2);E1SR(1) E1SR(2)];    bE1O2SR=[bE1O2;bE1SR];   I1SR=E1O2SR\bE1O2SR;
    % Si el sensor esta en el rango del obstaculo (-20,40)(-80,30),sino no hay interseccion o poner infinito
    if ((I1SR(1)>-80)&& (I1SR(1)<-20))
            DO2SR(1)=sqrt(((sensorR(1,1))-(I1SR(1)))^2 +((sensorR(2,1))-(I1SR(2)))^2);  % distancia del sensor al obstaculo
       %     disp('rango valido')
    else
        DO2SR(1)=9999; %disp('fuera de rango')
    end
    %interseccion sensorR, con E2O2
    E2O2SR =[E2O2(1) E2O2(2);E1SR(1) E1SR(2)];    bE2O2SR=[bE2O2;bE1SR];   I2SR=E2O2SR\bE2O2SR;
    % Si el sensor esta en el rango del obstaculo (-80,30)(-70,60),sino no hay interseccion o poner infinito
    if ((I2SR(2)>30)&& (I2SR(2)<60))
        DO2SR(2)=sqrt(((sensorR(1,1))-(I2SR(1)))^2 +((sensorR(2,1))-(I2SR(2)))^2);
        % disp('rango valido')
    else
        DO2SR(2)=9999; %disp('fuera de rango')
    end
    %interseccion sensorR, con E3O2
    E3O2SR =[E3O2(1) E3O2(2);E1SR(1) E1SR(2)];    bE3O2SR=[bE3O2;bE1SR];   I3SR=E3O2SR\bE3O2SR;
    % Si el sensor esta en el rango del obstaculo(-70,60)(-30,70),sino no hay interseccion o poner infinito    
    if ((I3SR(1)>-70)&& (I3SR(1)<-30))
        DO2SR(3)=sqrt(((sensorR(1,1))-(I3SR(1)))^2 +((sensorR(2,1))-(I3SR(2)))^2);
        %disp('rango valido')
    else
        DO2SR(3)=9999; %disp('fuera de rango')        
    end
    %interseccion sensorR, con E4O2
    E4O2SR =[E4O2(1) E4O2(2);E1SR(1) E1SR(2)];    bE4O2SR=[bE4O2;bE1SR];   I4SR=E4O2SR\bE4O2SR;
    % Si el sensor esta en el rango del obstaculo (-30,70)(-20,40),sino no hay interseccion o poner infinito        
     if ((I4SR(2)>40)&& (I4SR(2)<70))
        DO2SR(4)=sqrt(((sensorR(1,1))-(I4SR(1)))^2 +((sensorR(2,1))-(I4SR(2)))^2);
     %   disp('rango valido')
     else
        DO2SR(4)=9999;  
     end
%DO2SR
%ecuacion de sensorRR, sensor2
x1rr=sensorRR(1,1); y1rr=sensorRR(2,1);   x2rr=sensorRR(1,2); y2rr=sensorRR(2,2);
E1SRR =[(y2rr-y1rr),-(x2rr-x1rr)];
bE1SRR=(x1rr*(y2rr-y1rr))-(y1rr*(x2rr-x1rr));
    %interseccion sensorRR, con E1O2
    E1O2SRR =[E1O2(1) E1O2(2);E1SRR(1) E1SRR(2)];    bE1O2SRR=[bE1O2;bE1SRR];   I1SRR=E1O2SRR\bE1O2SRR;
    if ((I1SRR(1)>-80)&& (I1SRR(1)<-20))
        DO2SRR(1)=sqrt(((sensorRR(1,1))-(I1SRR(1)))^2 +((sensorRR(2,1))-(I1SRR(2)))^2);  % distancia del sensor al obstaculo
       %     disp('rango valido')
    else
        DO2SRR(1)=9999; %disp('fuera de rango')
    end
    %interseccion sensorRR, con E2O2
    E2O2SRR =[E2O2(1) E2O2(2);E1SRR(1) E1SRR(2)];    bE2O2SRR=[bE2O2;bE1SRR];   I2SRR=E2O2SRR\bE2O2SRR;
    % Si el sensor esta en el rango del obstaculo (-80,30)(-70,60),sino no hay interseccion o poner infinito
    if ((I2SRR(2)>30)&& (I2SRR(2)<60))
        DO2SRR(2)=sqrt(((sensorRR(1,1))-(I2SRR(1)))^2 +((sensorRR(2,1))-(I2SRR(2)))^2);
        % disp('rango valido')
    else
        DO2SRR(2)=9999; %disp('fuera de rango')
    end
    %interseccion sensorRR, con E3O2
    E3O2SRR =[E3O2(1) E3O2(2);E1SRR(1) E1SRR(2)];    bE3O2SRR=[bE3O2;bE1SRR];   I3SRR=E3O2SRR\bE3O2SRR;
    if ((I3SRR(1)>-70)&& (I3SRR(1)<-30))
        DO2SRR(3)=sqrt(((sensorRR(1,1))-(I3SRR(1)))^2 +((sensorRR(2,1))-(I3SRR(2)))^2);
        %disp('rango valido')
    else
        DO2SRR(3)=9999; %disp('fuera de rango')        
    end
    %interseccion sensorRR, con E4O2
    E4O2SRR =[E4O2(1) E4O2(2);E1SRR(1) E1SRR(2)];    bE4O2SRR=[bE4O2;bE1SRR];   I4SRR=E4O2SRR\bE4O2SRR;
    % Si el sensor esta en el rango del obstaculo (-30,70)(-20,40),sino no hay interseccion o poner infinito        
     if ((I4SRR(2)>40)&& (I4SRR(2)<70))
        DO2SRR(4)=sqrt(((sensorRR(1,1))-(I4SRR(1)))^2 +((sensorRR(2,1))-(I4SRR(2)))^2);
     %   disp('rango valido')
     else
        DO2SRR(4)=9999;  
     end    
%DO2SRR


%ecuacion de sensorL, sensor1
x1l=sensorL(1,1); y1l=sensorL(2,1);   x2l=sensorL(1,2); y2l=sensorL(2,2);
E1SL =[(y2l-y1l),-(x2l-x1l)];
bE1SL=(x1l*(y2l-y1l))-(y1l*(x2l-x1l));
    %interseccion sensorL, con E1O2
    E1O2SL =[E1O2(1) E1O2(2);E1SL(1) E1SL(2)];    bE1O2SL=[bE1O2;bE1SL];   I1SL=E1O2SL\bE1O2SL;
    if ((I1SL(1)>-80)&& (I1SL(1)<-20))
        DO2SL(1)=sqrt(((sensorL(1,1))-(I1SL(1)))^2 +((sensorL(2,1))-(I1SL(2)))^2);  % distancia del sensor al obstaculo
       %     disp('rango valido')
    else
        DO2SL(1)=9999; %disp('fuera de rango')
    end
    %interseccion sensorL, con E2O2
    E2O2SL =[E2O2(1) E2O2(2);E1SL(1) E1SL(2)];    bE2O2SL=[bE2O2;bE1SL];   I2SL=E2O2SL\bE2O2SL;
    if ((I2SL(2)>30)&& (I2SL(2)<60))
        DO2SL(2)=sqrt(((sensorL(1,1))-(I2SL(1)))^2 +((sensorL(2,1))-(I2SL(2)))^2);
        % disp('rango valido')
    else
        DO2SL(2)=9999; %disp('fuera de rango')
    end
    %interseccion sensorL, con E3O2
    E3O2SL =[E3O2(1) E3O2(2);E1SL(1) E1SL(2)];    bE3O2SL=[bE3O2;bE1SL];   I3SL=E3O2SL\bE3O2SL;
    if ((I3SL(1)>-70)&& (I3SL(1)<-30))
        DO2SL(3)=sqrt(((sensorL(1,1))-(I3SL(1)))^2 +((sensorL(2,1))-(I3SL(2)))^2);
        %disp('rango valido')
    else
        DO2SL(3)=9999; %disp('fuera de rango')        
    end
    %interseccion sensorL, con E4O2
    E4O2SL =[E4O2(1) E4O2(2);E1SL(1) E1SL(2)];    bE4O2SL=[bE4O2;bE1SL];   I4SL=E4O2SL\bE4O2SL;
     if ((I4SL(2)>40)&& (I4SL(2)<70))
        DO2SL(4)=sqrt(((sensorL(1,1))-(I4SL(1)))^2 +((sensorL(2,1))-(I4SL(2)))^2);
     %   disp('rango valido')
     else
        DO2SL(4)=9999;  
     end     
%DO2SL
%ecuacion de sensorLL, sensor1 delantero
x1LL=sensorLL(1,1); y1LL=sensorLL(2,1);   x2LL=sensorLL(1,2); y2LL=sensorLL(2,2);
E1SLL =[(y2LL-y1LL),-(x2LL-x1LL)];
bE1SLL=(x1LL*(y2LL-y1LL))-(y1LL*(x2LL-x1LL));
    %interseccion sensorLL, con E1O2
    E1O2SLL =[E1O2(1) E1O2(2);E1SLL(1) E1SLL(2)];    bE1O2SLL=[bE1O2;bE1SLL];   I1SLL=E1O2SLL\bE1O2SLL;
    if ((I1SLL(1)>-80)&& (I1SLL(1)<-20))
        DO2SLL(1)=sqrt(((sensorLL(1,1))-(I1SLL(1)))^2 +((sensorLL(2,1))-(I1SLL(2)))^2);  % distancia del sensor al obstaculo
       %     disp('rango valido')
    else
        DO2SLL(1)=9999; %disp('fuera de rango')
    end
    %interseccion sensorLL, con E2O2
    E2O2SLL =[E2O2(1) E2O2(2);E1SLL(1) E1SLL(2)];    bE2O2SLL=[bE2O2;bE1SLL];   I2SLL=E2O2SLL\bE2O2SLL;
    if ((I2SLL(2)>30)&& (I2SLL(2)<60))
        DO2SLL(2)=sqrt(((sensorLL(1,1))-(I2SLL(1)))^2 +((sensorLL(2,1))-(I2SLL(2)))^2);
        % disp('rango valido')
    else
        DO2SLL(2)=9999; %disp('fuera de rango')
    end
    %interseccion sensorLL, con E3O2
    E3O2SLL =[E3O2(1) E3O2(2);E1SLL(1) E1SLL(2)];    bE3O2SLL=[bE3O2;bE1SLL];   I3SLL=E3O2SLL\bE3O2SLL;
    if ((I3SLL(1)>-70)&& (I3SLL(1)<-30))
        DO2SLL(3)=sqrt(((sensorLL(1,1))-(I3SLL(1)))^2 +((sensorLL(2,1))-(I3SLL(2)))^2);
        %disp('rango valido')
    else
        DO2SLL(3)=9999; %disp('fuera de rango')        
    end
    %interseccion sensorLL, con E4O2
    E4O2SLL =[E4O2(1) E4O2(2);E1SLL(1) E1SLL(2)];    bE4O2SLL=[bE4O2;bE1SLL];   I4SLL=E4O2SLL\bE4O2SLL;
     if ((I4SLL(2)>40)&& (I4SLL(2)<70))
	    DO2SLL(4)=sqrt(((sensorLL(1,1))-(I4SLL(1)))^2 +((sensorLL(2,1))-(I4SLL(2)))^2);
     %   disp('rango valido')
     else
        DO2SLL(4)=9999;
     end     
% DO2SLL



%ecuacion de sensorA, sensor1
x1a=sensorA(1,1); y1a=sensorA(2,1);   x2a=sensorA(1,2); y2a=sensorA(2,2);
E1SA =[(y2a-y1a),-(x2a-x1a)];
bE1SA=(x1a*(y2a-y1a))-(y1a*(x2a-x1a));
    %interseccion sensorA, con E1O2
    E1O2SA =[E1O2(1) E1O2(2);E1SA(1) E1SA(2)];    bE1O2SA=[bE1O2;bE1SA];   I1SA=E1O2SA\bE1O2SA;
    % Si el sensor esta en el rango del obstaculo (-20,40)(-80,30),sino no hay interseccion o poner infinito
    if ((I1SA(1)>-80)&& (I1SA(1)<-20))
	    DO2SA(1)=sqrt(((sensorA(1,1))-(I1SA(1)))^2 +((sensorA(2,1))-(I1SA(2)))^2);  % distancia del sensor al obstaculo
       %     disp('rango valido')
    else
        DO2SA(1)=9999; %disp('fuera de rango')
    end
    %interseccion sensorA, con E2O2
    E2O2SA =[E2O2(1) E2O2(2);E1SA(1) E1SA(2)];    bE2O2SA=[bE2O2;bE1SA];   I2SA=E2O2SA\bE2O2SA;
    % Si el sensor esta en el rango del obstaculo (-80,30)(-70,60),sino no hay interseccion o poner infinito    
    if ((I2SA(2)>30)&& (I2SA(2)<60))
	    DO2SA(2)=sqrt(((sensorA(1,1))-(I2SA(1)))^2 +((sensorA(2,1))-(I2SA(2)))^2);
       % disp('rango valido')
    else
        DO2SA(2)=9999; %disp('fuera de rango')
    end
    %interseccion sensorA, con E3O2
    E3O2SA =[E3O2(1) E3O2(2);E1SA(1) E1SA(2)];    bE3O2SA=[bE3O2;bE1SA];   I3SA=E3O2SA\bE3O2SA;
    % Si el sensor esta en el rango del obstaculo(-70,60)(-30,70),sino no hay interseccion o poner infinito        
    if ((I3SA(1)>-70)&& (I3SA(1)<-30))
	    DO2SA(3)=sqrt(((sensorA(1,1))-(I3SA(1)))^2 +((sensorA(2,1))-(I3SA(2)))^2);
        %disp('rango valido')
    else
        DO2SA(3)=9999; %disp('fuera de rango')        
    end  
    %interseccion sensorA, con E4O2
    E4O2SA =[E4O2(1) E4O2(2);E1SA(1) E1SA(2)];    bE4O2SA=[bE4O2;bE1SA];   I4SA=E4O2SA\bE4O2SA;
    % Si el sensor esta en el rango del obstaculo (-30,70)(-20,40),sino no hay interseccion o poner infinito    
     if ((I4SA(2)>40)&& (I4SA(2)<70))
	    DO2SA(4)=sqrt(((sensorA(1,1))-(I4SA(1)))^2 +((sensorA(2,1))-(I4SA(2)))^2);
        %disp('rango valido')
     else
        DO2SA(4)=9999;  
     end        
%DO2SA
%ecuacion de sensorAA, sensor1 delantero
x1AA=sensorAA(1,1); y1AA=sensorAA(2,1);   x2AA=sensorAA(1,2); y2AA=sensorAA(2,2);
E1SAA =[(y2AA-y1AA),-(x2AA-x1AA)];
bE1SAA=(x1AA*(y2AA-y1AA))-(y1AA*(x2AA-x1AA));
    %interseccion sensorAA, con E1O2
    E1O2SAA =[E1O2(1) E1O2(2);E1SAA(1) E1SAA(2)];    bE1O2SAA=[bE1O2;bE1SAA];   I1SAA=E1O2SAA\bE1O2SAA;
    % Si el sensor esta en el rango del obstaculo (-20,40)(-80,30),sino no hay interseccion o poner infinito
    if ((I1SAA(1)>-80)&& (I1SAA(1)<-20))
	    DO2SAA(1)=sqrt(((sensorAA(1,1))-(I1SAA(1)))^2 +((sensorAA(2,1))-(I1SAA(2)))^2);  % distancia del sensor al obstaculo
       %     disp('rango valido')
    else
        DO2SAA(1)=9999; %disp('fuera de rango')
    end
    %interseccion sensorAA, con E2O2
    E2O2SAA =[E2O2(1) E2O2(2);E1SAA(1) E1SAA(2)];    bE2O2SAA=[bE2O2;bE1SAA];   I2SAA=E2O2SAA\bE2O2SAA;
    % Si el sensor esta en el rango del obstaculo (-80,30)(-70,60),sino no hay interseccion o poner infinito    
    if ((I2SAA(2)>30)&& (I2SAA(2)<60))
	    DO2SAA(2)=sqrt(((sensorAA(1,1))-(I2SAA(1)))^2 +((sensorAA(2,1))-(I2SAA(2)))^2);
       % disp('rango valido')
    else
        DO2SAA(2)=9999; %disp('fuera de rango')
    end
    %interseccion sensorAA, con E3O2
    E3O2SAA =[E3O2(1) E3O2(2);E1SAA(1) E1SAA(2)];    bE3O2SAA=[bE3O2;bE1SAA];   I3SAA=E3O2SAA\bE3O2SAA;
    % Si el sensor esta en el rango del obstaculo(-70,60)(-30,70),sino no hay interseccion o poner infinito        
    if ((I3SAA(1)>-70)&& (I3SAA(1)<-30))
	    DO2SAA(3)=sqrt(((sensorAA(1,1))-(I3SAA(1)))^2 +((sensorAA(2,1))-(I3SAA(2)))^2);
        %disp('rango valido')
    else
        DO2SAA(3)=9999; %disp('fuera de rango')        
    end  
    %interseccion sensorAA, con E4O2
    E4O2SAA =[E4O2(1) E4O2(2);E1SAA(1) E1SAA(2)];    bE4O2SAA=[bE4O2;bE1SAA];   I4SAA=E4O2SAA\bE4O2SAA;
    % Si el sensor esta en el rango del obstaculo (-30,70)(-20,40),sino no hay interseccion o poner infinito    
     if ((I4SAA(2)>40)&& (I4SAA(2)<70))
	    DO2SAA(4)=sqrt(((sensorAA(1,1))-(I4SAA(1)))^2 +((sensorAA(2,1))-(I4SAA(2)))^2);
        %disp('rango valido')
     else
        DO2SAA(4)=9999;  
     end            
%DO2SAA



%ecuacion de sensorB, sensor1
x1b=sensorB(1,1); y1a=sensorB(2,1);   x2a=sensorB(1,2); y2a=sensorB(2,2);
E1SB =[(y2a-y1a),-(x2a-x1b)];
bE1SB=(x1b*(y2a-y1a))-(y1a*(x2a-x1b));
    %interseccion sensorB, con E1O2
    E1O2SB =[E1O2(1) E1O2(2);E1SB(1) E1SB(2)];    bE1O2SB=[bE1O2;bE1SB];   I1SB=E1O2SB\bE1O2SB;
    % Si el sensor esta en el rango del obstaculo (-20,40)(-80,30),sino no hay interseccion o poner infinito
    if ((I1SB(1)>-80)&& (I1SB(1)<-20))
	    DO2SB(1)=sqrt(((sensorB(1,1))-(I1SB(1)))^2 +((sensorB(2,1))-(I1SB(2)))^2);  % distancia del sensor al obstaculo
       %     disp('rango valido')
    else
        DO2SB(1)=9999; %disp('fuera de rango')
    end
    %interseccion sensorB, con E2O2
    E2O2SB =[E2O2(1) E2O2(2);E1SB(1) E1SB(2)];    bE2O2SB=[bE2O2;bE1SB];   I2SB=E2O2SB\bE2O2SB;
    % Si el sensor esta en el rango del obstaculo (-80,30)(-70,60),sino no hay interseccion o poner infinito    
    if ((I2SB(2)>30)&& (I2SB(2)<60))
	    DO2SB(2)=sqrt(((sensorB(1,1))-(I2SB(1)))^2 +((sensorB(2,1))-(I2SB(2)))^2);
       % disp('rango valido')
    else
        DO2SB(2)=9999; %disp('fuera de rango')
    end
    %interseccion sensorB, con E3O2
    E3O2SB =[E3O2(1) E3O2(2);E1SB(1) E1SB(2)];    bE3O2SB=[bE3O2;bE1SB];   I3SB=E3O2SB\bE3O2SB;
    % Si el sensor esta en el rango del obstaculo(-70,60)(-30,70),sino no hay interseccion o poner infinito        
    if ((I3SB(1)>-70)&& (I3SB(1)<-30))
	    DO2SB(3)=sqrt(((sensorB(1,1))-(I3SB(1)))^2 +((sensorB(2,1))-(I3SB(2)))^2);
        %disp('rango valido')
    else
        DO2SB(3)=9999; %disp('fuera de rango')        
    end 
    %interseccion sensorB, con E4O2
    E4O2SB =[E4O2(1) E4O2(2);E1SB(1) E1SB(2)];    bE4O2SB=[bE4O2;bE1SB];   I4SB=E4O2SB\bE4O2SB;
    % Si el sensor esta en el rango del obstaculo (-30,70)(-20,40),sino no hay interseccion o poner infinito    
     if ((I4SB(2)>40)&& (I4SB(2)<70))
	    DO2SB(4)=sqrt(((sensorB(1,1))-(I4SB(1)))^2 +((sensorB(2,1))-(I4SB(2)))^2);
        %disp('rango valido')
     else
        DO2SB(4)=9999;  
     end
%DO2SB
%ecuacion de sensorBB, sensor1 delantero
x1BB=sensorBB(1,1); y1BB=sensorBB(2,1);   x2BB=sensorBB(1,2); y2BB=sensorBB(2,2);
E1SBB =[(y2BB-y1BB),-(x2BB-x1BB)];
bE1SBB=(x1BB*(y2BB-y1BB))-(y1BB*(x2BB-x1BB));
    %interseccion sensorBB, con E1O2
    E1O2SBB =[E1O2(1) E1O2(2);E1SBB(1) E1SBB(2)];    bE1O2SBB=[bE1O2;bE1SBB];   I1SBB=E1O2SBB\bE1O2SBB;
    % Si el sensor esta en el rango del obstaculo (-20,40)(-80,30),sino no hay interseccion o poner infinito
    if ((I1SBB(1)>-80)&& (I1SBB(1)<-20))
	    DO2SBB(1)=sqrt(((sensorBB(1,1))-(I1SBB(1)))^2 +((sensorBB(2,1))-(I1SBB(2)))^2);  % distancia del sensor al obstaculo
       %     disp('rango valido')
    else
        DO2SBB(1)=9999; %disp('fuera de rango')
    end
    %interseccion sensorBB, con E2O2
    E2O2SBB =[E2O2(1) E2O2(2);E1SBB(1) E1SBB(2)];    bE2O2SBB=[bE2O2;bE1SBB];   I2SBB=E2O2SBB\bE2O2SBB;
    % Si el sensor esta en el rango del obstaculo (-80,30)(-70,60),sino no hay interseccion o poner infinito    
    if ((I2SBB(2)>30)&& (I2SBB(2)<60))
	    DO2SBB(2)=sqrt(((sensorBB(1,1))-(I2SBB(1)))^2 +((sensorBB(2,1))-(I2SBB(2)))^2);
       % disp('rango valido')
    else
        DO2SBB(2)=9999; %disp('fuera de rango')
    end
    %interseccion sensorBB, con E3O2
    E3O2SBB =[E3O2(1) E3O2(2);E1SBB(1) E1SBB(2)];    bE3O2SBB=[bE3O2;bE1SBB];   I3SBB=E3O2SBB\bE3O2SBB;
    % Si el sensor esta en el rango del obstaculo(-70,60)(-30,70),sino no hay interseccion o poner infinito        
    if ((I3SBB(1)>-70)&& (I3SBB(1)<-30))
	    DO2SBB(3)=sqrt(((sensorBB(1,1))-(I3SBB(1)))^2 +((sensorBB(2,1))-(I3SBB(2)))^2);
        %disp('rango valido')
    else
        DO2SBB(3)=9999; %disp('fuera de rango')        
    end 
    %interseccion sensorBB, con E4O2
    E4O2SBB =[E4O2(1) E4O2(2);E1SBB(1) E1SBB(2)];    bE4O2SBB=[bE4O2;bE1SBB];   I4SBB=E4O2SBB\bE4O2SBB;
    % Si el sensor esta en el rango del obstaculo (-30,70)(-20,40),sino no hay interseccion o poner infinito    
     if ((I4SBB(2)>40)&& (I4SBB(2)<70))
	    DO2SBB(4)=sqrt(((sensorBB(1,1))-(I4SBB(1)))^2 +((sensorBB(2,1))-(I4SBB(2)))^2);
        %disp('rango valido')
     else
        DO2SBB(4)=9999;  
     end    
 %DO2SBB
 
 