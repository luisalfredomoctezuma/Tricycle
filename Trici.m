function varargout = Trici(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Trici_OpeningFcn, ...
                   'gui_OutputFcn',  @Trici_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1}),gui_State.gui_Callback = str2func(varargin{1});end
if nargout,[varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});else,gui_mainfcn(gui_State, varargin{:});end
function Trici_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
%% principal
% triciclo
global triciclo alfa vAngular vLineal phi ICC theta tiempo pintaRuta contador ruta obs1 obs2 obs3 navegar;
global sensorL sensorLL sensorR sensorRR sensorD sensorDD sensorA sensorAA sensorB sensorBB;
global simuDiferencial titulo PuntoM;
PuntoM=[0 0];
% diferencial
global vAngularL vLinealL phiL vAngularR vLinealR phiR;
vAngularL=0;  vLinealL=0; phiL=0;
vAngularR=0;  vLinealR=0; phiR=0; 

simuDiferencial=0;
titulo='Triciclo';
alfa=0; vAngular=0;  vLineal=0; phi=0; theta=0; ICC=[0 0]; tiempo=1; navegar=0;
ruta=0; pintaRuta=0; contador=0;
triciclo=[-3 0 3;
           0 5 0;
           0 0 0];
obs1=[20 40 50 40 60 50 20;
      40 80 70 50 40 20 40];

obs2=[-20 -80 -70 -30 -20;
      40  30  60  70  40];
  
% obs3=[30  30  40  40 60  60  30;
%       -40 -80 -80 -50 -50 -40 -40];

    
	% llanta delantera
    LlantaD=[triciclo(1,2);triciclo(2,2);0];
   	% Sensores
        sensorD =[LlantaD(1)-1,  LlantaD(1)-0.9999;
                    LlantaD(2),  LlantaD(2)+25;
                    0         ,  0];
        sensorDD=[LlantaD(1)+1, LlantaD(1)+0.9999;
                  LlantaD(2)  , LlantaD(2)+25;
                  0           , 0];
        sensorR=[LlantaD(1), LlantaD(1)+25;
                  LlantaD(2)-1, LlantaD(2)-0.9999;
                  0           , 0];
        sensorRR=[LlantaD(1), LlantaD(1)+25;
                  LlantaD(2)-3  , LlantaD(2)-2.9999;
                  0           , 0];
       sensorL=[LlantaD(1), LlantaD(1)-25;
                  LlantaD(2)-1  , LlantaD(2)-0.9999;
                  0           , 0];
        sensorLL=[LlantaD(1), LlantaD(1)-25;
                  LlantaD(2)-3  , LlantaD(2)-2.9999;
                  0           , 0];
        sensorA=[LlantaD(1)-1, LlantaD(1)-0.9999;
                  LlantaD(2)-6 , LlantaD(2)+25;
                  0           , 0];
        sensorAA=[LlantaD(1)+1, LlantaD(1)+0.9999;
                  LlantaD(2)-5 , LlantaD(2)+25;
                  0           , 0];      
        sensorB=[LlantaD(1)-1, LlantaD(1)-0.9999;
                  LlantaD(2)-5  , LlantaD(2)+25;
                  0           , 0];
        sensorBB=[LlantaD(1)+1, LlantaD(1)+0.9999;
                  LlantaD(2)-6 , LlantaD(2)+25;
                  0           , 0];                    
              
       mRot1=[cosd(-75)   sind(-75)   0;
                      -sind(-75)  cosd(-75)   0;
                      0                0    0];               
       mRot2=[cosd(75)   sind(75)   0;
              -sind(75)  cosd(75)   0;
              0                0    0];
                  
        sensorA =mRot1*sensorA   +[LlantaD(1) LlantaD(1);LlantaD(2) LlantaD(2);0 0];         
        sensorAA=mRot1*sensorAA +[LlantaD(1) LlantaD(1);LlantaD(2) LlantaD(2);0 0];
        sensorB =mRot2*sensorB  +[LlantaD(1) LlantaD(1);LlantaD(2) LlantaD(2);0 0];         
        sensorBB=mRot2*sensorBB +[LlantaD(1) LlantaD(1);LlantaD(2) LlantaD(2);0 0];
              
TriciLoco;
set(gcf,'toolbar','figure')
guidata(hObject, handles);
function varargout = Trici_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
function axes1_CreateFcn(hObject, eventdata, handles)
function figure1_WindowKeyPressFcn(hObject, eventdata, handles)
%% control
%Triciclo
global triciclo alfa vAngular vLineal phi ICC theta tiempo ruta contador navegar titulo;
global sensorL sensorLL sensorR sensorRR sensorD sensorDD sensorA sensorAA sensorB sensorBB;
global simuDiferencial;
%Diferencial
global vAngularL vLinealL phiL vAngularR vLinealR phiR;
f=gcf;  navegar=0;
val=double(get(f,'CurrentCharacter'));

