function varargout = Triciclo(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Triciclo_OpeningFcn, ...
                   'gui_OutputFcn',  @Triciclo_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function Triciclo_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
%% principal
global punto llanta1A llanta1B llanta2A llanta2B llanta3A llanta3B
global  alfa phi arrancar
global vAngular vLineal reversa tiempo
reversa=0; tiempo=0;
vAngular=0; vLineal=0;
alfa=0; phi=0; arrancar=0;
punto=[0 1,1];
llanta1A=[1,0,0;
          0,1,0;
          3,-1,1];
llanta1B=[1,0,0;
          0,1,0;
          3,1,1];
llanta2A=[1,0,0;
          0,1,0;
         -3,-1,1];
llanta2B=[1,0,0;
          0,1,0;
         -3,1,1];
llanta3A=[1,0,0;
          0,1,0;
          0,3,1];     
llanta3B=[1,0,0;
          0,1,0;
          0,5,1]; 
locomocion;
set(gcf,'toolbar','figure')      
guidata(hObject, handles);
function varargout = Triciclo_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function pushbutton1_Callback(hObject, eventdata, handles)
%% Arrancar el motor
global tiempo vAngular vLineal arrancar reversa;
tiempo  =str2double(get(handles.edit1,'String'));
vAngular=str2double(get(handles.edit2,'String'));
reversa= (get(handles.checkbox1,'value'));

for i=1:tiempo
    arrancar=1;
    locomocion;
	pause(0.01);
end


function pushbutton2_Callback(hObject, eventdata, handles)
%% Disminuye alfa
global alfa arrancar;
alfa=alfa-5;
arrancar=0;
if (alfa>=-70)  
    locomocion;
else
    alfa=alfa+5;
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
%% Aumenta alfa
global alfa arrancar;
alfa=alfa+5;
arrancar=0;
if alfa<=70
    locomocion;
else
    alfa=alfa-5;
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
%% Reiniciar
global punto arrancar
global  alfa theta
alfa=0;  theta=0; arrancar=0;
punto=[0 1,1];
locomocion;



function edit1_Callback(hObject, eventdata, handles)
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% function edit3_Callback(hObject, eventdata, handles)
% function edit3_CreateFcn(hObject, eventdata, handles)
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
%Reversa


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
%% funcion para capturar valores de las teclas
f=gcf;

val=double(get(f,'CurrentCharacter')) % compare the values to the list
% below:
if (val==28)
    disp('leftArrow');
elseif(val==29)
    disp('rightArrow');
elseif(val==30)
    disp('upArrow');
elseif(val==31)
    disp('downArrow');
end


