function varargout = NeuralNetworks(varargin)
% NEURALNETWORKS MATLAB code for NeuralNetworks.fig
%      NEURALNETWORKS, by itself, creates a new NEURALNETWORKS or raises the existing
%      singleton*.
%
%      H = NEURALNETWORKS returns the handle to a new NEURALNETWORKS or the handle to
%      the existing singleton*.
%
%      NEURALNETWORKS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEURALNETWORKS.M with the given input arguments.
%
%      NEURALNETWORKS('Property','Value',...) creates a new NEURALNETWORKS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NeuralNetworks_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NeuralNetworks_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NeuralNetworks

% Last Modified by GUIDE v2.5 05-Jul-2018 23:55:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NeuralNetworks_OpeningFcn, ...
                   'gui_OutputFcn',  @NeuralNetworks_OutputFcn, ...
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


% --- Executes just before NeuralNetworks is made visible.
function NeuralNetworks_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NeuralNetworks (see VARARGIN)

set(handles.textPerceptrao,'String','Test');

% Choose default command line output for NeuralNetworks
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes NeuralNetworks wait for user response (see UIRESUME)
% uiwait(handles.mainPanel);


% --- Outputs from this function are returned to the command line.
function varargout = NeuralNetworks_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function barMenuFile_Callback(hObject, eventdata, handles)
% hObject    handle to barMenuFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function barMenuLoad_Callback(hObject, eventdata, handles)
% hObject    handle to barMenuLoad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menuBarAbout_Callback(hObject, eventdata, handles)
% hObject    handle to menuBarAbout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menuBarSave_Callback(hObject, eventdata, handles)
% hObject    handle to menuBarSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menuBarQuit_Callback(hObject, eventdata, handles)
% hObject    handle to menuBarQuit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menuBarCreators_Callback(hObject, eventdata, handles)
% hObject    handle to menuBarCreators (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menuBarSubject_Callback(hObject, eventdata, handles)
% hObject    handle to menuBarSubject (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupSelectLayers.
function popupSelectLayers_Callback(hObject, eventdata, handles)
% hObject    handle to popupSelectLayers (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupSelectLayers contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupSelectLayers


% --- Executes during object creation, after setting all properties.
function popupSelectLayers_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupSelectLayers (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popuoNetLayer.
function popuoNetLayer_Callback(hObject, eventdata, handles)
% hObject    handle to popuoNetLayer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popuoNetLayer contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popuoNetLayer
data = handles.myData;
set(hObject,'String',num2str((1:data.MaxLayers)'));


% --- Executes during object creation, after setting all properties.
function popuoNetLayer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popuoNetLayer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textPerceptrao_Callback(hObject, eventdata, handles)
% hObject    handle to textPerceptrao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textPerceptrao as text
%        str2double(get(hObject,'String')) returns contents of textPerceptrao as a double


% --- Executes during object creation, after setting all properties.
function textPerceptrao_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textPerceptrao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupFuncTrans.
function popupFuncTrans_Callback(hObject, eventdata, handles)
% hObject    handle to popupFuncTrans (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupFuncTrans contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupFuncTrans


% --- Executes during object creation, after setting all properties.
function popupFuncTrans_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupFuncTrans (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in netApplyButton.
function netApplyButton_Callback(hObject, eventdata, handles)
% hObject    handle to netApplyButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in createNetApplyButton.
function createNetApplyButton_Callback(hObject, eventdata, handles)
% hObject    handle to createNetApplyButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
