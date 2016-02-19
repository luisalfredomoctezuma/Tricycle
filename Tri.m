function varargout = Tri(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Tri_OpeningFcn, ...
                   'gui_OutputFcn',  @Tri_OutputFcn, ...
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
function Tri_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
%% principal
global alfa vAngular vLineal phi ICC P Pnew;
alfa=0; vAngular=0;  vLineal=0; phi=0; ICC=[0 0];

   P=[0;4;0];
Pnew=[0;4;0];


TriLoco;
set(gcf,'toolbar','figure')
% Update handles structure
guidata(hObject, handles);

function varargout = Tri_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


function figure1_WindowKeyPressFcn(hObject, eventdata, handles)
%% control
global alfa vAngular vLineal ICC P Pnew;
f=gcf;

val=double(get(f,'CurrentCharacter'));
% below:
if (val==28)
    %disp('leftArrow');
    %% alfa derecha
    alfa=alfa-11.25;
    if (alfa>=-80)  
        TriLoco;
    else
        alfa=alfa+11.25;
    end
elseif(val==29)
    %disp('rightArrow');
   alfa=alfa+11.25;
    if alfa<=80
        TriLoco;
    else
        alfa=alfa-11.25;
    end
elseif(val==30)
    %disp('upArrow');
	vAngular=vAngular+(45/2);
    if vAngular<=90
        TriLoco;
    else
        vAngular=vAngular-(45/2);
    end
elseif(val==31)
	%disp('downArrow');
    vAngular=vAngular-(45/2);
    if (vAngular>=0)  
        TriLoco;
    else
        vAngular=vAngular+(45/2);
    end
elseif(val==8)
    alfa=0; vAngular=0;  vLineal=0; ICC=[0 0];
       
       P=[0;4;0];
	Pnew=[0;4;0];

    TriLoco;
end
