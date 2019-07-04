function varargout = AboutDialog(varargin)
% ABOUTDIALOG MATLAB code for AboutDialog.fig
%      ABOUTDIALOG, by itself, creates a new ABOUTDIALOG or raises the existing
%      singleton*.
%
%      H = ABOUTDIALOG returns the handle to a new ABOUTDIALOG or the handle to
%      the existing singleton*.
%
%      ABOUTDIALOG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ABOUTDIALOG.M with the given input arguments.
%
%      ABOUTDIALOG('Property','Value',...) creates a new ABOUTDIALOG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AboutDialog_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AboutDialog_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AboutDialog

% Last Modified by GUIDE v2.5 04-Jul-2019 20:28:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AboutDialog_OpeningFcn, ...
                   'gui_OutputFcn',  @AboutDialog_OutputFcn, ...
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


% --- Executes just before AboutDialog is made visible.
function AboutDialog_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AboutDialog (see VARARGIN)

% Choose default command line output for AboutDialog
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AboutDialog wait for user response (see UIRESUME)
% uiwait(handles.figure1);
I = imread('pics/joana.jpg');
J = imread('pics/wallace.jpg');
axes(handles.axes1);
imshow(I);
axes(handles.axes2);
imshow(J);

% --- Outputs from this function are returned to the command line.
function varargout = AboutDialog_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close AboutDialog
