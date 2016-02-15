function varargout = rueda(varargin)
% RUEDA MATLAB code for rueda.fig
%      RUEDA, by itself, creates a new RUEDA or raises the existing
%      singleton*.
%
%      H = RUEDA returns the handle to a new RUEDA or the handle to
%      the existing singleton*.
%
%      RUEDA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RUEDA.M with the given input arguments.
%
%      RUEDA('Property','Value',...) creates a new RUEDA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before rueda_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to rueda_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help rueda

% Last Modified by GUIDE v2.5 14-Feb-2016 17:10:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @rueda_OpeningFcn, ...
                   'gui_OutputFcn',  @rueda_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before rueda is made visible.
function rueda_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

global llanta1A llanta1B llanta2A llanta2B llanta3A llanta3B;
global  alfa phi arrancar
global vAngular vLineal tiempo
tiempo=0;
vAngular=0; vLineal=0;
alfa=0; phi=0; arrancar=0;

llanta1A=[-3;1]; llanta1B=[-3;2];
llanta2A=[3;1];  llanta2B=[3;2];
llanta3A=[0;4];  llanta3B=[0;5];

RuedaLoco;
set(gcf,'toolbar','figure')      
guidata(hObject, handles);

% UIWAIT makes rueda wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = rueda_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
%% Disminuye alfa
global alfa arrancar;
alfa=alfa-5;
arrancar=0;
if (alfa>=-70)  
    RuedaLoco;
else
    alfa=alfa+5;
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
%% Aumenta alfa
global alfa arrancar;
alfa=alfa+5;
arrancar=0;
if alfa<=70
    RuedaLoco;
else
    alfa=alfa-5;
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
%% arrancar
global tiempo vAngular arrancar;
tiempo  =str2double(get(handles.edit2,'String'));
vAngular=str2double(get(handles.edit1,'String'));

for i=1:tiempo
    arrancar=1;
    RuedaLoco;
	pause(0.01);
end

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
