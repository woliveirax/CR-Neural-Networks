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

% Last Modified by GUIDE v2.5 07-Jul-2018 20:06:22

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

% Choose default command line output for NeuralNetworks
handles.output = hObject;
handles.createNetButton.Value = false;
initData(handles);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes NeuralNetworks wait for user response (see UIRESUME)
% uiwait(handles.mainPanel);

function initData(handles)
    %Criar Rede Panel
    set(handles.popupSelectLayers,'String',(1:5));
    
    %clears net and enable selections
    handles.createNetButton.UserData = [];
    handles.createnetButton.Enable  = 'on';
    handles.popupSelectLayer.Enable = 'on';
    handles.popupSelectLayer.Value = 1;
    
    %%Arquitectura da Rede Panel
    
    %Camada button init
    set(handles.popupNetLayer,'String','none');
    set(handles.popupNetLayer,'Enable','off');
    
    %Perceptroes textbox init
    set(handles.textPerceptrao,'String','none');
    set(handles.textPerceptrao,'Enable','off');
    
    %Funcao Trans. Button init
    set(handles.popupFuncTrans,'String','none');
    set(handles.popupFuncTrans,'Enable','off');
    
    
    handles.buttonApplyChangesArch.Enable = 'off';
    
    %Treino da Rede Panel
    handles.useAllDataCheckBox.Enable = 'off';
    handles.trainValBox.String = 'none';
    handles.trainValBox.Enable = 'off';
    
    handles.testValBox.String = 'none';
    handles.testValBox.Enable = 'off';
    
    handles.evalValBox.String = 'none';
    handles.evalValBox.Enable = 'off';
    
    handles.popupTrainFunc.String = 'none';
    handles.popupTrainFunc.Enable = 'off';
    
    handles.textEpoch.String = 'none';
    handles.textEpoch.Enable = 'off';
    
    handles.buttonApplyTrainChanges.Enable = 'off';
    
    %Buttons
    handles.netTrainButton.Enable = 'off';
    handles.netSimButton.Enable = 'off';
    handles.netViewButton.Enable = 'off';
    
    
    
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


% --- Executes on selection change in popupNetLayer.
function popupNetLayer_Callback(hObject, eventdata, handles)
PerceptronTextUpdate(handles);
TransfButtonUpdate(handles);


% --- Executes during object creation, after setting all properties.
function popupNetLayer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupNetLayer (see GCBO)
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
TransfButtonUpdate(handles); %Check end of file


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


% --- Executes on button press in netTrainButton.
function netTrainButton_Callback(hObject, eventdata, handles)
% hObject    handle to netTrainButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in createNetButton.
function createNetButton_Callback(hObject, eventdata, handles)
%Create net using netSize input from popupBox
if(hObject.Value == true)
    netSize = handles.popupSelectLayers.Value;
    net = feedforwardnet([1:netSize]);
    net.layers{1:netSize}.dimensions = 10;

    %Store net on button userdata 
    hObject.UserData = net;
    hObject.String = 'Recriar';
    hObject.FontWeight = 'bold';
    hObject.ForegroundColor = 'red';
    handles.popupSelectLayers.Enable = 'off';
    UpdateNetConfigForm(handles);
else
    hObject.String = 'Criar Rede';
    hObject.ForegroundColor = 'black';
    hObject.FontWeight = 'normal';
    handles.popupSelectLayers.Enable = 'on';
    initData(handles);
end

    

% --- Executes on button press in useAllDataCheckBox.
function useAllDataCheckBox_Callback(hObject, eventdata, handles)
if(hObject.Value == true)
    net = handles.createNetButton.UserData;
    net.divideFcn = '';
    handles.createNetButton.UserData = net;
    
    handles.trainValBox.Enable = 'off';
    handles.testValBox.Enable = 'off';
    handles.evalValBox.Enable = 'off';
    
    handles.trainValBox.String = '0';
    handles.testValBox.String = '0';
    handles.evalValBox.String = '0';
    
else
    net = handles.createNetButton.UserData;
    net.divideFcn = 'dividerand';
    
    handles.trainValBox.Enable = 'on';
    handles.testValBox.Enable = 'on';
    handles.evalValBox.Enable = 'on';
    
    handles.createNetButton.UserData = net;
end



function trainValBox_Callback(hObject, eventdata, handles)
% hObject    handle to trainValBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of trainValBox as text
%        str2double(get(hObject,'String')) returns contents of trainValBox as a double


% --- Executes during object creation, after setting all properties.
function trainValBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to trainValBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function testValBox_Callback(hObject, eventdata, handles)
% hObject    handle to testValBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of testValBox as text
%        str2double(get(hObject,'String')) returns contents of testValBox as a double


