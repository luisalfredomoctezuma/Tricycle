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
global triciclo alfa vAngular vLineal phi ICC theta tiempo pintaRuta contador ruta obs1 obs2 obs3 navegar;
alfa=0; vAngular=0;  vLineal=0; phi=0; theta=0; ICC=[0 0]; tiempo=1; navegar=0;
ruta=0; pintaRuta=0; contador=0;
triciclo=[-3 0 3;
           0 5 0;
           0 0 0];
obs1=[40 20 20 40;
      20 20 60 60];
obs2=[-20 -80 -80 -20;
      -20 -20 -40 -40];
obs3=[-85 -75 -35 -45 ;
       20  20 60 60];
  
TriciLoco;
set(gcf,'toolbar','figure')
guidata(hObject, handles);
function varargout = Trici_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
function axes1_CreateFcn(hObject, eventdata, handles)
function figure1_WindowKeyPressFcn(hObject, eventdata, handles)
%% control
global triciclo alfa vAngular vLineal phi ICC theta tiempo ruta contador navegar;
f=gcf;
val=double(get(f,'CurrentCharacter'));
if (val==28) %disp('leftArrow');
    alfa=alfa-(45/5);
    if (alfa>=-81)  
        TriciLoco;
    else
        alfa=alfa+(45/5);
    end
elseif(val==29) %disp('rightArrow');
   alfa=alfa+(45/5);
    if alfa<=81
        alfa=alfa+(45/5);
        TriciLoco;
    else
        alfa=alfa-(45/5);
    end
elseif(val==30) %disp('upArrow');
    tiempo=50;
	vAngular=vAngular+(45/3);
    if vAngular<=180
        TriciLoco;
    else
        vAngular=vAngular-(45/3);
    end
elseif(val==31) %disp('downArrow');
    vAngular=vAngular-(45/3);
    if (vAngular>=0)  
        TriciLoco;
    else
        vAngular=vAngular+(45/3);
    end
elseif(val==8) % reinicio
    alfa=0; vAngular=0;  vLineal=0; phi=0; theta=0; ICC=[0 0]; tiempo=1; 
    ruta=0; contador=0; navegar=0;
    triciclo=[-3 0 3;
               0 5 0;
               0 0 1];
set(handles.edit1,'string',0),set(handles.edit2,'string',0)
    TriciLoco;
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
% navegar=1;
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
