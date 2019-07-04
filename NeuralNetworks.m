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

% Last Modified by GUIDE v2.5 04-Jul-2019 11:27:28

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
handles.selectInputButton.Value = false;
initData(handles);

data.runInput = [];
data.runImages = [];
data.testImages = [];
data.testImagesStructure = [];
data.target = [];
data.tr = [];

data.globalPrecision = [];
data.testPrecision = [];

handles.myData = data;
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
    
    %%Arquitectura da Rede Panel
    
    %Camada button init
    set(handles.popupNetLayer,'String','none');
    set(handles.popupNetLayer,'Enable','off');
    handles.popupNetLayer.Value = 1;
    
    %Perceptroes textbox init
    set(handles.textPerceptrao,'String','none');
    set(handles.textPerceptrao,'Enable','off');
    
    %Funcao Trans. Button init
    set(handles.popupFuncTrans,'String','none');
    set(handles.popupFuncTrans,'Enable','off');
    handles.popupFuncTrans.Value = 1;
    
    
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
    handles.popupTrainFunc.Value  = 1;
    handles.popupTrainFunc.Enable = 'off';
    
    handles.textEpoch.String = 'none';
    handles.textEpoch.Enable = 'off';
    
    handles.buttonApplyTrainChanges.Enable = 'off';
    
    hObject.ForegroundColor = 'red';
    %Buttons
    handles.netTrainButton.Enable = 'off';
    handles.netSimButton.Enable = 'off';
    handles.netViewButton.Enable = 'off';
    handles.selectInputButton.Enable = 'off';
    handles.runNetworkButton.Enable = 'off';
    
    
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
[file,path] = uigetfile('*.mat','Select file to Load');

if(isequal(file,0) || isequal(path,0))
    return;
end

try
   load(fullfile(path,file),'net');
catch err
    msgbox('Não foi possivel carregar a rede! error:' + err.message,'Erro','error');
    return;
end

[x,~] = size(net.layers);
handles.popupSelectLayers.Value = x;

handles.createNetButton.Value=true;
updateCreatNetButton(handles);

handles.selectInputButton.Enable = 'on';
handles.createNetButton.UserData = net;

%Update UI
UpdateEpochs(handles);
SelectedLayerUpdate(handles);
UpdateTrainingFuncs(handles);
TransfButtonUpdate(handles);
PerceptronTextUpdate(handles);

msgbox('rede carregada com sucesso!','Sucesso','help');


% --------------------------------------------------------------------
function menuBarAbout_Callback(hObject, eventdata, handles)


% --------------------------------------------------------------------
function menuBarSave_Callback(hObject, eventdata, handles)
net = handles.createNetButton.UserData;
[file,path] = uiputfile('*.mat','Save File','net');

if(isequal(file,0) || isequal(path,0))
    return;
end

try
   save(fullfile(path,file),'net');
catch err
    msgbox('Não foi possivel guardar a rede! error:' + err.message,'Erro','error');
    return;
end
msgbox('rede guardada com sucesso!','Sucesso','help');




% --------------------------------------------------------------------
function menuBarQuit_Callback(hObject, eventdata, handles)
close all;


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
val = str2double(hObject.String);

if( val < 2 || val > 100)
    hObject.String = '10';
end

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
%Check if there are data to train
if(isempty(handles.myData.testImages))
    msgbox('Não existem dados para treino!. Por favor, Selecione os dados!','Erro','error');
    return;
end

%prepare data for training [ sort data add ID to images and etc ]
 images  = handles.myData.testImages;
 struct = handles.myData.testImagesStructure;
 
[target, input] = PrepareTargetForTraining(images,struct);

%get net from data
net = handles.createNetButton.UserData;
[net,tr] = train(net, input, target);

view(net);
disp(tr);

handles.createNetButton.UserData = net;

handles.myData.tr = tr;
handles.myData.testImages = input;
handles.myData.target = target;

guidata(hObject, handles); %updates data above, on the handles structure
handles.netSimButton.Enable = 'on';
handles.selectInputButton.Enable = 'on';


