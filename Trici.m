function varargout = Trici(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Trici_OpeningFcn, ...
                   'gui_OutputFcn',  @Trici_OutputFcn, ...
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
function Trici_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
%% principal
global triciclo alfa vAngular vLineal phi1 phi ICC;
alfa=0; vAngular=0;  vLineal=0; phi1=0; phi=0; ICC=[0 0];
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
global alfa vAngular triciclo vLineal ICC;
f=gcf;

val=double(get(f,'CurrentCharacter'));
% below:
if (val==28)
    %disp('leftArrow');
    %% alfa derecha
    alfa=alfa-11.25;
    if (alfa>=-80)  
        TriciLoco;
    else
        alfa=alfa+11.25;
    end
elseif(val==29)
    %disp('rightArrow');
   alfa=alfa+11.25;
    if alfa<=80
        TriciLoco;
    else
        alfa=alfa-11.25;
    end
elseif(val==30)
    %disp('upArrow');
	vAngular=vAngular+(45/2);
    if vAngular<=90
        TriciLoco;
    else
        vAngular=vAngular-(45/2);
    end
elseif(val==31)
	%disp('downArrow');
    vAngular=vAngular-(45/2);
    if (vAngular>=0)  
        TriciLoco;
    else
        vAngular=vAngular+(45/2);
    end
elseif(val==8)
    alfa=0; vAngular=0;  vLineal=0; ICC=[0 0];
    triciclo=[-3 0 3;
               1 6 1;
               0 0 1];
    TriciLoco;
end
