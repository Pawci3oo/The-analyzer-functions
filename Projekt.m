function varargout = Projekt(varargin)
% PROJEKT MATLAB code for Projekt.fig
%      PROJEKT, by itself, creates a new PROJEKT or raises the existing
%      singleton*.
%
%      H = PROJEKT returns the handle to a new PROJEKT or the handle to
%      the existing singleton*.
%
%      PROJEKT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJEKT.M with the given input arguments.
%
%      PROJEKT('Property','Value',...) creates a new PROJEKT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Projekt_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Projekt_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Projekt

% Last Modified by GUIDE v2.5 16-May-2013 13:15:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Projekt_OpeningFcn, ...
                   'gui_OutputFcn',  @Projekt_OutputFcn, ...
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


% --- Executes just before Projekt is made visible.
function Projekt_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Projekt (see VARARGIN)

% Choose default command line output for Projekt
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Projekt wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Projekt_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Rysuj.
function Rysuj_Callback(hObject, eventdata, handles)
% hObject    handle to Rysuj (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Xmin=floor(handles.SuwakMinX);
Xmax=floor(handles.SuwakMaxX);
x=[Xmin:Xmax]
a=floor(handles.WspolczynnikA);

if get(handles.Funkcja1,'Value')==get(hObject,'Max')%patrz help w Propoerties
        x=[-pi:0.1:pi]
        y=sin(a*x)
        plot(x,y)
        xlabel('X')
        ylabel('Y')
        title('Funkcja y=sin(x*a)')
      % funkcja=inline('y=sin(a*x)')
            %    x = fzero(funkcja(a,x),x(1),a)
        
        
        %l = fzero (inline ('sin (a*x) '),a(1), x(1));
       
       
        %handles.l=l
        %set(handles.Mzerowe,'String',l);
       % set(handles.Przedzialy,'String',h)
        %set(handles.Przedzialy1,'String',o);
       
    elseif get(handles.Funkcja2,'Value')==get(hObject,'Max')
        y=3*a*x.^3+x.^2+5*x+1
        plot(x,y)
        xlabel('X')
        ylabel('Y')
        title('Funkcja y=3*a*x^3+x.^2+5*x+1')
        u=[3*a 1 5 1]
            l=roots(u)
        
        handles.l=l
        set(handles.Mzerowe,'String',l);
        ypoch=diff(y)
        g=roots(ypoch)
        c=g
        h=c(1,1)
        o=c(19,1)
        set(handles.Przedzialy,'String',h)
        set(handles.Przedzialy1,'String',o);
       
elseif get(handles.Funkcja3,'Value')==get(hObject,'Max')
            y=a*x.^2-4*a*x+2*a
            plot(x,y)
            xlabel('X')
            ylabel('Y')
            title('Funkcja y=a*x.^2-4*a*x+2*a')
            u=[a -4*a 2*a]
            l=roots(u)
            handles.l=l
            set(handles.Mzerowe,'String',l);
            xw=((4*a)/2*a)
            h=xw
            o=xw
            set(handles.Przedzialy,'String',h)
            set(handles.Przedzialy1,'String',o);
           
elseif get(handles.Funkcja4,'Value')==get(hObject,'Max')
                 y=x+50
                [x,y]=meshgrid(-3:0.125:3);
                z=sin(x).*cos(a*y);
                mesh(x,y,z)
                xlabel('X')
                ylabel('Y')
                zlabel('Z')
                title('Funkcja z=sin(x).*cos(a*y)')
               % options=[]
               % funkcja=inline('z=sin(x).*cos(a*y)')
              %  x = fzero(funkcja(x,y,a),x(1),a,y)
                
                
end
j=min(y)
k=max(y)
i=mean(y)
handles.j=j
handles.k=k
handles.i=i
set(handles.Obliczenia,'String',j);
set(handles.Obliczenia1,'String',k);
set(handles.Srednia,'String',i);
set(handles.Menuwykresu)
% Update handles structure 
guidata(hObject, handles);




% --- Executes on button press in Zapis.
function Zapis_Callback(hObject, eventdata, handles)
% hObject    handle to Zapis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
j=handles.j
l=handles.l
k=handles.k
i=handles.i
save Zmienne.doc j i k l -ascii
b='Zapisano Pomyslnie!!'
set(handles.zapisano,'String',b)



% --- Executes on slider movement.
function SuwakMinX_Callback(hObject, eventdata, handles)
% hObject    handle to SuwakMinX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.SuwakMinX=get(hObject,'Value');
set(handles.WartoscMinX,'String',floor(get(hObject,'Value'))); 

% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function SuwakMinX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SuwakMinX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function SuwakMaxX_Callback(hObject, eventdata, handles)
% hObject    handle to SuwakMaxX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.SuwakMaxX=get(hObject,'Value');
set(handles.WartoscMaxX,'String',floor(get(hObject,'Value'))); 

% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function SuwakMaxX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SuwakMaxX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[10 10 10]);
end