% --- Executes during object creation, after setting all properties.
function testValBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to testValBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function evalValBox_Callback(hObject, eventdata, handles)
% hObject    handle to evalValBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of evalValBox as text
%        str2double(get(hObject,'String')) returns contents of evalValBox as a double


% --- Executes during object creation, after setting all properties.
function evalValBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to evalValBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupTrainFunc.
function popupTrainFunc_Callback(hObject, eventdata, handles)
UpdateTrainingFuncs(handles);

% --- Executes during object creation, after setting all properties.
function popupTrainFunc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupTrainFunc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in netSimButton.
function netSimButton_Callback(hObject, eventdata, handles)
% hObject    handle to netSimButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in netViewButton.
function netViewButton_Callback(hObject, eventdata, handles)
% hObject    handle to netViewButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%My Funcs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function UpdateNetConfigForm(handles)
    
%%Arquitectura da Rede Panel

%Camada button update
SelectedLayerUpdate(handles);
FillDataBoxes(handles);
set(handles.popupNetLayer,'Enable','on');

%Perceptroes textbox init
PerceptronTextUpdate(handles);
set(handles.textPerceptrao,'Enable','on');

%Funcao Trans. Button init
TransfButtonUpdate(handles);
set(handles.popupFuncTrans,'Enable','on');
handles.buttonApplyChangesArch.Enable = 'on';

%Treino da Rede Panel
handles.useAllDataCheckBox.Enable = 'on';
handles.useAllDataCheckBox.Value = true;

handles.trainValBox.String = '0';
handles.trainValBox.Enable = 'off';

handles.testValBox.String = '0';
handles.testValBox.Enable = 'off';

handles.evalValBox.String = '0';
handles.evalValBox.Enable = 'off';

handles.textEpoch.Enable = 'on';
handles.textEpoch.String = '1';
handles.buttonApplyTrainChanges.Enable = 'on';

UpdateTrainingFuncs(handles);
handles.popupTrainFunc.Enable = 'on';

%Buttons
handles.netTrainButton.Enable = 'off';
handles.netSimButton.Enable = 'off';
handles.netViewButton.Enable = 'off';

%Transfer popup drop down updater
function TransfButtonUpdate(handles)
data = handles.createNetButton.UserData; %get net
selected = handles.popupNetLayer.Value;   %get selected layer
fcn = data.layers{selected}.transferFcn;   %ged dimensions from selected layer

selected = handles.popupFuncTrans.Value;

if(strcmpi(fcn,handles.popupFuncTrans.String{selected}) == true)
    handles.popupFuncTrans.ForegroundColor = 'blue';
else
    handles.popupFuncTrans.ForegroundColor = 'black';
end

%Perceptron Data update GUI
function PerceptronTextUpdate(handles)
data = handles.createNetButton.UserData;  %get net
selected = handles.popupNetLayer.Value;   %get selected layer
dim = data.layers{selected}.dimensions;   %ged dimensions from selected layer

set(handles.textPerceptrao,'String',num2str(dim));


%Function to fill ammount of layers for the selected layers
function SelectedLayerUpdate(handles)
val = handles.popupSelectLayers.Value;
array = cell(val + 1,1);
for i=1:val
    array{i,1} = i;
end
array{val + 1,1} = 'output';

handles.popupNetLayer.String = array(:,1);

%Function to fill popup boxes when network is createdw
function FillDataBoxes(handles)

%Fill Transfer func PopUp
options = {'tansig','logsig','purelin','hardlim','hardlims'};
options = options';
set(handles.popupFuncTrans,'String',options);

options = [];
options = {'traingd','traingdx','trainlm'};
options = options';
set(handles.popupTrainFunc,'String',options);



%Function to update Training functions
function UpdateTrainingFuncs(handles)
net = handles.createNetButton.UserData;     %get net
fcn = net.trainFcn;
selected = handles.popupTrainFunc.Value;

if(strcmpi(fcn,handles.popupTrainFunc.String{selected}) == true)
    handles.popupTrainFunc.ForegroundColor = 'blue';
else
    handles.popupTrainFunc.ForegroundColor = 'black';
end



function textEpoch_Callback(hObject, eventdata, handles)
% hObject    handle to textEpoch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textEpoch as text
%        str2double(get(hObject,'String')) returns contents of textEpoch as a double


% --- Executes during object creation, after setting all properties.
function textEpoch_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textEpoch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in buttonApplyTrainChanges.
function buttonApplyTrainChanges_Callback(hObject, eventdata, handles)
% hObject    handle to buttonApplyTrainChanges (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in buttonApplyChangesArch.
function buttonApplyChangesArch_Callback(hObject, eventdata, handles)
% hObject    handle to buttonApplyChangesArch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
