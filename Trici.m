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
global triciclo alfa vAngular vLineal phi ICC theta tiempo;
alfa=0; vAngular=0;  vLineal=0; phi=0; theta=0; ICC=[0 0]; tiempo=1;
triciclo=[-3 0 3;
           1 6 1;
           0 0 0];
TriciLoco;
set(gcf,'toolbar','figure')
guidata(hObject, handles);
function varargout = Trici_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
function axes1_CreateFcn(hObject, eventdata, handles)
function figure1_WindowKeyPressFcn(hObject, eventdata, handles)
%% control
global triciclo alfa vAngular vLineal phi ICC theta tiempo;
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
    triciclo=[-3 0 3;
               1 6 1;
               0 0 1];
    TriciLoco;
end