% --- Executes on button press in createNetButton.
function createNetButton_Callback(hObject, eventdata, handles)
%Create net using netSize input from popupBox
updateCreatNetButton(handles);


function updateCreatNetButton(handles)
obj = handles.createNetButton;
if(obj.Value == true)
    netSize = handles.popupSelectLayers.Value;
    net = feedforwardnet([1:netSize]);
    net.layers{1:netSize}.dimensions = 10;
    net.trainFcn = 'traingdx';

    %Store net on button userdata 
    obj.UserData = net;
    obj.String = 'Recriar';
    obj.FontWeight = 'bold';
    obj.ForegroundColor = 'red';
    handles.popupSelectLayers.Enable = 'off';
    handles.menuBarSave.Enable = 'on';
    UpdateNetConfigForm(handles);
else
    obj.String = 'Criar Rede';
    obj.ForegroundColor = 'black';
    obj.FontWeight = 'normal';
    handles.popupSelectLayers.Enable = 'on';
    handles.menuBarSave.Enable = 'off';
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
    
    handles.buttonApplyTrainChanges.Enable = 'on';
    
else
    net = handles.createNetButton.UserData;
    net.divideFcn = 'dividerand';
    
    handles.trainValBox.Enable = 'on';
    handles.testValBox.Enable = 'on';
    handles.evalValBox.Enable = 'on';
    handles.buttonApplyTrainChanges.Enable = 'off';
    
    handles.createNetButton.UserData = net;
end


function trainValBox_Callback(hObject, eventdata, handles)
val = str2double(hObject.String);
if( val < 0 || val > 100)
    hObject.String = '0';
else
    if(val == 100)
        handles.useAllDataCheckBox.Value = true;
        useAllDataCheckBox_Callback(handles.useAllDataCheckBox, eventdata, handles);
    else
        train = str2double(handles.trainValBox.String)/100;
        test  = str2double(handles.testValBox.String)/100;
        eval  = str2double(handles.evalValBox.String)/100;
        
        if((train + test + eval) == 1)
            handles.buttonApplyTrainChanges.Enable = 'on';
        else
            handles.buttonApplyTrainChanges.Enable = 'off';
        end
    end
end
        
    

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
val = str2double(hObject.String);
if( val < 0 || val > 100)
    hObject.String = '0';
else
    train = str2double(handles.trainValBox.String)/100;
    test  = str2double(handles.testValBox.String)/100;
    eval  = str2double(handles.evalValBox.String)/100;
    
    if((train + test + eval) == 1)
        handles.buttonApplyTrainChanges.Enable = 'on';
    else
        handles.buttonApplyTrainChanges.Enable = 'off';
    end
end


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
val = str2double(hObject.String);
if( val < 0 || val > 100)
    hObject.String = '0';
else
    train = str2double(handles.trainValBox.String)/100;
    test  = str2double(handles.testValBox.String)/100;
    eval  = str2double(handles.evalValBox.String)/100;
    
    if((train + test + eval) == 1)
        handles.buttonApplyTrainChanges.Enable = 'on';
    else
        handles.buttonApplyTrainChanges.Enable = 'off';
    end
end


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
net = handles.createNetButton.UserData;

tr      = handles.myData.tr;
input   = handles.myData.testImages;
target  = handles.myData.target;
struct  = handles.myData.testImagesStructure;

testData = handles.useAllDataCheckBox.Value == false;

%Global simulation regarding all data
out = sim(net, input);

a = figure;
plotconfusion(target, out);
set(a,'Name','Resultados Globais','NumberTitle','off');

%Test data simulation, only regarding the test data
if(testData)
    Tinput = input(:, tr.testInd);
    Ttarget = target(:, tr.testInd);
    Tstruct = struct(:, tr.testInd);
    
    Tout = sim(net, Tinput);
    
    a = figure;
    plotconfusion(Ttarget, Tout);
    set(a,'Name','Resultados dos Testes','NumberTitle','off');
