function varargout = GUI(varargin)
%GUI M-file for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('Property','Value',...) creates a new GUI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to GUI_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      GUI('CALLBACK') and GUI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in GUI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 06-Aug-2018 14:35:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

theImage = imread('Logo_COPPE_-_UFRJ.jpg');
axes(handles.axes2);
imshow(theImage);

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when selected object is changed in ittol.
function ittol_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in ittol 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over radiobutton1.
function radiobutton1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function textfun_Callback(hObject, eventdata, handles)
% hObject    handle to textfun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textfun as text
%        str2double(get(hObject,'String')) returns contents of textfun as a double
handles.funcao = 2.^2;

funct = get(handles.textfun,'String');
funAux = strcat('@(x)',funct);
funt = str2func(funAux);                %Daqui pra cima é a conversão de string para function
set(handles.textfun,'UserData',funt);

intstr = get(handles.editIntervalo,'String');
intdbl = str2num(intstr);



% --- Executes during object creation, after setting all properties.
function textfun_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textfun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in POPUPJAIR.
function POPUPJAIR_Callback(hObject, eventdata, handles)
conteudo=cellstr(get(hObject,'String'));
metodo=conteudo(get(hObject,'Value'));
if strcmp(metodo,'Fibonacci')
    metval=1;
elseif strcmp(metodo,'Razão Aurea')
    metval=2;
elseif strcmp(metodo,'Brendt')
    metval=3;
end
assignin('base','metval',metval);
set(handles.POPUPJAIR,'UserData',metval);


% --- Executes during object creation, after setting all properties.
function POPUPJAIR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to POPUPJAIR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1



function tolerancia_Callback(hObject, eventdata, handles)
% hObject    handle to tolerancia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
funtol = get(handles.tolerancia,'String');
funtol2 = str2double(funtol);
% assignin('base','tol',funtol2);
set(handles.tolerancia,'UserData',funtol2);

% Hints: get(hObject,'String') returns contents of tolerancia as text
%        str2double(get(hObject,'String')) returns contents of tolerancia as a double


% --- Executes during object creation, after setting all properties.
function tolerancia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tolerancia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editIntervalo_Callback(hObject, eventdata, handles)
% hObject    handle to editIntervalo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

intstr = get(handles.editIntervalo,'String');
intdbl = str2num(intstr);
% assignin('base','intervalo',intdbl);
set(handles.editIntervalo, 'UserData' , intdbl);


% Hints: get(hObject,'String') returns contents of editIntervalo as text
%        str2double(get(hObject,'String')) returns contents of editIntervalo as a double


% --- Executes during object creation, after setting all properties.
function editIntervalo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editIntervalo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function MaxIt_Callback(hObject, eventdata, handles)
% hObject    handle to MaxIt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nmax = str2double(get(handles.MaxIt,'String'));
set(handles.MaxIt,'UserData',nmax);
assignin('base','nmax',nmax)

% Hints: get(hObject,'String') returns contents of MaxIt as text
%        str2double(get(hObject,'String')) returns contents of MaxIt as a double



% --- Executes on button press in Confirma.
function Confirma_Callback(hObject, eventdata, handles)
% hObject    handle to Confirma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%Getting data from other functions
%\Begin
% funt = get(handles.textfun,'UserData');
intervalo = get(handles.editIntervalo, 'UserData');
tol = get(handles.tolerancia,'UserData');
n = get(handles.MaxIt,'UserData');
metval = get(handles.POPUPJAIR,'UserData');
%\end

assignin('base','n',n);

Confgui = get(hObject,'Value');
assignin('base','Confirma',Confgui);


aux = get(handles.ittol,'SelectedObject');
met = get(aux,'String');
assignin('base','CritParada',met);

funt = get(handles.textfun,'String');
funAux = strcat('@(x)',funt);
funt = str2func(funAux);                %Daqui pra cima é a conversão de string para function
t1 = intervalo(1);
t2 = intervalo(2);
t=linspace(t1,t2); %Limite do gráfico (TEM QUE POR AINDA)  
a = intervalo(1);
b = intervalo(2);
axes(handles.axes1)
plot(t,funt(t))  %Plot no Axes
hold on
grid
f = funt(t);

[min, fmin, it, a, b] = main (met,funt,f,a,b,tol,n,metval);
hold off

set(handles.TagNumIt,'String',it);
set(handles.Fmin,'String',fmin);
set(handles.Xmin,'String',min);
% assignin('base','fun',funt);            %Armazenamento da função



% --- Executes during object creation, after setting all properties.
function MaxIt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MaxIt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% axis(handles.axes2)
% matlabImage = imread('F:\OLD PC\BACKUP HD 1TB - 03-2016\Acadêmico\Mestrado\2º Período\Otimização\T1\coppe-logo.pdf');
% image(matlabImage)
% axis off
% axis image
% Hint: place code in OpeningFcn to populate axes2
