function varargout = matlabgui(varargin)
%MATLABGUI MATLAB code file for matlabgui.fig
%      MATLABGUI, by itself, creates a new MATLABGUI or raises the existing
%      singleton*.
%
%      H = MATLABGUI returns the handle to a new MATLABGUI or the handle to
%      the existing singleton*.
%
%      MATLABGUI('Property','Value',...) creates a new MATLABGUI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to matlabgui_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      MATLABGUI('CALLBACK') and MATLABGUI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in MATLABGUI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help matlabgui

% Last Modified by GUIDE v2.5 26-Apr-2019 11:52:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @matlabgui_OpeningFcn, ...
                   'gui_OutputFcn',  @matlabgui_OutputFcn, ...
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


% --- Executes just before matlabgui is made visible.
function matlabgui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for matlabgui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes matlabgui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = matlabgui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ReadSensors.
function ReadSensors_Callback(hObject, eventdata, handles)
% hObject    handle to ReadSensors (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
while(1)
[sensorleft, sensorright, delay] = SensorDistance();
set(handles.sensor_left, 'string', sensorleft);
set(handles.sensor_right, 'string', sensorright);
set(handles.delaytime, 'string', delay);
pause(0.5);
speed = str2num(get(handles.speed, 'string'));
direction = str2num(get(handles.direction, 'string'));
[new_speed, new_direction] = drive(speed, direction, 10);
speed= new_speed;
direction = new_direction;
set(handles.speed, 'string', speed);
set(handles.direction, 'string', direction);
end



% --- Executes on button press in OpenConnection.
function OpenConnection_Callback(hObject, eventdata, handles)
% hObject    handle to OpenConnection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Port = '.\\COM10'; %Outgoing COM port 
result = EPOCommunications('open',Port); %Check the value of result
speed = 150;
direction = 150;
set(handles.speed, 'string', speed);
set(handles.direction, 'string', direction);

% --- Executes on button press in CloseConnection.
function CloseConnection_Callback(hObject, eventdata, handles)
% hObject    handle to CloseConnection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
result = EPOCommunications('close'); %Check the value of result 


% --- Executes when entered data in editable cell(s) in sensortable.
function sensortable_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to sensortable (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over ReadSensors.
function ReadSensors_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to ReadSensors (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