if simuDiferencial==0
    if (val==28) %disp('leftArrow');
        alfa=alfa-(45/5);
        navegar=0;
        if (alfa>=-81)  
            TriciLoco;
        else
            alfa=alfa+(45/5);
        end
    elseif(val==29) %disp('rightArrow');
       alfa=alfa+(45/5);
       navegar=0;
        if alfa<=81
            alfa=alfa+(45/5);
            TriciLoco;
        else
            alfa=alfa-(45/5);
        end
    elseif(val==30) %disp('upArrow');
        tiempo=50;
        navegar=0;
        vAngular=vAngular+(45/3);
        if vAngular<=180
            TriciLoco;
        else
            vAngular=vAngular-(45/3);
        end
    elseif(val==31) %disp('downArrow');
        vAngular=vAngular-(45/3);
        navegar=0;
        if (vAngular>=0)  
            TriciLoco;
        else
            vAngular=vAngular+(45/3);
        end
    elseif(val==8) % reinicio
        titulo='Triciclo';
        alfa=0; vAngular=0;  vLineal=0; phi=0; theta=0; ICC=[0 0]; tiempo=1; 
        ruta=0; contador=0; navegar=0;
        triciclo=[-3 0 3;
                   0 5 0;
                   0 0 1];
        % llanta delantera
        LlantaD=[triciclo(1,2),triciclo(2,2)];
        % Sensores
            sensorD =[LlantaD(1)-1,  LlantaD(1)-1;
                        LlantaD(2),  LlantaD(2)+20;
                        0         ,  0];
            sensorDD=[LlantaD(1)+1, LlantaD(1)+1;
                      LlantaD(2)  , LlantaD(2)+20;
                      0           , 0];           
            sensorR=[LlantaD(1), LlantaD(1)+20;
                      LlantaD(2)  , LlantaD(2);
                      0           , 0];
            sensorRR=[LlantaD(1), LlantaD(1)+20;
                      LlantaD(2)-2  , LlantaD(2)-2;
                      0           , 0];           
           sensorL=[LlantaD(1), LlantaD(1)-20;
                      LlantaD(2)  , LlantaD(2);
                      0           , 0];
            sensorLL=[LlantaD(1), LlantaD(1)-20;
                      LlantaD(2)-2  , LlantaD(2)-2;
                      0           , 0];             
            sensorA=[LlantaD(1)-1, LlantaD(1)-1;
                      LlantaD(2)-4  , LlantaD(2)+20;
                      0           , 0];
            sensorAA=[LlantaD(1)+1, LlantaD(1)+1;
                      LlantaD(2)-3 , LlantaD(2)+20;
                      0           , 0];      
            sensorB=[LlantaD(1)-1, LlantaD(1)-1;
                      LlantaD(2)-3  , LlantaD(2)+20;
                      0           , 0];
            sensorBB=[LlantaD(1)+1, LlantaD(1)+1;
                      LlantaD(2)-4 , LlantaD(2)+20;
                      0           , 0];                    

           mRot1=[cosd(-45)   sind(-45)   0;
                          -sind(-45)  cosd(-45)   0;
                          0                0    0];               
           mRot2=[cosd(45)   sind(45)   0;
                  -sind(45)  cosd(45)   0;
                  0                0    0];

            sensorA =mRot1*sensorA   +[LlantaD(1) LlantaD(1);LlantaD(2) LlantaD(2);0 0];         
            sensorAA=mRot1*sensorAA +[LlantaD(1) LlantaD(1);LlantaD(2) LlantaD(2);0 0];
            sensorB =mRot2*sensorB  +[LlantaD(1) LlantaD(1);LlantaD(2) LlantaD(2);0 0];         
            sensorBB=mRot2*sensorBB +[LlantaD(1) LlantaD(1);LlantaD(2) LlantaD(2);0 0];

            set(handles.edit1,'string',0),set(handles.edit2,'string',0)
            TriciLoco;
    end