% --- Executes on slider movement.
function WspolczynnikA_Callback(hObject, eventdata, handles)
% hObject    handle to WspolczynnikA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.WspolczynnikA=get(hObject,'Value');
set(handles.WartoscA,'String',floor(get(hObject,'Value'))); 

% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function WspolczynnikA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WspolczynnikA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Zapis_wykres.
function Zapis_wykres_Callback(hObject, eventdata, handles)
% hObject    handle to Zapis_wykres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fileName,pathName] = uiputfile('*.jpg','Zapisz plik jako JPG:'); 
if fileName == 0; return; end 
FileName = [pathName,fileName]; 
fig1=figure; 
set(fig1,'buttondownfcn','closereq'); 
new_ax = copyobj(handles.axes1,fig1); 
set(new_ax,'units','normalized','position',[0.1 0.1 0.8 0.8]); 
set(findall(fig1),'buttondownfcn','closereq'); 
saveas (gcf,FileName,'jpg' ); 
close(gcf)
b='Zapisano wykres!!'
set(handles.zapisano,'String',b)

% --- Executes on selection change in Menuwykresu.
function Menuwykresu_Callback(hObject, eventdata, handles)
% hObject    handle to Menuwykresu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Menuwykresu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Menuwykresu
contents = get(hObject,'Value');
switch contents
case 1
    set(findobj('type', 'line'), 'color', 'blue');
    
case 2
    set(findobj('type', 'line'), 'color', 'red');
    
case 3
    set(findobj('type', 'line'), 'color', 'green');   
    
case 4
    set(findobj('type', 'line'), 'color', 'yellow');
    
end

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function Menuwykresu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Menuwykresu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Typlinii.
function Typlinii_Callback(hObject, eventdata, handles)
% hObject    handle to Typlinii (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Typlinii contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Typlinii
contents = get(hObject,'Value');
switch contents
case 1
    lineobj = findobj('type', 'line');
    set(lineobj, 'linestyle', '-');
case 2
    lineobj = findobj('type', 'line');
    set(lineobj, 'linestyle', '--');
    
case 3
    lineobj = findobj('type', 'line');
    set(lineobj, 'linestyle', '-.');
case 4
    lineobj = findobj('type', 'line');
    set(lineobj, 'linestyle', ':');
end

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Typlinii_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Typlinii (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Punkty.
function Punkty_Callback(hObject, eventdata, handles)
% hObject    handle to Punkty (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Punkty contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Punkty
contents = get(hObject,'Value');
switch contents
case 1
    lineobj = findobj('type', 'line');
    set(lineobj, 'linestyle', '.');
case 2
    lineobj = findobj('type', 'line');
    set(lineobj, 'linestyle', '+');
    
case 3
    lineobj = findobj('type', 'line');
    set(lineobj, 'linestyle', 'o');
case 4
    lineobj = findobj('type', 'line');
    set(lineobj, 'linestyle', '*');
end

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Punkty_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Punkty (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Typlinii (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5
Xmin=floor(handles.SuwakMinX);
Xmax=floor(handles.SuwakMaxX);
x=[Xmin:Xmax]
a=floor(handles.WspolczynnikA);
y=x+50

if get(handles.Funkcja4,'Value')==get(hObject,'Max')
contents = get(hObject,'Value');

switch contents
case 1
    [x,y]=meshgrid(-3:0.125:3);
    z=sin(x).*cos(a*y);
    mesh(x,y,z)
    title('Analizator przebiegu zmiennoœci funkcji')
    xlabel('X')
    ylabel('Y')
    zlabel('Z')
case 2
    [x,y]=meshgrid(-3:0.125:3);
    z=sin(x).*cos(a*y);
    meshc(x,y,z)
    title('Analizator przebiegu zmiennoœci funkcji')
    xlabel('X')
    ylabel('Y')
    zlabel('Z')
    
case 3
    [x,y]=meshgrid(-3:0.125:3);
    z=sin(x).*cos(a*y);
    contour(x,y,z)
    title('Analizator przebiegu zmiennoœci funkcji')
    xlabel('X')
    ylabel('Y')
    zlabel('Z')
case 4
    [x,y]=meshgrid(-3:0.125:3);
    z=sin(x).*cos(a*y);
    contour3(x,y,z)
    title('Analizator przebiegu zmiennoœci funkcji')
    xlabel('X')
    ylabel('Y')
    zlabel('Z')
case 5
    [x,y]=meshgrid(-3:0.125:3);
    z=sin(x).*cos(a*y);
    surf(x,y,z)
    title('Analizator przebiegu zmiennoœci funkcji')
    xlabel('X')
    ylabel('Y')
    zlabel('Z')
end
end
guidata(hObject, handles);


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
if get(hObject,'Value')==get(hObject,'Max')
    grid on
else grid off
end
