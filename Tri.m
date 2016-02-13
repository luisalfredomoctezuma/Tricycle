function varargout = Tri(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Tri_OpeningFcn, ...
                   'gui_OutputFcn',  @Tri_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1}),gui_State.gui_Callback = str2func(varargin{1});end
if nargout,[varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:}); else,gui_mainfcn(gui_State, varargin{:});end

function Tri_OpeningFcn(hObject, eventdata, handles, varargin)
%% Inicio
handles.output = hObject;
global llanta1A llanta1B llanta2A llanta2B llanta3A llanta3B;
global alfa theta;
global tiempo vAngular vLineal;
global arrancar Reversa;
arrancar=0; Reversa=0;
alfa=0;  theta=0;
tiempo=0; vAngular=0; vLineal=0;
llanta1A=[-3;1]; llanta1B=[-3;2];
llanta2A=[3;1];  llanta2B=[3;2];
llanta3A=[0;4];  llanta3B=[0;5];
mov;
set(gcf,'toolbar','figure')
guidata(hObject, handles);

function varargout = Tri_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
function edit1_Callback(hObject, eventdata, handles)
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton1_Callback(hObject, eventdata, handles)
%% Arrancar
global tiempo vAngular vLineal arrancar Reversa;
tiempo  =str2double(get(handles.edit1,'String'));
vAngular=str2double(get(handles.edit2,'String'));
vLineal=str2double(get(handles.edit3,'String'));
Reversa= (get(handles.checkbox1,'value'));
for i=1:tiempo
    arrancar=1;
    mov;
	pause(0.1);
end
    %msgbox('Disminuye la velocidad o el tiempo');

function edit2_Callback(hObject, eventdata, handles)
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor')),set(hObject,'BackgroundColor','white');end
function edit3_Callback(hObject, eventdata, handles)
function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton2_Callback(hObject, eventdata, handles)
%% Disminuir Alfa 
global alfa alfaR arrancar;
alfaR=alfa;
alfa=alfa+5;
arrancar=0;
if alfa<=70
    mov;
else
    alfa=alfa-5;
end

function pushbutton3_Callback(hObject, eventdata, handles)
%% Aumentar Alfa
global alfa alfaR arrancar;
alfaR=alfa;
alfa=alfa-5;
arrancar=0;
if (alfa>=-70)  
    mov;
else
    alfa=alfa+5;
end


function pushbutton6_Callback(hObject, eventdata, handles)
%% Reiniciar
global alfa theta arrancar tiempo vLineal vAngular;
global llanta1A llanta1B llanta2A llanta2B llanta3A llanta3B;
alfa=0;  theta=0; arrancar=0;
tiempo=0; vAngular=0; vLineal=0;
llanta1A=[-2;1]; llanta1B=[-2;2];
llanta2A=[4;1];  llanta2B=[4;2];
llanta3A=[1;4];  llanta3B=[1;5];
mov;


function checkbox1_Callback(hObject, eventdata, handles)