elseif simuDiferencial==1
    if (val==28) %disp('leftArrow');
        vAngularR=vAngularR-(45/3);
        if (vAngularR>=-180)
            TriciLoco;
        else
            vAngularR=vAngularR+(45/3);
        end
    elseif(val==29) %disp('rightArrow');
        tiempo=100;
        vAngularR=vAngularR+(45/3);
        if vAngularR<=180
            TriciLoco;
        else
            vAngularR=vAngularR-(45/3);
        end
    elseif(val==30) %disp('upArrow');
        tiempo=100;
        vAngularL=vAngularL+(45/3);
        if vAngularL<=180
            TriciLoco;
        else
            vAngularL=vAngularL-(45/3);
        end
    elseif(val==31) %disp('downArrow');
        vAngularL=vAngularL-(45/3);
        if (vAngularL>=-180)  
            TriciLoco;
        else
            vAngularL=vAngularL+(45/3);
        end
    elseif(val==8) % reinicio
        vAngularL=0;  vLinealL=0; phiL=0; 
        vAngularR=0;  vLinealR=0; phiR=0;
        titulo='Triciclo';
        alfa=0; vAngular=0;  vLineal=0; phi=0; theta=0; ICC=[0 0]; tiempo=1; 
        ruta=0; contador=0; navegar=0;
        triciclo=[-3 0 3;
                   0 5 0;
                   0 0 1];
        % llanta delantera
        LlantaD=[triciclo(1,2),triciclo(2,2)];
        % Sensores
            sensorD =[LlantaD(1)-1,  LlantaD(1)-1;
                        LlantaD(2),  LlantaD(2)+20;
                        0         ,  0];
            sensorDD=[LlantaD(1)+1, LlantaD(1)+1;
                      LlantaD(2)  , LlantaD(2)+20;
                      0           , 0];           
            sensorR=[LlantaD(1), LlantaD(1)+20;
                      LlantaD(2)  , LlantaD(2);
                      0           , 0];
            sensorRR=[LlantaD(1), LlantaD(1)+20;
                      LlantaD(2)-2  , LlantaD(2)-2;
                      0           , 0];           
           sensorL=[LlantaD(1), LlantaD(1)-20;
                      LlantaD(2)  , LlantaD(2);
                      0           , 0];
            sensorLL=[LlantaD(1), LlantaD(1)-20;
                      LlantaD(2)-2  , LlantaD(2)-2;
                      0           , 0];             
            sensorA=[LlantaD(1)-1, LlantaD(1)-1;
                      LlantaD(2)-4  , LlantaD(2)+20;
                      0           , 0];
            sensorAA=[LlantaD(1)+1, LlantaD(1)+1;
                      LlantaD(2)-3 , LlantaD(2)+20;
                      0           , 0];      
            sensorB=[LlantaD(1)-1, LlantaD(1)-1;
                      LlantaD(2)-3  , LlantaD(2)+20;
                      0           , 0];
            sensorBB=[LlantaD(1)+1, LlantaD(1)+1;
                      LlantaD(2)-4 , LlantaD(2)+20;
                      0           , 0];                    

           mRot1=[cosd(-45)   sind(-45)   0;
                          -sind(-45)  cosd(-45)   0;
                          0                0    0];               
           mRot2=[cosd(45)   sind(45)   0;
                  -sind(45)  cosd(45)   0;
                  0                0    0];
            sensorA =mRot1*sensorA   +[LlantaD(1) LlantaD(1);LlantaD(2) LlantaD(2);0 0];         
            sensorAA=mRot1*sensorAA +[LlantaD(1) LlantaD(1);LlantaD(2) LlantaD(2);0 0];
            sensorB =mRot2*sensorB  +[LlantaD(1) LlantaD(1);LlantaD(2) LlantaD(2);0 0];         
            sensorBB=mRot2*sensorBB +[LlantaD(1) LlantaD(1);LlantaD(2) LlantaD(2);0 0];               
            TriciLoco;
    end
end

% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
%% dibujar la ruta
global pintaRuta;
pintaRuta= get(hObject,'Value');




function edit1_Callback(hObject, eventdata, handles)
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor')),set(hObject,'BackgroundColor','white');end



function edit2_Callback(hObject, eventdata, handles)
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor')),set(hObject,'BackgroundColor','white');end


function pushbutton6_Callback(hObject, eventdata, handles)
%% navegar
 % edit1 X, edit2 Y 
 global navegar;
 navegar=1;
 bug1;
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
%% capturar coordenada
frame = getframe;
[X, Map] = frame2im(frame);
handles.img = X(:,:,1);
point = ginput(1);
Puno=point(1,1);
Pdos=point(1,2);
set(handles.edit1,'string',round(Puno,2))
set(handles.edit2,'string',round(Pdos,2))
TriciLoco;

function axes1_ButtonDownFcn(hObject, eventdata, handles)


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% Si es 1, hacer simulacion con diferencial
global simuDiferencial titulo;
simuDiferencial= get(hObject,'Value');

if simuDiferencial==0
	titulo='Triciclo';
    TriciLoco;
else
	titulo='Diferencial';
	TriciLoco;
end