else
    Tinput = input;
    Ttarget = target;
    Tstruct = struct;
    Tout = out;
end

set(handles.resultTable, 'ColumnName',[]);
set(handles.resultTable,'ColumnName',{'Type', 'Prediction', 'Wrong?'});
set(handles.resultTable,'Data',[]);

[~,y] = size(Tout);
wrong = cell(1,y);
outF = cell(1,y);
for i = 1 : 1 : y
    temp = max(Tout(:,i));
    switch(temp)
        case Tout(1,i)
            outF(1,i) = cellstr('square');
        
        case Tout(2,i)
            outF(1,i) = cellstr('circle');
            
        case Tout(3,i)
            outF(1,i) = cellstr('triangle');
        
        case Tout(4,i)
            outF(1,i) = cellstr('star');
    end
end

outF = outF';
Tstruct = Tstruct';

for i = 1 : 1 : y
    if(~strcmp(outF{i}, Tstruct{i}))
        wrong(1,i) = cellstr('true');
    end
end

wrong = wrong';
joined = [Tstruct, outF, wrong];

%Set data into the uitable
set(handles.resultTable,'Data',joined);

%Store precision
handles.myData.globalPrecision = round(GetPrecision(target,out),2);

if(testData)
    handles.myData.testPrecision = round(GetPrecision(Ttarget,Tout),2);
else
    handles.myData.testPrecision = 0;
end

%Display precision
handles.textPrecision.String = strcat('Precisão Global: ',num2str(handles.myData.globalPrecision),'%');
handles.textPrecisionTest.String = strcat('Precisão Teste: ',num2str(handles.myData.testPrecision),'%');
plotperf(tr);


% --- Executes on button press in netViewButton.
function netViewButton_Callback(hObject, eventdata, handles)
net = handles.createNetButton.UserData;
view(net);


function textEpoch_Callback(hObject, eventdata, handles)
val = str2double(hObject.String);

if( val < 10 || val > 1000)
    hObject.String = '1000';
end


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
net = handles.createNetButton.UserData;  %get net
index = handles.popupTrainFunc.Value;
train = handles.popupTrainFunc.String{index};

net.trainFcn = train;
net.trainParam.epochs = str2double(handles.textEpoch.String);

handles.createNetButton.UserData = net;
UpdateTrainingFuncs(handles);



% --- Executes on button press in buttonApplyChangesArch.
function buttonApplyChangesArch_Callback(hObject, eventdata, handles)
net = handles.createNetButton.UserData;  %get net
selected = handles.popupNetLayer.Value;  %get selected layer
index = handles.popupFuncTrans.Value;
activation = handles.popupFuncTrans.String{index};

net.layers{selected}.dimensions = str2num(handles.textPerceptrao.String);
net.layers{selected}.transferFcn = activation;

handles.createNetButton.UserData = net;

PerceptronTextUpdate(handles);
TransfButtonUpdate(handles);


% --- Executes on button press in selectInputButton.
function selectInputButton_Callback(hObject, eventdata, handles)
[ files, path ] = uigetfile('*.png','Selecione as images para input','MultiSelect','on');
if isequal(files, 0)
    hObject.Value = false;
    hObject.String = 'Selecione Input';
    hObject.ForegroundColor = 'red';
    hObject.FontWeight = 'bold';
    handles.myData.runInput = [];
    handles.runNetworkButton.Enable = 'off';
    return;
end

%Store net on button userdata 
hObject.String = 'Input Selecionado';
hObject.FontWeight = 'bold';
hObject.ForegroundColor = 'blue';

[handles.myData.runInput, handles.myData.runImages] = LoadSelectedImages(files, path);
handles.runNetworkButton.Enable = 'on';

guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function resultsPanel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resultsPanel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


function confusionMatrixTable_CreateFcn(hObject, eventdata, handles)

function uipanel21_CreateFcn(hObject, eventdata, handles)


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
handles.useAllDataCheckBox.Value = false;

handles.trainValBox.String = '75';
handles.trainValBox.Enable = 'on';

