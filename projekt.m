% Projekt wizualizuje trajektoriê lotu pi³ki rzuconej pod wskazanym przez
% u¿ytkownika k¹tem rzutu oraz prêdkoœci pocz¹tkowej z uwzglêdnieniem
% grawitacji przy pomocy GUI.
%
% Projekt wykonali:
% - Kinga Foss (indeks - 303149)
% - Weronika Czajkowska (indeks - 303144)
% - Mateusz Malanowski (indeks - 303168)

function varargout = projekt(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @projekt_OpeningFcn, ...
                   'gui_OutputFcn',  @projekt_OutputFcn, ...
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




function projekt_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;


guidata(hObject, handles);




function varargout = projekt_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;



function rysuj_Callback(hObject, eventdata, handles)
pp = str2double(handles.ppVal);
gr = 9.81;
hold on
kat = str2double(handles.katVal);
tg = (2*pp.*sin(kat.*(pi/180)))/gr;
t = linspace(0,tg);
vx = pp.*cos(kat.*(pi/180));
vy = pp.*sin(kat.*(pi/180));
x = vx.*t;
y = vy.*t-0.5*gr.*t.^2;
plot(x, y, 'om', 'LineWidth', 1);
hold off

function zamknij_Callback(hObject, eventdata, handles)
close;



function pp_Callback(hObject, eventdata, handles)
handles.ppVal = get(hObject, 'String');
guidata(hObject, handles);

function pp_CreateFcn(hObject, eventdata, handles)





function kat_Callback(hObject, eventdata, handles)
handles.katVal = get(hObject, 'String');
guidata(hObject, handles);



function kat_CreateFcn(hObject, eventdata, handles)