handles.testValBox.String = '15';
handles.testValBox.Enable = 'on';

handles.evalValBox.String = '15';
handles.evalValBox.Enable = 'on';

handles.textEpoch.Enable = 'on';
UpdateEpochs(handles);
handles.buttonApplyTrainChanges.Enable = 'on';

UpdateTrainingFuncs(handles);
handles.popupTrainFunc.Enable = 'on';

%Buttons
handles.netTrainButton.Enable = 'on';
handles.netSimButton.Enable = 'off';
handles.netViewButton.Enable = 'on';

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
options = {'tansig','logsig','purelin','hardlim','tribas'};
options = options';
set(handles.popupFuncTrans,'String',options);

options = [];
options = {'traingdx','traincgp','traincgb','trainoss','traingdm','trainrp','trainscg','traincgb','traincgf','trainbr','trainbfg','trainbfgc'};
options = options';
set(handles.popupTrainFunc,'String',options);



%Function to update Training functions
function UpdateTrainingFuncs(handles)
net = handles.createNetButton.UserData;
fcn = net.trainFcn;
selected = handles.popupTrainFunc.Value;

if(strcmpi(fcn,handles.popupTrainFunc.String{selected}) == true)
    handles.popupTrainFunc.ForegroundColor = 'blue';
else
    handles.popupTrainFunc.ForegroundColor = 'black';
end


% --- Executes on button press in importImageData.
function importImageData_Callback(hObject, eventdata, handles)
path = uigetdir('.\Resources\','Selecione o repositorio de imagens');
if(isequal(path,0))
    return;
end

 if ~exist(fullfile(path,'square'),'dir')
    msgbox('Pasta de quadrados (\squares) nao existe! Os dados não importados','Erro','error');
    return;
 end
 
 if ~exist(fullfile(path,'star'),'dir')
    msgbox('Pasta de estrelas (\stars) não foi encontrada! Os dados não foram importados','Erro','error');
    return;
 end
 
  if ~exist(fullfile(path,'circle'),'dir')
    msgbox('Pasta de circulos (\circles) não foi encontrada! Os dados não foram importados','Erro','error');
    return;
  end
 
  if ~exist(fullfile(path,'triangle'),'dir')
    msgbox('Pasta de triangulos(\triangles) não foi encontrada! Os dados não foram importados','Erro','error');
    return;
  end
  
  [images, struct] = LoadDataSetImages(path);
  
  handles.myData.testImages = images;
  handles.myData.testImagesStructure = struct; 
  
guidata(hObject, handles);


%%Updates Current Training Epochs on the GUI.
function UpdateEpochs(handles)
net = handles.createNetButton.UserData;
val = net.trainParam.epochs;

handles.textEpoch.String = val;


% --- Executes on button press in runNetworkButton.
function runNetworkButton_Callback(hObject, eventdata, handles)
if(isempty(handles.myData.runInput))
    %'Ficheiros para treino não existem. Por favor, importe os dados!'
    msgbox('Input inexistente. Por favor, importe os dados para poder iniciar os testes!','Erro','error');
    %importImageData_Callback(hObject.importImageData, eventdata, handles);
    return;
end

images = handles.myData.runImages;
net = handles.createNetButton.UserData;
out = net(handles.myData.runInput);

handles.myData.out = out;

set(handles.resultTable, 'ColumnName',[]);
set(handles.resultTable,'ColumnName',{'Image', 'Prediction', 'Wrong?'});
set(handles.resultTable,'Data',[]);

[~,y] = size(out);
outF = cell(1,y);
for i = 1 : 1 : y
    temp = max(out(:,i));
    switch(temp)
        case out(1,i)
            outF(1,i) = cellstr('square');
        
        case out(2,i)
            outF(1,i) = cellstr('circle');
            
        case out(3,i)
            outF(1,i) = cellstr('triangle');
        
        case out(4,i)
            outF(1,i) = cellstr('star');
    end
end

outF = outF';
images = images';

joined = [images, outF];
set(handles.resultTable,'Data',joined);

guidata(hObject,handles);
